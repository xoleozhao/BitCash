import QtQuick 2.7
import QtQuick.Controls 2.0
import DestCheckValidator 1.0
import AmountEntryValidator 1.0

SendForm {    
    signal sendBtnSignalIntern(string destination, string label, string description, double amount, bool substractfee)
    signal sendtoanyoneSignalIntern()
    signal viewaccounthistorysignal()
    signal gotooverviewsignal()

    function clearsendentriesintern(msg) {
        paytoEdit.text=""
        labelEdit.text=""
        descriptionEdit.text=""
        amountEdit.text=""
        whitebox2.visible=true        
    }

    property real maxbalancenum : 0

    function setleftamountbalanceitern(left) {

    }

    property real leftbalance: 0

    function calcleftbalance()
    {
        leftbalance=maxbalancenum-amountEdit.text
        if (leftbalance<0)leftbalance=0
        leftamountlabel.text=leftbalance
    }

    function setmaxbalanceintern(avail,availnum) {
        maxbalance.text=avail
        maxbalancenum=availnum;
        calcleftbalance()
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
    AmountEntryValidator {
        // use it
        id: amountCheckVal
    }
/*    //paytoEdit.MouseArea.onClicked: contextMenu.open()
    paytoEdit.MouseArea.acceptedButtons: Qt.RightButton
    paytoEdit.MouseArea.anchors.fill: parent*/

    amountEdit.validator: amountCheckVal
    amountEdit.onTextChanged: calcleftbalance()
    paytoEdit.validator: destCheckVal
    sendBtn.onClicked: {
        sendBtnSignalIntern(paytoEdit.text,labelEdit.text,descriptionEdit.text,amountEdit.text,subtractfeeCheck.checked)
    }
    linksendtoanyone.onClicked: sendtoanyoneSignalIntern()
    availableBalanceBtn.onClicked: amountEdit.text=maxbalancenum
    pasteaddress.onClicked: {
        paytoEdit.selectAll()
        paytoEdit.paste()
    }
    othertransactionBtn.onClicked: {
        whitebox2.visible=false
        shadow2.visible=false
    }
    viewaccounthistory.onClicked:viewaccounthistorysignal()
    gotooverview.onClicked:gotooverviewsignal()
}
