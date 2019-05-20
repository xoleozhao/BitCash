/********************************************************************************
** Form generated from reading UI file 'nicknamepage.ui'
**
** Created by: Qt User Interface Compiler version 5.9.5
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_NICKNAMEPAGE_H
#define UI_NICKNAMEPAGE_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>
#include "qt/qvalidatedlineedit.h"

QT_BEGIN_NAMESPACE

class Ui_NicknamePage
{
public:
    QVBoxLayout *topLayout;
    QLabel *labelAlerts;
    QHBoxLayout *horizontalLayout;
    QVBoxLayout *verticalLayout_2;
    QHBoxLayout *horizontalLayout_3;
    QLabel *label;
    QValidatedLineEdit *NewNicknameEdit;
    QLabel *label_2;
    QValidatedLineEdit *NickAddressEdit;
    QPushButton *RegisterNicknameBtn;
    QSpacerItem *verticalSpacer;

    void setupUi(QWidget *NicknamePage)
    {
        if (NicknamePage->objectName().isEmpty())
            NicknamePage->setObjectName(QStringLiteral("NicknamePage"));
        NicknamePage->resize(927, 622);
        topLayout = new QVBoxLayout(NicknamePage);
        topLayout->setObjectName(QStringLiteral("topLayout"));
        labelAlerts = new QLabel(NicknamePage);
        labelAlerts->setObjectName(QStringLiteral("labelAlerts"));
        labelAlerts->setVisible(false);
        labelAlerts->setStyleSheet(QStringLiteral("QLabel { background-color: qlineargradient(x1: 0, y1: 0, x2: 1, y2: 0, stop:0 #F0D0A0, stop:1 #F8D488); color:#000000; }"));
        labelAlerts->setWordWrap(true);
        labelAlerts->setMargin(3);
        labelAlerts->setTextInteractionFlags(Qt::TextSelectableByMouse);

        topLayout->addWidget(labelAlerts);

        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName(QStringLiteral("horizontalLayout"));
        verticalLayout_2 = new QVBoxLayout();
        verticalLayout_2->setObjectName(QStringLiteral("verticalLayout_2"));
        horizontalLayout_3 = new QHBoxLayout();
        horizontalLayout_3->setObjectName(QStringLiteral("horizontalLayout_3"));

        verticalLayout_2->addLayout(horizontalLayout_3);

        label = new QLabel(NicknamePage);
        label->setObjectName(QStringLiteral("label"));

        verticalLayout_2->addWidget(label);

        NewNicknameEdit = new QValidatedLineEdit(NicknamePage);
        NewNicknameEdit->setObjectName(QStringLiteral("NewNicknameEdit"));

        verticalLayout_2->addWidget(NewNicknameEdit);

        label_2 = new QLabel(NicknamePage);
        label_2->setObjectName(QStringLiteral("label_2"));

        verticalLayout_2->addWidget(label_2);

        NickAddressEdit = new QValidatedLineEdit(NicknamePage);
        NickAddressEdit->setObjectName(QStringLiteral("NickAddressEdit"));

        verticalLayout_2->addWidget(NickAddressEdit);

        RegisterNicknameBtn = new QPushButton(NicknamePage);
        RegisterNicknameBtn->setObjectName(QStringLiteral("RegisterNicknameBtn"));

        verticalLayout_2->addWidget(RegisterNicknameBtn);

        verticalSpacer = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout_2->addItem(verticalSpacer);


        horizontalLayout->addLayout(verticalLayout_2);

        horizontalLayout->setStretch(0, 1);

        topLayout->addLayout(horizontalLayout);


        retranslateUi(NicknamePage);

        QMetaObject::connectSlotsByName(NicknamePage);
    } // setupUi

    void retranslateUi(QWidget *NicknamePage)
    {
        NicknamePage->setWindowTitle(QApplication::translate("NicknamePage", "Form", Q_NULLPTR));
        label->setText(QApplication::translate("NicknamePage", "New nickname:", Q_NULLPTR));
        label_2->setText(QApplication::translate("NicknamePage", "Address for the nickname:", Q_NULLPTR));
        RegisterNicknameBtn->setText(QApplication::translate("NicknamePage", "Register new nickname for your address", Q_NULLPTR));
    } // retranslateUi

};

namespace Ui {
    class NicknamePage: public Ui_NicknamePage {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_NICKNAMEPAGE_H
