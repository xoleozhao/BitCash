/********************************************************************************
** Form generated from reading UI file 'miningpage.ui'
**
** Created by: Qt User Interface Compiler version 5.9.5
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MININGPAGE_H
#define UI_MININGPAGE_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MiningPage
{
public:
    QVBoxLayout *topLayout;
    QHBoxLayout *horizontalLayout;
    QVBoxLayout *verticalLayout_2;
    QHBoxLayout *horizontalLayout_3;
    QPushButton *startminingbtn;
    QPushButton *stopminingbtn;
    QSpacerItem *verticalSpacer;

    void setupUi(QWidget *MiningPage)
    {
        if (MiningPage->objectName().isEmpty())
            MiningPage->setObjectName(QStringLiteral("MiningPage"));
        MiningPage->resize(927, 622);
        topLayout = new QVBoxLayout(MiningPage);
        topLayout->setObjectName(QStringLiteral("topLayout"));
        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName(QStringLiteral("horizontalLayout"));
        verticalLayout_2 = new QVBoxLayout();
        verticalLayout_2->setObjectName(QStringLiteral("verticalLayout_2"));
        horizontalLayout_3 = new QHBoxLayout();
        horizontalLayout_3->setObjectName(QStringLiteral("horizontalLayout_3"));

        verticalLayout_2->addLayout(horizontalLayout_3);

        startminingbtn = new QPushButton(MiningPage);
        startminingbtn->setObjectName(QStringLiteral("startminingbtn"));

        verticalLayout_2->addWidget(startminingbtn);

        stopminingbtn = new QPushButton(MiningPage);
        stopminingbtn->setObjectName(QStringLiteral("stopminingbtn"));
        stopminingbtn->setEnabled(false);

        verticalLayout_2->addWidget(stopminingbtn);

        verticalSpacer = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout_2->addItem(verticalSpacer);


        horizontalLayout->addLayout(verticalLayout_2);


        topLayout->addLayout(horizontalLayout);


        retranslateUi(MiningPage);

        QMetaObject::connectSlotsByName(MiningPage);
    } // setupUi

    void retranslateUi(QWidget *MiningPage)
    {
        MiningPage->setWindowTitle(QApplication::translate("MiningPage", "Form", Q_NULLPTR));
        startminingbtn->setText(QApplication::translate("MiningPage", "Start mining", Q_NULLPTR));
        stopminingbtn->setText(QApplication::translate("MiningPage", "Stop mining", Q_NULLPTR));
    } // retranslateUi

};

namespace Ui {
    class MiningPage: public Ui_MiningPage {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MININGPAGE_H
