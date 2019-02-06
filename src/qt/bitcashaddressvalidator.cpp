// Copyright (c) 2011-2017 The Bitcash Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#include <qt/bitcashaddressvalidator.h>

#include <key_io.h>

/* Base58 characters are:
     "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"

  This is:
  - All numbers except for '0'
  - All upper-case letters except for 'I' and 'O'
  - All lower-case letters except for 'l'
*/

BitcashAddressEntryValidator::BitcashAddressEntryValidator(QObject *parent) :
    QValidator(parent)
{
}

void BitcashAddressEntryValidator::fixup(QString & input) const
{
    // try to fix the string??
    QValidator::fixup(input);
}

QLocale BitcashAddressEntryValidator::locale() const
{
    return QValidator::locale();
}

void BitcashAddressEntryValidator::setLocale(const QLocale & locale)
{
    QValidator::setLocale(locale);
}

QValidator::State BitcashAddressEntryValidator::validate(QString &input, int &pos) const
{
    Q_UNUSED(pos);

    // Empty address is "intermediate" input
    if (input.isEmpty())
        return QValidator::Intermediate;

    // Correction
    for (int idx = 0; idx < input.size();)
    {
        bool removeChar = false;
        QChar ch = input.at(idx);
        // Corrections made are very conservative on purpose, to avoid
        // users unexpectedly getting away with typos that would normally
        // be detected, and thus sending to the wrong address.
        switch(ch.unicode())
        {
        // Qt categorizes these as "Other_Format" not "Separator_Space"
        case 0x200B: // ZERO WIDTH SPACE
        case 0xFEFF: // ZERO WIDTH NO-BREAK SPACE
            removeChar = true;
            break;
        default:
            break;
        }

        // Remove whitespace
        if (ch.isSpace())
            removeChar = true;

        // To next character
        if (removeChar)
            input.remove(idx, 1);
        else
            ++idx;
    }

    // Validation
    QValidator::State state = QValidator::Acceptable;
    for (int idx = 0; idx < input.size(); ++idx)
    {
        int ch = input.at(idx).unicode();

        if (((ch >= '0' && ch<='9') ||
            (ch >= 'a' && ch<='z') ||
            (ch >= 'A' && ch<='Z') ||
            (ch=='@'))/* &&
            ch != 'I' && ch != 'O'*/) // Characters invalid in both Base58 and Bech32
        {
            // Alphanumeric and not a 'forbidden' character
        }
        else
        {
            state = QValidator::Invalid;
        }
    }

    return state;
}

BitcashAddressCheckValidator::BitcashAddressCheckValidator(QObject *parent) :
    QValidator(parent)
{
}

void BitcashAddressCheckValidator::fixup(QString & input) const
{
    // try to fix the string??
    QValidator::fixup(input);
}

QLocale BitcashAddressCheckValidator::locale() const
{
    return QValidator::locale();
}

void BitcashAddressCheckValidator::setLocale(const QLocale & locale)
{
    QValidator::setLocale(locale);
}

QValidator::State BitcashAddressCheckValidator::validate(QString &input, int &pos) const
{
    Q_UNUSED(pos);
    // Validate the passed Bitcash address
    if (IsValidDestinationString(input.toStdString())) {
        return QValidator::Acceptable;
    }

     Q_UNUSED(pos);

    // Empty address is "intermediate" input
    if (input.isEmpty())
        return QValidator::Intermediate;

    // Correction
    for (int idx = 0; idx < input.size();)
    {
        bool removeChar = false;
        QChar ch = input.at(idx);
        // Corrections made are very conservative on purpose, to avoid
        // users unexpectedly getting away with typos that would normally
        // be detected, and thus sending to the wrong address.
        switch(ch.unicode())
        {
        // Qt categorizes these as "Other_Format" not "Separator_Space"
        case 0x200B: // ZERO WIDTH SPACE
        case 0xFEFF: // ZERO WIDTH NO-BREAK SPACE
            removeChar = true;
            break;
        default:
            break;
        }

        // Remove whitespace
        if (ch.isSpace())
            removeChar = true;

        // To next character
        if (removeChar)
            input.remove(idx, 1);
        else
            ++idx;
    }

    // Validation
    QValidator::State state = QValidator::Intermediate;
    for (int idx = 0; idx < input.size(); ++idx)
    {
        int ch = input.at(idx).unicode();

        if (((ch >= '0' && ch<='9') ||
            (ch >= 'a' && ch<='z') ||
            (ch >= 'A' && ch<='Z') ||
            (ch=='@'))/* &&
            ch != 'I' && ch != 'O'*/) // Characters invalid in both Base58 and Bech32
        {
            // Alphanumeric and not a 'forbidden' character
        }
        else
        {
            state = QValidator::Invalid;
        }
    }

    return state;
}

//BitcashAddressCheckValidator2: without @;; BitcashAddressCheckValidator: with @
BitcashAddressCheckValidator2::BitcashAddressCheckValidator2(QObject *parent) :
    QValidator(parent)
{
}

void BitcashAddressCheckValidator2::fixup(QString & input) const
{
    // try to fix the string??
    QValidator::fixup(input);
}

QLocale BitcashAddressCheckValidator2::locale() const
{
    return QValidator::locale();
}

void BitcashAddressCheckValidator2::setLocale(const QLocale & locale)
{
    QValidator::setLocale(locale);
}

QValidator::State BitcashAddressCheckValidator2::validate(QString &input, int &pos) const
{
    Q_UNUSED(pos);
    // Validate the passed Bitcash address
    if (IsValidDestinationString(input.toStdString())) {
        return QValidator::Acceptable;
    }

     Q_UNUSED(pos);

    // Empty address is "intermediate" input
    if (input.isEmpty())
        return QValidator::Intermediate;

    // Correction
    for (int idx = 0; idx < input.size();)
    {
        bool removeChar = false;
        QChar ch = input.at(idx);
        // Corrections made are very conservative on purpose, to avoid
        // users unexpectedly getting away with typos that would normally
        // be detected, and thus sending to the wrong address.
        switch(ch.unicode())
        {
        // Qt categorizes these as "Other_Format" not "Separator_Space"
        case 0x200B: // ZERO WIDTH SPACE
        case 0xFEFF: // ZERO WIDTH NO-BREAK SPACE
            removeChar = true;
            break;
        default:
            break;
        }

        // Remove whitespace
        if (ch.isSpace())
            removeChar = true;

        // To next character
        if (removeChar)
            input.remove(idx, 1);
        else
            ++idx;
    }

    // Validation
    QValidator::State state = QValidator::Intermediate;
    for (int idx = 0; idx < input.size(); ++idx)
    {
        int ch = input.at(idx).unicode();

        if (((ch >= '0' && ch<='9') ||
            (ch >= 'a' && ch<='z') ||
            (ch >= 'A' && ch<='Z') || ch =='_')/* &&
            ch != 'I' && ch != 'O'*/) // Characters invalid in both Base58 and Bech32
        {
            // Alphanumeric and not a 'forbidden' character
        }
        else
        {
            state = QValidator::Invalid;
        }
    }

    return state;
}

BitcashAmountEntryValidator::BitcashAmountEntryValidator(QObject *parent) :
    QValidator(parent)
{
}

void BitcashAmountEntryValidator::fixup(QString & input) const
{
    // try to fix the string??
    QValidator::fixup(input);
}

QLocale BitcashAmountEntryValidator::locale() const
{
    return QValidator::locale();
}

void BitcashAmountEntryValidator::setLocale(const QLocale & locale)
{
    QValidator::setLocale(locale);
}

QValidator::State BitcashAmountEntryValidator::validate(QString &input, int &pos) const
{
    Q_UNUSED(pos);

    // Empty address is "intermediate" input
    if (input.isEmpty())
        return QValidator::Intermediate;

    // Correction
    for (int idx = 0; idx < input.size();)
    {
        bool removeChar = false;
        QChar ch = input.at(idx);
        // Corrections made are very conservative on purpose, to avoid
        // users unexpectedly getting away with typos that would normally
        // be detected, and thus sending to the wrong address.
        switch(ch.unicode())
        {
        // Qt categorizes these as "Other_Format" not "Separator_Space"
        case 0x200B: // ZERO WIDTH SPACE
        case 0xFEFF: // ZERO WIDTH NO-BREAK SPACE
            removeChar = true;
            break;
        default:
            break;
        }

        // Remove whitespace
        if (ch.isSpace())
            removeChar = true;

        // To next character
        if (removeChar)
            input.remove(idx, 1);
        else
            ++idx;
    }

    input.replace(",",".");
    if (input.count(QLatin1Char('.'))>1) {
        return QValidator::Invalid;
    }
    int posdecimal=input.indexOf('.');
    if (posdecimal>=0 && input.size()-posdecimal>10) return QValidator::Invalid;
    if (posdecimal>12) return QValidator::Invalid;
    if (posdecimal==-1 && input.size()>12) return QValidator::Invalid;

    // Validation
    QValidator::State state = QValidator::Acceptable;
    for (int idx = 0; idx < input.size(); ++idx)
    {
        int ch = input.at(idx).unicode();

        if ((ch >= '0' && ch<='9') || ch=='.')
        {

        }
        else
        {
            state = QValidator::Invalid;
        }
    }

    return state;
}

