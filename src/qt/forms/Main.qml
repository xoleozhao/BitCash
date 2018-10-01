import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.3

Item {    
    width: 1280
    height: 700
    id: rootitem    

    Rectangle {
        id: balancerect
        anchors.left:parent.left
        anchors.top:parent.top
        anchors.right:parent.right
        anchors.bottom:parent.bottom
        color: "#f7f7f7"
    }    

    function setprogressbarlabel(show,infotext) {
        overview.progressinfolabel.visible=show
        overview.progressinfolabel.text=infotext
    }

    function setprogressbarlabel2(show,infotext) {
        overview.progressinfolabel2.visible=show
        overview.progressinfolabel2.text=infotext
    }

    function setprogressbarpercent(show,percent) {
        overview.progressBar.visible=show
        overview.percentlabel.visible=show
        overview.progressBar.value=percent
        overview.percentlabel.text=Math.round(percent*100*100)/100+"%";
    }        

    function setimportprogress(percent) {
        backupwallet.setimportprogressintern(percent)
    }

    function displaymininginfo(msg) {
         mining.displaymininginfointern(msg)
    }

    function startmining(msg) {
        mining.startminingintern()
    }

    function stopmining(msg) {
        mining.stopminingintern(msg)        
    }    

    function setminingstats(graphs,cycles) {
        mining.setminingstatsintern(graphs,cycles)
    }

    function clearsendentries(msg) {
        send.clearsendentriesintern()
     }

    function clearregisternickentries(msg) {
        nicknames.clearregisternickentriesintern()
     }

    function setnicknameerror(msg) {
        nicknames.setnicknameerrorintern(msg)
    }

    function startpaperwallet(msg) {
        backupwallet.visible=false
        paperwallet.visible=true
    }

    function setwalletfolder(folder) {
        backupwallet.setwalletfolderintern(folder)
    }

    function startbackupwallet(msg) {
        paperwallet.visible=false
        backupwallet.visible=true
        backupwallet.tabBar.currentIndex=0
    }

    function startimportkey(msg) {        
        paperwallet.visible=false
        backupwallet.visible=true
        backupwallet.tabBar.currentIndex=1
    }

    function setpaperwalletaddresses(address,privatekey) {
        paperwallet.setpaperwalletaddressesintern(address,privatekey)
        backupwallet.setpaperwalletaddressesintern(address,privatekey)
    }        

    function displayerrormessage(msg) {        
        send.displayerrormessageintern(msg)
        receive.displayerrormessageintern(msg)
/*************************************/
/*
        payments.displayerrormessageintern(msg)*/
/*************************************/
    }

    function displayerrormessageimportkey(msg) {        
        backupwallet.displayerrormessageintern(msg)
    }

    function generatedlink() {    
        send.generatedlinkintern()
    }    

    function twitterlinkokay(msg)
    {     
        twittersuccess.twitteredit.text="https://wallet.choosebitcash.com/twitterlogin.php"
        twittersuccess.text1.text=qsTr("Send the below link directly to the Twitter user so that he/she can claim the coins.\n\n You can even paste the link in public tweets or comments. No need to worry, no other user can gain access to these coins except for the intended Twitter user.\n\nIf you submitted this transaction by accident, you can claim the coins back with your link.")
        twittersuccess.sendcap.text= qsTr("Successfully sent the coins to the Twitter user")
        twittersuccess.sendicon.source= "../res/assets/Miscellaneous/twittericon.png"
        twittersuccess.visible=true
        send.clearsendentriesinterntw()
    }

    function instalinkokay(msg)
    {
        twittersuccess.twitteredit.text="https://wallet.choosebitcash.com/instalogin.php"
        twittersuccess.text1.text=qsTr("Send the below link directly to the Instagram user so that he/she can claim the coins.\n\n You can even paste the link in public posts or comments. No need to worry, no other user can gain access to these coins except for the intended Instagram user.\n\nIf you submitted this transaction by accident, you can claim the coins back with your link.")
        twittersuccess.sendcap.text= qsTr("Successfully sent the coins to the Instagram user")
        twittersuccess.sendicon.source= "../res/assets/Miscellaneous/instaicon.png"
        twittersuccess.visible=true
        send.clearsendentriesinternin()
    }

    function redditlinkokay(msg)
    {
        twittersuccess.twitteredit.text="https://wallet.choosebitcash.com/redditlogin.php"
        twittersuccess.text1.text=qsTr("Send the below link directly to the Reddit user so that he/she can claim the coins.\n\n You can even paste the link in public posts or comments. No need to worry, no other user can gain access to these coins except for the intended Reddit user.\n\nIf you submitted this transaction by accident, you can claim the coins back with your link.")
        twittersuccess.sendcap.text= qsTr("Successfully sent the coins to the Reddit user")
        twittersuccess.sendicon.source= "../res/assets/Miscellaneous/redditicon.png"
        twittersuccess.visible=true
        send.clearsendentriesinternre()
    }

    function setbalances(avail, pending, immature, total, availnum) {
        overview.setbalancesintern(avail, pending, immature, total)
        send.setmaxbalanceintern(avail, availnum)        
    }

    function setreceivingaddress(address,nick) {        
        if (nick!=="")
        {
            receive.setreceivingaddressintern(address,"@"+nick)
            nicknames.setnickname("@"+nick)            
        } else
        {
            receive.setreceivingaddressintern(address,nick)
        }
    }

    function addbitcashexpresslink(link,desc,amount,date) {
        transactions.addbitcashexpresslinkintern(link,desc,amount,date)
        send.descriptionEditan.text=""
        send.amountEditan.text=""
    }
    function addpayment(id,recipient,desc,amount,day,month) {
        payments.addpaymentsintern(id,recipient, desc,amount, day, month)
    }
    function bitcashexpressclaimed() {        
        receive.bitcashexpressclaimedintern()
    }
    function settxdetails(text) {
        transactions.settxdetailsintern(text)
    }        
    function clearpaymentfields(msg) {
        payments.clearpaymentfieldsintern(msg)
    }
    function clearpaymentlistmodel() {
        payments.clearpaymentlistmodelintern()
    }
    function clearlinklistmodel() {
        transactions.clearlinklistmodelintern();
    }
    function closelinksundoinfo(show) {
        transactions.closelinksundoinfointern(show);
    }
    function closepaymentsundoinfo(show) {
        payments.closepaymentsundoinfointern(show);
    }
    function showconfirmtwitter(msg)
    {    
        send.showconfirmtwitterintern(msg)
    }

    function showconfirminsta(msg)
    {
        send.showconfirminstaintern(msg)
    }

    function showconfirmreddit(msg)
    {
        send.showconfirmredditintern(msg)
    }

    signal filtereditchangedsignal(string text)
    signal showtxdetails(int index)
    signal sendBtnSignal(string destination, string label, string description, double amount, bool substractfee)    
    signal sendBtntwSignal(string destination, string description, double amount)
    signal sendBtninSignal(string destination, string description, double amount)
    signal sendBtnreSignal(string destination, string description, double amount)
    signal sendconfirmedBtntwSignal(string destination, string description, double amount)
    signal sendconfirmedBtninSignal(string destination, string description, double amount)
    signal sendconfirmedBtnreSignal(string destination, string description, double amount)
    signal sendlinkBtnSignal(string description, double amount)
    signal claimlinkBtnSignal(string link)
    signal datefiltersignal(int index)
    signal downloadtransactionsSignal()
    signal sendtoTwitterSignal(string twitteruser, string linktosend)
    signal sendtoInstaSignal(string twitteruser, string linktosend)
    signal sendtoRedditSignal(string twitteruser, string linktosend)
    signal createPaymentBtnSignal(string recipient, string description, double amount, int day, int month)

    signal registerNickSignal(string nickname, string address)
    signal minereducedSignal(bool isreduced)
    signal deletelinksignal(string link)

    signal startMiningSignal()
    signal stopMiningSignal()
    signal helpSignal()
    signal undolinkremovalSignal()
    signal undopaymentremovalSignal()
    signal generatepaperwalletSignal()
    signal printpaperwalletSignal()
    signal backupwalletfileSignal()
    signal backupBtnSignal()
    signal importkeySignal(string key)
    signal deletepaymentsignal(string idstr)

    SwipeView {
        id: swipeView
        //interactive: false
        anchors.top: tabBar.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        currentIndex: tabBar.currentIndex
        Overview {
            id: overview
            onStartMiningSignalInternoverview: tabBar.currentIndex=tabBar.currentIndex+1
            onStartBackupSignalInternoverview: backupBtnSignal();
        }
        Mining{
            id: mining
            onStartMiningSignalIntern: startMiningSignal()
            onStopMiningSignalIntern: stopMiningSignal()
            onMinereducedSignalIntern: minereducedSignal(isreduced)
        }

        Send{
            id: send            
            onSendBtnSignalIntern: sendBtnSignal(destination,label,description,amount,substractfee)
            onSendBtntwSignalIntern: sendBtntwSignal(destination,description,amount)
            onSendconfirmedBtntwSignalIntern: sendconfirmedBtntwSignal(destination,description,amount)
            onSendBtninSignalIntern: sendBtninSignal(destination,description,amount)
            onSendconfirmedBtninSignalIntern: sendconfirmedBtninSignal(destination,description,amount)
            onSendBtnreSignalIntern: sendBtnreSignal(destination,description,amount)
            onSendconfirmedBtnreSignalIntern: sendconfirmedBtnreSignal(destination,description,amount)
            onSendlinkBtnSignalIntern: sendlinkBtnSignal(description, amount)
            onSendtoanyoneSignalIntern: gotosendtoanyone()
            onViewaccounthistorysignal:{
                tabBar.currentIndex=tabBar.currentIndex+2
            }
            onGotooverviewsignal: {
                tabBar.currentIndex=tabBar.currentIndex-2
            }
        }

        Receive{
            id: receive
            onGotocreatenicksignal:tabBar.currentIndex=tabBar.currentIndex+2
            onClaimlinkBtnSignalIntern: claimlinkBtnSignal(link)

        }

        Transactions{
            id: transactions
            onShowtxdetailsintern:showtxdetails(index)
            onFiltereditchangedsignalintern:filtereditchangedsignal(text)
            onDatefiltersignalintern:datefiltersignal(index)
            onDownloadtransactionsSignalintern: downloadtransactionsSignal()
            onDeletelinksignalintern: deletelinksignal(link)
            onUndolinkremovalSignalintern: undolinkremovalSignal()
        }

        Nicknames{
            id: nicknames
            onRegisterNickSignalIntern: registerNickSignal(nickname, address)
        }
/********************************/
        /*Payments{
            id: payments
            onCreatePaymentBtnSignalIntern: createPaymentBtnSignal(recipient, description, amount, day, month)
            onDeletepaymentsignalintern: deletepaymentsignal(idstr)
            onUndopaymentremovalSignalintern: undopaymentremovalSignal()
        }*/
/**************************************/
    }   

    TabBar {
        id: tabBar
        font.capitalization: Font.MixedCase
        font.family: "Montserrat SemiBold"
        currentIndex: swipeView.currentIndex
        width: parent.width
        height: 60
        position: TabBar.Header
        font.weight: Font.DemiBold
        font.pixelSize: 14


        TabButton {
            id: tabButton1
            y: 0
            text: qsTr("Overview")
            rightPadding: 15
            leftPadding: 58
            width: implicitWidth
            height: 60
            contentItem: Text {
                id: textoverview
                x: 58
                text: parent.text
                font: parent.font
                opacity: enabled ? 1.0 : 0.3
                color: "#4d505e"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            onCheckedChanged: {
                if (checked) {
                    textoverview.color="#202124"
                    imageoverview.source="../res/assets/Navigation/overview-active.png";

                }else {
                    textoverview.color="#4d505e"
                    imageoverview.source="../res/assets/Navigation/overview-inactive.png";
                }
            }

            Image {
                id: imageoverview
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 30
                fillMode: Image.PreserveAspectFit
                source: "../res/assets/Navigation/overview-inactive.png"
            }
        }

        TabButton {
            id: tabButton
            text: qsTr("Mining")
            rightPadding: 15
            font.capitalization: Font.MixedCase
            leftPadding: 41
            width: implicitWidth
            height: 60

            contentItem: Text {
                id: textmining
                text: parent.text
                font: parent.font
                opacity: enabled ? 1.0 : 0.3
                color: "#4d505e"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            onCheckedChanged: {
                if (checked) {
                    textmining.color="#202124"
                    imagemining.source="../res/assets/Navigation/mining-active.png";

                }else {
                    textmining.color="#4d505e"
                    imagemining.source="../res/assets/Navigation/mining-inactive.png";
                }
            }

            Image {
                id: imagemining
                anchors.left: parent.left
                anchors.leftMargin: 15
                width: 16
                height: 16
                anchors.verticalCenter: parent.verticalCenter
                fillMode: Image.PreserveAspectFit
                source: "../res/assets/Navigation/mining-inactive.png"
            }
        }

        TabButton {
            id:mytab
            text: qsTr("Send")
            rightPadding: 15
            leftPadding: 41
            padding: 12
            width: implicitWidth
            height: 60
            contentItem: Text {
                id: textsend
                font: parent.font
                opacity: enabled ? 1.0 : 0.3
                color: "#4d505e"
                text: "Send"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            onCheckedChanged: {
                if (checked) {
                    textsend.color="#202124"
                    imagesend.source="../res/assets/Navigation/send-active.png";

                }else {
                    textsend.color="#4d505e"
                    imagesend.source="../res/assets/Navigation/send-inactive.png";
                }
            }
            Image {
                id:imagesend
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 15
                fillMode: Image.PreserveAspectFit
                source: "../res/assets/Navigation/send-inactive.png"
            }
        }

        TabButton {
            id: tabButton3
            text: qsTr("Receive")
            rightPadding: 15
            leftPadding: 41
            width: implicitWidth
            height: 60
            contentItem: Text {
                id: textreceive
                text: parent.text
                font: parent.font
                opacity: enabled ? 1.0 : 0.3
                color: "#4d505e"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            onCheckedChanged: {
                if (checked) {
                    textreceive.color="#202124"
                    imagereceive.source="../res/assets/Navigation/receive-active.png";

                }else {
                    textreceive.color="#4d505e"
                    imagereceive.source="../res/assets/Navigation/receive-inactive.png";
                }
            }
            Image {
                id: imagereceive
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 15
                fillMode: Image.PreserveAspectFit
                source: "../res/assets/Navigation/receive-inactive.png"
            }
        }

        TabButton {
            id: tabButton4
            text: qsTr("History")
            rightPadding: 15
            leftPadding: 41
            width: implicitWidth
            height: 60
            contentItem: Text {
                id: texthistory
                text: parent.text
                font: parent.font
                opacity: enabled ? 1.0 : 0.3
                color: "#4d505e"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            onCheckedChanged: {
                if (checked) {
                    texthistory.color="#202124"
                    imagehistory.source="../res/assets/Navigation/history-active.png";

                }else {
                    texthistory.color="#4d505e"
                    imagehistory.source="../res/assets/Navigation/history-inactive.png";
                }
            }
            Image {
                id: imagehistory
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 15
                fillMode: Image.PreserveAspectFit
                source: "../res/assets/Navigation/history-inactive.png"
            }
        }       

        TabButton {
            id: tabButton5
            text: qsTr("Create your nickname")
            rightPadding: 15
            leftPadding: 45
            width: implicitWidth
            height: 60
            contentItem: Text {
                id: textnicknames
                text: parent.text
                font: parent.font
                opacity: enabled ? 1.0 : 0.3
                color: "#4d505e"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            onCheckedChanged: {
                if (checked) {
                    textnicknames.color="#202124"
                    imagenicknames.source="../res/assets/Navigation/create-your-nickname-active.png";

                }else {
                    textnicknames.color="#4d505e"
                    imagenicknames.source="../res/assets/Navigation/create-your-nickname-inactive.png";
                }
            }
            Image {
                id: imagenicknames
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 15
                fillMode: Image.PreserveAspectFit
                source: "../res/assets/Navigation/create-your-nickname-inactive.png"
            }
        }
/*****************************************/
        /*TabButton {
            id: tabButton6
            text: qsTr("Recurring payments")
            rightPadding: 15
            leftPadding: 45
            width: implicitWidth
            height: 60
            contentItem: Text {
                id: textpayments
                text: parent.text
                font: parent.font
                opacity: enabled ? 1.0 : 0.3
                color: "#4d505e"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            onCheckedChanged: {
                if (checked) {
                    textnicknames.color="#202124"
                    imagenicknames.source="../res/assets/Navigation/create-your-nickname-active.png";

                }else {
                    textnicknames.color="#4d505e"
                    imagenicknames.source="../res/assets/Navigation/create-your-nickname-inactive.png";
                }
            }
            Image {
                id: imagepayments
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 15
                fillMode: Image.PreserveAspectFit
                source: "../res/assets/Navigation/create-your-nickname-inactive.png"
            }
        }*/
/********************************************/
    }

    Button {
        id: helpbtn
        onClicked: helpSignal()
        anchors.right: parent.right
        anchors.rightMargin: 30
        anchors.top: parent.top
        anchors.topMargin: 16
        width: 16
        height: 16
        background: Image {            
            fillMode: Image.PreserveAspectFit
            source: "../res/assets/Navigation/help-inactive.png"
        }
    }


    Paperwallet
    {
        id: paperwallet
        onGeneratepaperwalletSignalintern: generatepaperwalletSignal()
        onPrintpaperwalletSignalintern: printpaperwalletSignal()
    }

    Backupwallet
    {
        id: backupwallet
        onPrintpaperwalletSignalintern: printpaperwalletSignal()
        onBackupwalletfileSignalintern: backupwalletfileSignal()
        onImportkeySignalintern: importkeySignal(key)
    }        
    TwitterSuccess
    {
        id: twittersuccess
    }

}
