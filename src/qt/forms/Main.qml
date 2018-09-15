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
        sendlinks.displayerrormessageintern(msg)
    }

    function displayerrormessageimportkey(msg) {        
        backupwallet.displayerrormessageintern(msg)
    }

    function generatedlink() {
        sendlinks.generatedlinkintern()
    }

    function twitterlinkerror(msg)
    {
        twitter.displayerrormessageintern("Error: "+msg);
    }

    function twitterlinkokay(msg)
    {
        twitter.visible=false
        twittersuccess.visible=true;
    }

    function setbalances(avail, pending, immature, total, availnum) {
        overview.setbalancesintern(avail, pending, immature, total)
        send.setmaxbalanceintern(avail, availnum)
        sendlinks.setmaxbalanceintern(avail, availnum)
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
        sendlinks.addbitcashexpresslinkintern(link,desc,amount,date)
    }
    function bitcashexpressclaimed() {
        sendlinks.bitcashexpressclaimedintern()
    }
    function settxdetails(text) {
        transactions.settxdetailsintern(text)
    }
    function clearlinklistmodel() {
        sendlinks.clearlinklistmodelintern();
    }
    function closelinksundoinfo(show) {
        sendlinks.closelinksundoinfointern(show);
    }


    signal filtereditchangedsignal(string text)
    signal showtxdetails(int index)
    signal sendBtnSignal(string destination, string label, string description, double amount, bool substractfee)    
    signal sendlinkBtnSignal(string description, double amount)
    signal claimlinkBtnSignal(string link)
    signal datefiltersignal(int index)
    signal downloadtransactionsSignal()
    signal sendtoTwitterSignal(string twitteruser, string linktosend)

    signal registerNickSignal(string nickname, string address)
    signal minereducedSignal(bool isreduced)
    signal deletelinksignal(string link)

    signal startMiningSignal()
    signal stopMiningSignal()
    signal helpSignal()
    signal undolinkremovalSignal()
    signal generatepaperwalletSignal()
    signal printpaperwalletSignal()
    signal backupwalletfileSignal()
    signal backupBtnSignal()
    signal importkeySignal(string key)

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
            onSendtoanyoneSignalIntern: tabBar.currentIndex=tabBar.currentIndex+1
            onViewaccounthistorysignal:{
                tabBar.currentIndex=tabBar.currentIndex+3
            }
            onGotooverviewsignal: {
                tabBar.currentIndex=tabBar.currentIndex-2
            }
        }
        SendLinks{
            id: sendlinks
            onSendlinkBtnSignalIntern: sendlinkBtnSignal(description, amount)
            onClaimlinkBtnSignalIntern: claimlinkBtnSignal(link)
            onDeletelinksignalintern: deletelinksignal(link)
            onUndolinkremovalSignalintern: undolinkremovalSignal()
            onSendToTwittersignalintern:{
                twitter.twitteredit.text="";
                twitter.visible=true
                twitter.linktosend=name
            }
        }

        Receive{
            id: receive
            onGotocreatenicksignal:tabBar.currentIndex=tabBar.currentIndex+2

        }

        Transactions{
            id: transactions
            onShowtxdetailsintern:showtxdetails(index)
            onFiltereditchangedsignalintern:filtereditchangedsignal(text)
            onDatefiltersignalintern:datefiltersignal(index)
            onDownloadtransactionsSignalintern: downloadtransactionsSignal()
        }

        Nicknames{
            id: nicknames
            onRegisterNickSignalIntern: registerNickSignal(nickname, address)
        }

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
            id: tabButton2
            text: qsTr("Send to anyone")
            rightPadding: 15
            leftPadding: 37
            width: implicitWidth
            height: 60
            contentItem: Text {
                id: textsendtoanyone
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
                    textsendtoanyone.color="#202124"
                    imagesendtoanyone.source="../res/assets/Navigation/send-to-anyone-active.png";

                }else {
                    textsendtoanyone.color="#4d505e"
                    imagesendtoanyone.source="../res/assets/Navigation/send-to-anyone-inactive.png";
                }
            }
            Image {
                id: imagesendtoanyone
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 15
                fillMode: Image.PreserveAspectFit
                source: "../res/assets/Navigation/send-to-anyone-inactive.png"
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
    Twitter
    {
        id: twitter
        sendBtn.onClicked: {
            if (twitteredit.text==="")
            {
                displayerrormessageintern("Please fill out the field for the Twitter user name.")
            }else {
                sendtoTwitterSignal(twitteredit.text,linktosend)
            }
        }
    }
    TwitterSuccess
    {
        id: twittersuccess
    }

}
