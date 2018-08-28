// Copyright (c) 2011-2017 The Bitcash Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#include <qt/miningpage.h>
#include <qt/forms/ui_miningpage.h>

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
//#include <QQmlError>

#define DECORATION_SIZE 54
#define NUM_ITEMS 5

Q_DECLARE_METATYPE(interfaces::WalletBalances)

class MiningDelegate : public QAbstractItemDelegate
{
    Q_OBJECT
public:
    explicit MiningDelegate(const PlatformStyle *_platformStyle, QObject *parent=nullptr):
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
#include <qt/miningpage.moc>

MiningPage::MiningPage(const PlatformStyle *platformStyle, QWidget *parent) :
    QWidget(parent),
    ui(new Ui::MiningPage),
    clientModel(0),
    walletModel(0),
    txdelegate(new MiningDelegate(platformStyle, this))
{
    ui->setupUi(this);

    m_balances.balance = -1;

    // use a SingleColorIcon for the "out of sync warning" icon
    QIcon icon = platformStyle->SingleColorIcon(":/icons/warning");
    icon.addPixmap(icon.pixmap(QSize(64,64), QIcon::Normal), QIcon::Disabled); // also set the disabled icon because we are using a disabled QPushButton to work around missing HiDPI support of QLabel (https://bugreports.qt.io/browse/QTBUG-42503)

    connect(ui->startminingbtn, SIGNAL(clicked()), this, SLOT(startminingClicked()));
    connect(ui->stopminingbtn, SIGNAL(clicked()), this, SLOT(stopminingClicked()));

/*    ui->quickWidget->setSource(QUrl("qrc:forms/BitCashForm.ui.qml"));
    ui->quickWidget->show(); */
/*    const QSize size(400, 400);

    
    ui->quickWidget->resize(size);
    ui->quickWidget->setResizeMode(QQuickWidget::SizeRootObjectToView);
    ui->quickWidget->show();
*/
/*
     connect(pQMLEngine.get(), &QQmlApplicationEngine::warnings, [this](const QList<QQmlError> &lstWarnings)
     {
         for (const QQmlError & oWarning : lstWarnings)
         {
             LOG_WARNING("QtQuickFilter warning in line %d: %s", oWarning.line(), oWarning.description().toStdString().c_str());
         }
     });*/
 
/*
        const QList<QQmlError> errorList = ui->quickWidget->errors();
        for (const QQmlError &error : errorList) {
//            QMessageLogger(error.url().toString().toLatin1().constData(), error.line(), nullptr).warning()
  //                  << error;
std::cout << error.description().toStdString();
        }
*/

/*
    QQuickView *view = new QQuickView();
    QWidget *container = QWidget::createWindowContainer(view, this);
    container->setMinimumSize(400, 400);
    container->setMaximumSize(400, 400);
    container->setFocusPolicy(Qt::TabFocus);
    view->setSource(QUrl("qrc:forms/BitCashForm.ui.qml"));
    ui->verticalLayout_2->addWidget(container);
*/
}

void MiningPage::startminingClicked()
{
//    std::shared_ptr<CReserveScript> coinbase_script;
//    walletModel->wallet().GetScriptForMining(coinbase_script);

    GenerateBitCash(&walletModel->wallet(), NULL, true, true, -1, 0, 0, Params());
    ui->startminingbtn->setEnabled(false);
    ui->stopminingbtn->setEnabled(true);
}

void MiningPage::stopminingClicked()
{
//    std::shared_ptr<CReserveScript> coinbase_script;
//    walletModel->wallet().GetScriptForMining(coinbase_script);

    GenerateBitCash(&walletModel->wallet(), NULL, true, false, -1, 0, 0, Params());
    ui->startminingbtn->setEnabled(true);
    ui->stopminingbtn->setEnabled(false);
}


MiningPage::~MiningPage()
{
    delete ui;
}

void MiningPage::setClientModel(ClientModel *model)
{
    this->clientModel = model;
    if(model)
    {
    }
}

void MiningPage::setWalletModel(WalletModel *model)
{
    this->walletModel = model;
    if(model && model->getOptionsModel())
    {
    }
}

