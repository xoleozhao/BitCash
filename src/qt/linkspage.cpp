// Copyright (c) 2011-2017 The Bitcash Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#include <qt/linkspage.h>
#include <qt/forms/ui_linkspage.h>

#include <qt/bitcashunits.h>
#include <qt/clientmodel.h>
#include <qt/guiconstants.h>
#include <qt/guiutil.h>
#include <qt/optionsmodel.h>
#include <qt/platformstyle.h>
#include <qt/transactionfilterproxy.h>
#include <qt/transactiontablemodel.h>
#include <qt/walletmodel.h>
#include <miner.h>
#include <nicknames.h>
#include <chainparams.h>


#include <QAbstractItemDelegate>
#include <QPainter>
#include <QClipboard>

#define DECORATION_SIZE 54
#define NUM_ITEMS 5

Q_DECLARE_METATYPE(interfaces::WalletBalances)

class LinksDelegate : public QAbstractItemDelegate
{
    Q_OBJECT
public:
    explicit LinksDelegate(const PlatformStyle *_platformStyle, QObject *parent=nullptr):
        QAbstractItemDelegate(parent), unit(BitcashUnits::BITC),
        platformStyle(_platformStyle)
    {

    }

    inline void paint(QPainter *painter, const QStyleOptionViewItem &option,
                      const QModelIndex &index ) const
    {
        painter->save();

        QIcon icon = qvariant_cast<QIcon>(index.data(TransactionTableModel::RawDecorationRole));
        QRect mainRect = option.rect;
        QRect decorationRect(mainRect.topLeft(), QSize(DECORATION_SIZE, DECORATION_SIZE));
        int xspace = DECORATION_SIZE + 8;
        int ypad = 6;
        int halfheight = (mainRect.height() - 2*ypad)/2;
        QRect amountRect(mainRect.left() + xspace, mainRect.top()+ypad, mainRect.width() - xspace, halfheight);
        QRect addressRect(mainRect.left() + xspace, mainRect.top()+ypad+halfheight, mainRect.width() - xspace, halfheight);
        icon = platformStyle->SingleColorIcon(icon);
        icon.paint(painter, decorationRect);

        QDateTime date = index.data(TransactionTableModel::DateRole).toDateTime();
        QString address = index.data(Qt::DisplayRole).toString();
        qint64 amount = index.data(TransactionTableModel::AmountRole).toLongLong();
        bool confirmed = index.data(TransactionTableModel::ConfirmedRole).toBool();
        QVariant value = index.data(Qt::ForegroundRole);
        QColor foreground = option.palette.color(QPalette::Text);
        if(value.canConvert<QBrush>())
        {
            QBrush brush = qvariant_cast<QBrush>(value);
            foreground = brush.color();
        }

        painter->setPen(foreground);
        QRect boundingRect;
        painter->drawText(addressRect, Qt::AlignLeft|Qt::AlignVCenter, address, &boundingRect);

        if (index.data(TransactionTableModel::WatchonlyRole).toBool())
        {
            QIcon iconWatchonly = qvariant_cast<QIcon>(index.data(TransactionTableModel::WatchonlyDecorationRole));
            QRect watchonlyRect(boundingRect.right() + 5, mainRect.top()+ypad+halfheight, 16, halfheight);
            iconWatchonly.paint(painter, watchonlyRect);
        }

        if(amount < 0)
        {
            foreground = COLOR_NEGATIVE;
        }
        else if(!confirmed)
        {
            foreground = COLOR_UNCONFIRMED;
        }
        else
        {
            foreground = option.palette.color(QPalette::Text);
        }
        painter->setPen(foreground);
        QString amountText = BitcashUnits::formatWithUnit(unit, amount, true, BitcashUnits::separatorAlways);
        if(!confirmed)
        {
            amountText = QString("[") + amountText + QString("]");
        }
        painter->drawText(amountRect, Qt::AlignRight|Qt::AlignVCenter, amountText);

        painter->setPen(option.palette.color(QPalette::Text));
        painter->drawText(amountRect, Qt::AlignLeft|Qt::AlignVCenter, GUIUtil::dateTimeStr(date));

        painter->restore();
    }

    inline QSize sizeHint(const QStyleOptionViewItem &option, const QModelIndex &index) const
    {
        return QSize(DECORATION_SIZE, DECORATION_SIZE);
    }

    int unit;
    const PlatformStyle *platformStyle;

};
#include <qt/linkspage.moc>

LinksPage::LinksPage(const PlatformStyle *platformStyle, QWidget *parent) :
    QWidget(parent),
    ui(new Ui::LinksPage),
    clientModel(0),
    walletModel(0),
    txdelegate(new LinksDelegate(platformStyle, this))
{
    ui->setupUi(this);

    m_balances.balance = -1;

    // use a SingleColorIcon for the "out of sync warning" icon
    QIcon icon = platformStyle->SingleColorIcon(":/icons/warning");
    icon.addPixmap(icon.pixmap(QSize(64,64), QIcon::Normal), QIcon::Disabled); // also set the disabled icon because we are using a disabled QPushButton to work around missing HiDPI support of QLabel (https://bugreports.qt.io/browse/QTBUG-42503)

    connect(ui->createlinkbtn, SIGNAL(clicked()), this, SLOT(createlinkClicked()));
    connect(ui->CopyLinkBtn, SIGNAL(clicked()), this, SLOT(CopyLinkClicked()));
    connect(ui->ClaimCoinsBtn, SIGNAL(clicked()), this, SLOT(ClaimCoinsClicked()));
    connect(ui->PasteBtn, SIGNAL(clicked()), this, SLOT(PasteClicked()));

}

void LinksPage::CopyLinkClicked()
{
    const QString& s = ui->listWidget->currentItem()->text();

    QClipboard *p_Clipboard = QApplication::clipboard();
    p_Clipboard->setText(s);
}

void LinksPage::PasteClicked()
{
    QClipboard *p_Clipboard = QApplication::clipboard();
    const QString& s = p_Clipboard->text();
    ui->PasteEdit->setText(s);
}

void LinksPage::ClaimCoinsClicked()
{
    std::string strerr;
    std::string strlink = ui->PasteEdit->text().toStdString(); 
    if (!walletModel->wallet().ClaimFromLink(strlink, strerr))
    {
        QMessageBox::critical(this, tr("Could not claim the coins"),QString::fromStdString(strerr));      
    } else
    {
        ui->PasteEdit->setText(QString::fromStdString(""));
        QMessageBox::information(this, tr("Coins claimed"),tr("A transaction with the coins from the link been successfully created."));
    }
}

void LinksPage::createlinkClicked()
{
    if (!ui->payAmount->validate()) return;

    CAmount nAmount = ui->payAmount->value();
    std::string referenceline = ui->referencelineEdit->text().toStdString(); 
    std::string strlink, strerr;
   
    if (!walletModel->wallet().SendAsLink(nAmount, referenceline, strlink, strerr, 0, 0))
    {
        QMessageBox::critical(this, tr("Could not create link"),QString::fromStdString(strerr));
      
    } else {
        ui->listWidget->addItem(QString::fromStdString(strlink));
        const QString& s = QString::fromStdString(strlink);
        QClipboard *p_Clipboard = QApplication::clipboard();
        p_Clipboard->setText(s);
        QMessageBox::information(this, tr("Link created"),tr("A new link for the coins has been created and copied to the clipboard. Make a copy of this link somewhere or you will not be able to claim these coins later on."));

    }
}


LinksPage::~LinksPage()
{
    delete ui;
}

void LinksPage::setClientModel(ClientModel *model)
{
    this->clientModel = model;
    if(model)
    {
    }
}

void LinksPage::setWalletModel(WalletModel *model)
{
    this->walletModel = model;
    if(model && model->getOptionsModel())
    {
    }
}

