/********************************************************************************
** Form generated from reading UI file 'linkspage.ui'
**
** Created by: Qt User Interface Compiler version 5.9.5
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_LINKSPAGE_H
#define UI_LINKSPAGE_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QFormLayout>
#include <QtWidgets/QFrame>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QListWidget>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>
#include "qt/bitcashamountfield.h"

QT_BEGIN_NAMESPACE

class Ui_LinksPage
{
public:
    QVBoxLayout *topLayout;
    QFrame *frame;
    QFormLayout *formLayout;
    QLabel *label_4;
    QLabel *label;
    QLineEdit *referencelineEdit;
    QLabel *label_2;
    BitcashAmountField *payAmount;
    QPushButton *createlinkbtn;
    QLabel *label_3;
    QListWidget *listWidget;
    QPushButton *CopyLinkBtn;
    QFrame *line;
    QFrame *line_2;
    QLabel *label_5;
    QFrame *line_3;
    QLabel *label_6;
    QLineEdit *PasteEdit;
    QPushButton *ClaimCoinsBtn;
    QLabel *label_7;
    QPushButton *PasteBtn;

    void setupUi(QWidget *LinksPage)
    {
        if (LinksPage->objectName().isEmpty())
            LinksPage->setObjectName(QStringLiteral("LinksPage"));
        LinksPage->resize(927, 622);
        topLayout = new QVBoxLayout(LinksPage);
        topLayout->setObjectName(QStringLiteral("topLayout"));
        frame = new QFrame(LinksPage);
        frame->setObjectName(QStringLiteral("frame"));
        frame->setFrameShape(QFrame::NoFrame);
        frame->setFrameShadow(QFrame::Raised);
        formLayout = new QFormLayout(frame);
        formLayout->setObjectName(QStringLiteral("formLayout"));
        formLayout->setFieldGrowthPolicy(QFormLayout::AllNonFixedFieldsGrow);
        label_4 = new QLabel(frame);
        label_4->setObjectName(QStringLiteral("label_4"));

        formLayout->setWidget(0, QFormLayout::FieldRole, label_4);

        label = new QLabel(frame);
        label->setObjectName(QStringLiteral("label"));

        formLayout->setWidget(1, QFormLayout::LabelRole, label);

        referencelineEdit = new QLineEdit(frame);
        referencelineEdit->setObjectName(QStringLiteral("referencelineEdit"));

        formLayout->setWidget(1, QFormLayout::FieldRole, referencelineEdit);

        label_2 = new QLabel(frame);
        label_2->setObjectName(QStringLiteral("label_2"));

        formLayout->setWidget(4, QFormLayout::LabelRole, label_2);

        payAmount = new BitcashAmountField(frame);
        payAmount->setObjectName(QStringLiteral("payAmount"));

        formLayout->setWidget(4, QFormLayout::FieldRole, payAmount);

        createlinkbtn = new QPushButton(frame);
        createlinkbtn->setObjectName(QStringLiteral("createlinkbtn"));
        QIcon icon;
        icon.addFile(QStringLiteral(":/icons/send"), QSize(), QIcon::Normal, QIcon::Off);
        createlinkbtn->setIcon(icon);

        formLayout->setWidget(5, QFormLayout::FieldRole, createlinkbtn);

        label_3 = new QLabel(frame);
        label_3->setObjectName(QStringLiteral("label_3"));

        formLayout->setWidget(6, QFormLayout::LabelRole, label_3);

        listWidget = new QListWidget(frame);
        listWidget->setObjectName(QStringLiteral("listWidget"));

        formLayout->setWidget(6, QFormLayout::FieldRole, listWidget);

        CopyLinkBtn = new QPushButton(frame);
        CopyLinkBtn->setObjectName(QStringLiteral("CopyLinkBtn"));
        QIcon icon1;
        icon1.addFile(QStringLiteral(":/icons/editcopy"), QSize(), QIcon::Normal, QIcon::Off);
        CopyLinkBtn->setIcon(icon1);

        formLayout->setWidget(7, QFormLayout::FieldRole, CopyLinkBtn);

        line = new QFrame(frame);
        line->setObjectName(QStringLiteral("line"));
        line->setFrameShape(QFrame::HLine);
        line->setFrameShadow(QFrame::Sunken);

        formLayout->setWidget(8, QFormLayout::LabelRole, line);

        line_2 = new QFrame(frame);
        line_2->setObjectName(QStringLiteral("line_2"));
        line_2->setFrameShape(QFrame::HLine);
        line_2->setFrameShadow(QFrame::Sunken);

        formLayout->setWidget(10, QFormLayout::FieldRole, line_2);

        label_5 = new QLabel(frame);
        label_5->setObjectName(QStringLiteral("label_5"));

        formLayout->setWidget(12, QFormLayout::FieldRole, label_5);

        line_3 = new QFrame(frame);
        line_3->setObjectName(QStringLiteral("line_3"));
        line_3->setFrameShape(QFrame::HLine);
        line_3->setFrameShadow(QFrame::Sunken);

        formLayout->setWidget(15, QFormLayout::LabelRole, line_3);

        label_6 = new QLabel(frame);
        label_6->setObjectName(QStringLiteral("label_6"));

        formLayout->setWidget(13, QFormLayout::LabelRole, label_6);

        PasteEdit = new QLineEdit(frame);
        PasteEdit->setObjectName(QStringLiteral("PasteEdit"));

        formLayout->setWidget(13, QFormLayout::FieldRole, PasteEdit);

        ClaimCoinsBtn = new QPushButton(frame);
        ClaimCoinsBtn->setObjectName(QStringLiteral("ClaimCoinsBtn"));
        QIcon icon2;
        icon2.addFile(QStringLiteral(":/icons/receiving_addresses"), QSize(), QIcon::Normal, QIcon::Off);
        ClaimCoinsBtn->setIcon(icon2);

        formLayout->setWidget(15, QFormLayout::FieldRole, ClaimCoinsBtn);

        label_7 = new QLabel(frame);
        label_7->setObjectName(QStringLiteral("label_7"));
        QFont font;
        font.setBold(true);
        font.setWeight(75);
        label_7->setFont(font);

        formLayout->setWidget(8, QFormLayout::FieldRole, label_7);

        PasteBtn = new QPushButton(frame);
        PasteBtn->setObjectName(QStringLiteral("PasteBtn"));
        QIcon icon3;
        icon3.addFile(QStringLiteral(":/icons/editpaste"), QSize(), QIcon::Normal, QIcon::Off);
        PasteBtn->setIcon(icon3);

        formLayout->setWidget(14, QFormLayout::FieldRole, PasteBtn);


        topLayout->addWidget(frame);


        retranslateUi(LinksPage);

        QMetaObject::connectSlotsByName(LinksPage);
    } // setupUi

    void retranslateUi(QWidget *LinksPage)
    {
        LinksPage->setWindowTitle(QApplication::translate("LinksPage", "Form", Q_NULLPTR));
        label_4->setText(QApplication::translate("LinksPage", "Here you can create a link to send coins via email or messenger. You can enter the amount you want to send here.", Q_NULLPTR));
        label->setText(QApplication::translate("LinksPage", "Reference line:", Q_NULLPTR));
        label_2->setText(QApplication::translate("LinksPage", "Amount:", Q_NULLPTR));
        createlinkbtn->setText(QApplication::translate("LinksPage", "Send coins via link", Q_NULLPTR));
        label_3->setText(QApplication::translate("LinksPage", "Created links:", Q_NULLPTR));
        CopyLinkBtn->setText(QApplication::translate("LinksPage", "Copy selected link", Q_NULLPTR));
        label_5->setText(QApplication::translate("LinksPage", "Here you can paste a link which you have received to claim the coins.", Q_NULLPTR));
        label_6->setText(QApplication::translate("LinksPage", "Paste a link here:", Q_NULLPTR));
        ClaimCoinsBtn->setText(QApplication::translate("LinksPage", "Claim coins from link", Q_NULLPTR));
        label_7->setText(QApplication::translate("LinksPage", "Make a copy of the created links before you close this program. Otherwise the coins will be lost forever!!!", Q_NULLPTR));
        PasteBtn->setText(QApplication::translate("LinksPage", "Paste link from clipboard", Q_NULLPTR));
    } // retranslateUi

};

namespace Ui {
    class LinksPage: public Ui_LinksPage {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_LINKSPAGE_H
