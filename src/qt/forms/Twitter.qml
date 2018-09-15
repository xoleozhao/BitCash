import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.3

Item {
    id: item1
    visible: false
    width: parent.width
    height: parent.height

    property string linktosend
    property alias sendBtn: sendBtn
    property alias twitteredit: twitteredit


    function displayerrormessageintern(msg) {
        errorlabel.text=msg
        infoboxerror.visible=true
        timer.setTimeout(function(){
            infoboxerror.visible=false
        }, 3000);
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
Rectangle{
    id: screen
    radius: 0
    color: "#000000"
    opacity: 0.5
    border.color: "#00000000"
    border.width: 0
    width: parent.width
    height: parent.height

}
    Rectangle {
        id: window
        color: "#ffffff"
        radius: 5
        anchors.horizontalCenter: screen.horizontalCenter
        anchors.verticalCenter: screen.verticalCenter
    border.color: "#ffffff"
    border.width: 1
    width: 690
    height: 270


        Button {
            id: closebtn
            onClicked: item1.visible = false
            anchors.right: parent.right
            anchors.rightMargin: 30
            width: 16
            height: 16
            anchors.top: parent.top
            anchors.topMargin: 30
            background: Image {
                fillMode: Image.PreserveAspectFit
                source: "../res/assets/Miscellaneous/close-icon.png"
            }
        }

//////

        Image {
            id: sendicon
            y: 66
            anchors.leftMargin: 30
            anchors.verticalCenter: sendcap.verticalCenter
            anchors.left: parent.left
            fillMode: Image.PreserveAspectFit
            source: "../res/assets/Miscellaneous/twitter.png"
        }

        Text {
            id: sendcap
            color: "#202124"
            anchors.left: sendicon.right
            anchors.leftMargin: 10
            text: qsTr("Send coins to Twitter user account")
            styleColor: "#202124"
            anchors.top: parent.top
            anchors.topMargin: 30
            font.pixelSize: 18
            font.family: "Montserrat SemiBold"
            font.weight: Font.DemiBold
        }
//////////////


        Label {
            id: text1
            color: "#3d3e40"
            text: qsTr("Recipient")
            font.weight: Font.DemiBold
            anchors.top: sendcap.top
            anchors.topMargin: 60
            anchors.left: parent.left
            anchors.leftMargin: 36
            font.family: "Montserrat SemiBold"
            font.pixelSize: 14
        }

        MenuTextField {
            id: twitteredit
            height: 48
            anchors.left: parent.left
            anchors.leftMargin: 36
            color: "#202124"
            text: ""
            font.pixelSize: 14
            font.family: "Montserrat"
            font.letterSpacing: 0
            bottomPadding: 16
            padding: 16
            rightPadding: 16
            topPadding: 16
            leftPadding: 16
            anchors.top: text1.bottom
            anchors.topMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 36
            selectByMouse: true
            placeholderText: "Enter the Twitter user account here (it starts with an @ like @ChooseBitCash)"
        }

        Mybutton {
            id: sendBtn
            height: 44
            text: qsTr("Send")
            font.weight: Font.DemiBold
            font.pixelSize: 14
            leftPadding: 44
            anchors.left: parent.left
            anchors.leftMargin: 36
            anchors.top: twitteredit.bottom
            anchors.topMargin: 15
            iconname: "../res/assets/Miscellaneous/button-send.png"
            font.capitalization: Font.MixedCase
            font.family: "Montserrat SemiBold"
        }


    }

    Rectangle{
        id: infoboxerror
        visible: false
        anchors.left:parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 30
        anchors.leftMargin: 30
        anchors.bottomMargin: 30
        height: 44
        width: 240
        radius: 3
        border.width: 0
        color: "#4d505e"
        Label{
            id: errorlabel
            text: ""
            font.family: "Montserrat"
            font.pixelSize: 11
            color: "#ffffff"
            anchors.left:parent.left
            anchors.leftMargin: 20
            anchors.verticalCenter: parent.verticalCenter
        }
        Button {
            id: closebuttonerror
            onClicked: infoboxerror.visible = false
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            width: 16
            height: 16
            background: Image {
                x:0
                y:0
                fillMode: Image.PreserveAspectFit
                source: "../res/icons/closebtngrey.png"
            }
        }
    }


}
