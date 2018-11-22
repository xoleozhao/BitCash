import QtQuick 2.7
import QtQuick.Controls 2.0
import DestCheckValidator 1.0
import AmountEntryValidator 1.0
import DestCheckValidator2 1.0

SendForm {    
    signal sendBtnSignalIntern(string destination, string label, string description, double amount, bool substractfee)
    signal sendBtntwSignalIntern(string destination, string description, double amount)
    signal sendBtninSignalIntern(string destination, string description, double amount)
    signal sendBtnreSignalIntern(string destination, string description, double amount)
    signal sendconfirmedBtntwSignalIntern(string destination, string description, double amount)
    signal sendconfirmedBtninSignalIntern(string destination, string description, double amount)
    signal sendconfirmedBtnreSignalIntern(string destination, string description, double amount)
    signal sendlinkBtnSignalIntern(string description, double amount)
    signal sendtoanyoneSignalIntern()
    signal viewaccounthistorysignal()
    signal gotooverviewsignal()

    property int confirmmode;

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
        /**************************************/
        tabBar.currentIndex=1
        /**************************************/
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
        confirmmode=0
        if (descriptionEdittw.text!==""){
            confirmtext.text= "You're about to send "+amountEdittw.text+" BITC to @"+paytoEdittw.text+" with the following description: '"+descriptionEdittw.text+"'.\n\n Please confirm this transaction."
        }else
        {
            confirmtext.text= "You're about to send "+amountEdittw.text+" BITC to @"+paytoEdittw.text+".\n\n Please confirm this transaction."
        }
        twitteruser.text=msg;
        twitteruser2.text="@"+paytoEdittw.text;
        profileimage.source="https://wallet.choosebitcash.com/gettwitteruserpic.php?twitteruser="+paytoEdittw.text;
        badgeimage.source= "../res/assets/Miscellaneous/twitter-badge.png"
        whitebox.visible=false
        whitebox2.visible=false
        whitebox3.visible=true
    }

    function showconfirminstaintern(msg)
    {
        confirmmode=1
        if (descriptionEditin.text!==""){
            confirmtext.text= "You're about to send "+amountEditin.text+" BITC to @"+paytoEditin.text+" with the following description: '"+descriptionEditin.text+"'.\n\n Please confirm this transaction."
        }else
        {
            confirmtext.text= "You're about to send "+amountEditin.text+" BITC to @"+paytoEditin.text+".\n\n Please confirm this transaction."
        }
        twitteruser.text=msg;
        twitteruser2.text="@"+paytoEditin.text;
        profileimage.source="https://wallet.choosebitcash.com/getinstauserpic.php?instauser="+paytoEditin.text;
        badgeimage.source= "../res/assets/Miscellaneous/instagram-badge.png"
        whitebox.visible=false
        whitebox2.visible=false
        whitebox3.visible=true
    }

    function showconfirmredditintern(msg)
    {
        confirmmode=2
        if (descriptionEditre.text!==""){
            confirmtext.text= "You're about to send "+amountEditre.text+" BITC to @"+paytoEditre.text+" with the following description: '"+descriptionEditre.text+"'.\n\n Please confirm this transaction."
        }else
        {
            confirmtext.text= "You're about to send "+amountEditre.text+" BITC to @"+paytoEditre.text+".\n\n Please confirm this transaction."
        }
        twitteruser.text=msg;
        twitteruser2.text="@"+paytoEditre.text;
        profileimage.source="https://wallet.choosebitcash.com/getreddituserpic.php?reddituser="+paytoEditre.text;
        badgeimage.source= "../res/assets/Miscellaneous/reddit-badge.png"
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
        /************************/
        /*paytoEdittw.text=""
        labelEdittw.text=""
        descriptionEdittw.text=""
        amountEdittw.text=""
        whitebox2.visible=false
        whitebox.visible=true
        whitebox3.visible=false*/
        /*****************/
    }

    function clearsendentriesinternin(msg) {
        /************************/
        /*paytoEditin.text=""
        labelEditin.text=""
        descriptionEditin.text=""
        amountEditin.text=""
        whitebox2.visible=false
        whitebox.visible=true
        whitebox3.visible=false*/
        /*****************/
    }

    function clearsendentriesinternre(msg) {
        /************************/
        /*paytoEditre.text=""
        labelEditre.text=""
        descriptionEditre.text=""
        amountEditre.text=""
        whitebox2.visible=false
        whitebox.visible=true
        whitebox3.visible=false*/
        /*****************/
    }

    property real maxbalancenum : 0

    function setleftamountbalanceitern(left) {

    }

    property real leftbalance: 0
    property real leftbalancetw: 0
    property real leftbalancein: 0
    property real leftbalancere: 0
    property real leftbalancean: 0

    function calcleftbalance()
    {
        leftbalance=maxbalancenum-amountEdit.text
        if (leftbalance<0)leftbalance=0
        leftamountlabel.text=leftbalance
    }

    function calcleftbalancetw()
    {
        /****************************/
        /*leftbalancetw=maxbalancenum-amountEdittw.text
        if (leftbalancetw<0)leftbalancetw=0
        leftamountlabeltw.text=leftbalancetw*/
        /*****************************/
    }

    function calcleftbalancein()
    {
        /****************************/
        /*leftbalancein=maxbalancenum-amountEditin.text
        if (leftbalancein<0)leftbalancein=0
        leftamountlabelin.text=leftbalancein*/
        /*****************************/
    }

    function calcleftbalancere()
    {
        /****************************/
        /*leftbalancere=maxbalancenum-amountEditre.text
        if (leftbalancere<0)leftbalancere=0
        leftamountlabelre.text=leftbalancere*/
        /*****************************/
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
        calcleftbalancein()
        calcleftbalancere()
        calcleftbalancean()
    }

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

    amountEdit.validator: amountCheckVal       
    amountEdit.onTextChanged: calcleftbalance()
    amountEditan.validator: amountCheckVal
    amountEditan.onTextChanged: calcleftbalancean()
    paytoEdit.validator: destCheckVal
/***********************************/
    /*paytoEdittw.validator: destCheckVal2
    amountEdittw.validator: amountCheckVal
    amountEdittw.onTextChanged: calcleftbalancetw()
    sendBtntw.onClicked: {
        sendBtntwSignalIntern(paytoEdittw.text,descriptionEdittw.text,amountEdittw.text)
    }

    paytoEditin.validator: destCheckVal2
    amountEditin.validator: amountCheckVal
    amountEditin.onTextChanged: calcleftbalancein()
    sendBtnin.onClicked: {
        sendBtninSignalIntern(paytoEditin.text,descriptionEditin.text,amountEditin.text)
    }

    paytoEditre.validator: destCheckVal2
    amountEditre.validator: amountCheckVal
    amountEditre.onTextChanged: calcleftbalancere()
    sendBtnre.onClicked: {
        sendBtnreSignalIntern(paytoEditre.text,descriptionEditre.text,amountEditre.text)
    }*/
/***********************************/
    sendBtn.onClicked: {
        sendBtnSignalIntern(paytoEdit.text,labelEdit.text,descriptionEdit.text,amountEdit.text,subtractfeeCheck.checked)
    }    
    sendBtnan.onClicked: {
        sendlinkBtnSignalIntern(descriptionEditan.text,amountEditan.text)
    }
    sendconfirmtwBtn.onClicked: {
        if (confirmmode==0){
            sendconfirmedBtntwSignalIntern(paytoEdittw.text,descriptionEdittw.text,amountEdittw.text)
        }else
        if (confirmmode==1){
            sendconfirmedBtninSignalIntern(paytoEditin.text,descriptionEditin.text,amountEditin.text)
        }else
        if (confirmmode==2){
            sendconfirmedBtnreSignalIntern(paytoEditre.text,descriptionEditre.text,amountEditre.text)
        }
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
