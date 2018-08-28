// Copyright (c) 2011-2017 The Bitcash Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef BITCASH_QT_NICKNAMEPAGE_H
#define BITCASH_QT_NICKNAMEPAGE_H

#include <interfaces/wallet.h>

#include <QWidget>
#include <memory>

class ClientModel;
class TransactionFilterProxy;
class NickDelegate;
class PlatformStyle;
class WalletModel;

namespace Ui {
    class NicknamePage;
}

QT_BEGIN_NAMESPACE
class QModelIndex;
QT_END_NAMESPACE

/** Nickname page widget */
class NicknamePage : public QWidget
{
    Q_OBJECT

public:
    explicit NicknamePage(const PlatformStyle *platformStyle, QWidget *parent = 0);
    ~NicknamePage();

    void setClientModel(ClientModel *clientModel);
    void setWalletModel(WalletModel *walletModel);
    void showOutOfSyncWarning(bool fShow);

public Q_SLOTS:


Q_SIGNALS:
    void transactionClicked(const QModelIndex &index);
    void outOfSyncWarningClicked();

private:
    Ui::NicknamePage *ui;
    ClientModel *clientModel;
    WalletModel *walletModel;
    interfaces::WalletBalances m_balances;

    NickDelegate *txdelegate;
    std::unique_ptr<TransactionFilterProxy> filter;

private Q_SLOTS:
    void RegisterNicknameClicked();
};

#endif // BITCASH_QT_NICKNAMEPAGE_H
