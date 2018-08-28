import QtQuick 2.4
import DestCheckValidator 1.0

NicknamesForm {
    signal registerNickSignalIntern(string nickname, string address)

    function clearregisternickentriesintern(msg) {
        nicknameEdit.text=""
        addressfornicknameEdit.text=""
    }

    function setnickname(msg) {
        whitebox.visible=false
        whitebox2.visible=true        
        receivingnickname.text=msg
        receivingnicknameEdit.text=msg
    }

    function setnicknameerrorintern(msg) {
        nickerrorlabel.text=msg
    }

    DestCheckValidator {
        // use it
        id: destCheckVal
    }
    addressfornicknameEdit.validator: destCheckVal
    registernicknameBtn.onClicked: {
        registerNickSignalIntern(nicknameEdit.text, addressfornicknameEdit.text)
    }
    pastenickaddress.onClicked: {
        addressfornicknameEdit.selectAll()
        addressfornicknameEdit.paste()
    }

    Timer {
        id: timer
        function setTimeout(cb, delayTime) {
            timer.interval = delayTime;
            timer.repeat = false;
            timer.triggered.connect(cb);
            timer.triggered.connect(function() {
                timer.triggered.disconnect(cb); // This is important
            });
            timer.start();
        }
    }


    copynickname.onClicked: {
        receivingnicknameEdit.selectAll()
        receivingnicknameEdit.copy()
        copynickname.text=qsTr("Copied")
        copynickname.leftPadding= 46
        copynickname.iconname="../res/icons/checkblue.png"
        timer.setTimeout(function(){
            copynickname.text=qsTr("Copy to clipboard")
            copynickname.leftPadding=20
            copynickname.iconname=""
        }, 3000);
    }
}
