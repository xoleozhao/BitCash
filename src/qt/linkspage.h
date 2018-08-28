// Copyright (c) 2011-2017 The Bitcash Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef BITCASH_QT_LINKSPAGE_H
#define BITCASH_QT_LINKSPAGE_H

#include <interfaces/wallet.h>

#include <QWidget>
#include <memory>

class ClientModel;
class TransactionFilterProxy;
class LinksDelegate;
class PlatformStyle;
class WalletModel;

namespace Ui {
    class LinksPage;
}

QT_BEGIN_NAMESPACE
class QModelIndex;
QT_END_NAMESPACE

/** Links page widget */
class LinksPage : public QWidget
{
    Q_OBJECT

public:
    explicit LinksPage(const PlatformStyle *platformStyle, QWidget *parent = 0);
    ~LinksPage();

    void setClientModel(ClientModel *clientModel);
    void setWalletModel(WalletModel *walletModel);

public Q_SLOTS:

Q_SIGNALS:

private:
    Ui::LinksPage *ui;
    ClientModel *clientModel;
    WalletModel *walletModel;
    interfaces::WalletBalances m_balances;

    LinksDelegate *txdelegate;
    std::unique_ptr<TransactionFilterProxy> filter;

private Q_SLOTS:
    void createlinkClicked();
    void CopyLinkClicked();
    void ClaimCoinsClicked();
    void PasteClicked();
};

#endif // BITCASH_QT_LINKSPAGE_H
