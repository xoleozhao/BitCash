import QtQuick 2.7
import QtQuick.Controls 2.0
import DestCheckValidator 1.0
import AmountEntryValidator 1.0
import DestCheckValidator2 1.0

SendForm {    
    signal sendBtnSignalIntern(string destination, string label, string description, double amount, bool substractfee)
    signal sendBtntwSignalIntern(string destination, string description, double amount)
    signal sendconfirmedBtntwSignalIntern(string destination, string description, double amount)
    signal sendlinkBtnSignalIntern(string description, double amount)
    signal sendtoanyoneSignalIntern()
    signal viewaccounthistorysignal()
    signal gotooverviewsignal()

    Timer {
        id: timer
        function setTimeout(cb, delayTime) {
            timer.interval = delayTime
            timer.repeat = false
            timer.triggered.connect(cb)
            timer.triggered.connect(function () {
                timer.triggered.disconnect(cb) // This is important
            })
            timer.start()
        }
    }
    function displayerrormessageintern(msg) {
        errorlabel.text=msg
        infoboxerror.visible=true
        timer.setTimeout(function(){
            infoboxerror.visible=false
        }, 5000);
    }

    function gotosendtoanyone()
    {
        tabBar.currentIndex=2
    }

    function generatedlinkintern() {
        text11.text=qsTr("You have successfully generated a link which you can send to anyone. The link has been copied to the clipboard.")
        toolBar2.visible=true;
        timer.setTimeout(function(){
            toolBar2.visible=false
        }, 5000);
    }

    function showconfirmtwitterintern(msg)
    {
        if (descriptionEdittw.text!=""){
            confirmtext.text= "You're about to send "+amountEdittw.text+" BITC for '"+descriptionEdittw.text+"' to @"+paytoEdittw.text+". Please confirm this transaction."
        }else
        {
            confirmtext.text= "You're about to send "+amountEdittw.text+" BITC to @"+paytoEdittw.text+". Please confirm this transaction."
        }
        twitteruser.text=msg;
        twitteruser2.text="@"+paytoEdittw.text;
        profileimage.source="https://wallet.choosebitcash.com/gettwitteruserpic.php?twitteruser="+paytoEdittw.text;
        whitebox.visible=false
        whitebox2.visible=false
        whitebox3.visible=true
    }

    function clearsendentriesintern(msg) {
        paytoEdit.text=""
        labelEdit.text=""
        descriptionEdit.text=""
        amountEdit.text=""       
        whitebox2.visible=true
        whitebox.visible=false
        whitebox3.visible=false
    }

    function clearsendentriesinterntw(msg) {
        paytoEdittw.text=""
        labelEdittw.text=""
        descriptionEdittw.text=""
        amountEdittw.text=""
        whitebox2.visible=false
        whitebox.visible=true
        whitebox3.visible=false
    }

    property real maxbalancenum : 0

    function setleftamountbalanceitern(left) {

    }

    property real leftbalance: 0
    property real leftbalancetw: 0
    property real leftbalancean: 0

    function calcleftbalance()
    {
        leftbalance=maxbalancenum-amountEdit.text
        if (leftbalance<0)leftbalance=0
        leftamountlabel.text=leftbalance
    }

    function calcleftbalancetw()
    {
        leftbalancetw=maxbalancenum-amountEdittw.text
        if (leftbalancetw<0)leftbalancetw=0
        leftamountlabeltw.text=leftbalancetw
    }

    function calcleftbalancean()
    {
        leftbalancean=maxbalancenum-amountEditan.text
        if (leftbalancean<0)leftbalancean=0
        leftamountlabelan.text=leftbalancean
    }

    function setmaxbalanceintern(avail,availnum) {
        maxbalance.text=avail
        maxbalancenum=availnum;
        calcleftbalance()
        calcleftbalancetw()
        calcleftbalancean()
    }

    /*Menu {
            id: contextMenu

            MenuItem {
                text: qsTr("Copy")
                enabled: textArea.selectedText
                onTriggered: paytoEdit.copy()
            }
            MenuItem {
                text: qsTr("Cut")
                enabled: textArea.selectedText
                onTriggered: paytoEdit.cut()
            }
            MenuItem {
                text: qsTr("Paste")
                enabled: textArea.canPaste
                onTriggered: paytoEdit.paste()
            }
        }*/

    DestCheckValidator {
        // use it
        id: destCheckVal
    }
    DestCheckValidator2 {
        // use it
        id: destCheckVal2
    }
    AmountEntryValidator {
        // use it
        id: amountCheckVal
    }
/*    //paytoEdit.MouseArea.onClicked: contextMenu.open()
    paytoEdit.MouseArea.acceptedButtons: Qt.RightButton
    paytoEdit.MouseArea.anchors.fill: parent*/

    amountEdit.validator: amountCheckVal
    amountEdittw.validator: amountCheckVal
    amountEdit.onTextChanged: calcleftbalance()
    amountEdittw.onTextChanged: calcleftbalancetw()
    amountEditan.onTextChanged: calcleftbalancean()
    paytoEdit.validator: destCheckVal
    paytoEdittw.validator: destCheckVal2
    sendBtn.onClicked: {
        sendBtnSignalIntern(paytoEdit.text,labelEdit.text,descriptionEdit.text,amountEdit.text,subtractfeeCheck.checked)
    }
    sendBtntw.onClicked: {
        sendBtntwSignalIntern(paytoEdittw.text,descriptionEdittw.text,amountEdittw.text)
    }
    sendBtnan.onClicked: {
        sendlinkBtnSignalIntern(descriptionEditan.text,amountEditan.text)
    }
    sendconfirmtwBtn.onClicked: {
        sendconfirmedBtntwSignalIntern(paytoEdittw.text,descriptionEdittw.text,amountEdittw.text)
    }
    changetwbtn.onClicked: {
        whitebox.visible=true
        whitebox2.visible=false
        whitebox3.visible=false
    }
    linksendtoanyone.onClicked: sendtoanyoneSignalIntern()
    availableBalanceBtn.onClicked: amountEdit.text=maxbalancenum
    pasteaddress.onClicked: {
        paytoEdit.selectAll()
        paytoEdit.paste()
    }
    othertransactionBtn.onClicked: {
        whitebox2.visible=false
        whitebox3.visible=false
        whitebox.visible=true
        shadow2.visible=false
    }
    viewaccounthistory.onClicked:viewaccounthistorysignal()
    gotooverview.onClicked:gotooverviewsignal()
}
