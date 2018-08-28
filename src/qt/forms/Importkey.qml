import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.3

Rectangle {
    id: item1
    color: "#f7f7f7"
    property alias importBtn: importBtn
    property alias privatekeyEdit: privatekeyEdit
    width: parent.width
    height: parent.height
    visible: false

    property real maxavailbalance: maxavailbalance
    property int selectStart
    property int selectEnd
    property alias linksendtoanyone: linksendtoanyone
    property int curPos

    signal importkeySignalintern(string key)

    function displayerrormessageintern(msg) {
        errorlabel.text=msg
        infoboxerror.visible=true
        timer.setTimeout(function(){
            infoboxerror.visible=false
        }, 5000);
    }

    Rectangle {
        id: toolBar
        y: 0
        height: 44
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        color: "#e2e3f3"

        Image {
            x: 30
            y: 16
            width: 16
            height: 16
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
            source: "../res/assets/Notification Alerts/info-icon.png"
        }

        Button {
            id: closebtn
            onClicked: toolBar.visible = false
            anchors.right: parent.right
            anchors.rightMargin: 30
            y: 12
            width: 16
            height: 16
            background: Image {
                fillMode: Image.PreserveAspectFit
                source: "../res/assets/Notification Alerts/info-close.png"
            }
        }

        Label {
            id: text10
            x: 58
            y: 13
            text: qsTr("Import the private key from a paper wallet to access the BitCash on the paper wallet")
            font.weight: Font.DemiBold
            anchors.verticalCenter: parent.verticalCenter
            textFormat: Text.AutoText
            font.pixelSize: 13
            font.family: "Montserrat SemiBold"
            color: "#3e45ac"
        }
        Button {
            id: linksendtoanyone
            background: Rectangle {
                visible: false
            }
            anchors.left: text10.right
            y: 13
            rightPadding: 0
            leftPadding: 0
            padding: 0
        }
    }

    Rectangle {
        id: layoutrect
        anchors.top: toolBar.bottom
        anchors.topMargin: 10
        visible: false
        width: 632
        height: 210
        anchors.horizontalCenter: parent.horizontalCenter
    }

    ShadowBox {
        id: whitebox
        y: 122
        width: 620
        anchors.left: layoutrect.left
        anchors.right: layoutrect.right
        color: "white"
        radius: 3
        border.width: 0
        anchors.top: sendcap.bottom
        anchors.topMargin: 30
        height: 437

    }

    Rectangle {
      id: yellowbox
      anchors.left: whitebox.left
      anchors.right: whitebox.right
      anchors.top: whitebox.top
      anchors.leftMargin: 36
      anchors.topMargin: 36
      anchors.rightMargin: 36
      color: "#fdf5e1"
      radius: 1
      border.color: "#efb735"
      border.width: 1

      height: 180

      Text {
          id: text12
          width: 484
          color: "#d49f26"
          text: qsTr("You can import the private key to restore your wallet if you have printed a backup copy. You can also import the private key from a paper wallet to access the coins on the paper wallet.")
          font.weight: Font.DemiBold
          font.family: "Montserrat SemiBold"
          lineHeight: 1.5
          anchors.bottom: parent.bottom
          anchors.bottomMargin: 74
          anchors.left: parent.left
          anchors.leftMargin: 46
          anchors.top: parent.top
          anchors.topMargin: 20
          wrapMode: Text.WordWrap
          font.pixelSize: 13
      }
      Text {
          id: text13
          width: 484
          color: "red"
          text: qsTr("It can take a while to import the private key. Please be patient and do not close the wallet.")
          font.weight: Font.DemiBold
          font.family: "Montserrat SemiBold"
          lineHeight: 1.5
          anchors.bottom: parent.bottom
          anchors.bottomMargin: 43
          anchors.left: parent.left
          anchors.leftMargin: 46
          anchors.top: text12.bottom
          anchors.topMargin: 0
          wrapMode: Text.WordWrap
          font.pixelSize: 13
      }
  }

    Image {
        id: sendicon
        y: 66
        anchors.verticalCenter: sendcap.verticalCenter
        anchors.left: layoutrect.left
        fillMode: Image.PreserveAspectFit
        source: "../res/assets/Headlines/receive.png"
    }

    Text {
        id: sendcap
        y: 74
        anchors.left: sendicon.right
        anchors.leftMargin: 15
        text: qsTr("Import private key from Paper wallet")
        font.pixelSize: 20
        font.family: "Montserrat SemiBold"
        font.weight: Font.DemiBold
    }

    MenuTextField {
        id: privatekeyEdit
        height: 48
        font.pixelSize: 14
        font.family: "Montserrat"
        padding: 16
        rightPadding: 16
        leftPadding: 16
        topPadding: 16
        anchors.top: text3.bottom
        anchors.topMargin: 20
        anchors.left: whitebox.left
        anchors.leftMargin: 36
        anchors.rightMargin: 36
        anchors.right: whitebox.right
        selectByMouse: true
        placeholderText: ""
    }

    Label {
        id: text3
        color: "#3d3e40"
        text: qsTr("Private key (to spend coins)")
        font.weight: Font.DemiBold
        anchors.top: yellowbox.bottom
        anchors.topMargin: 20
        anchors.left: whitebox.left
        anchors.leftMargin: 36
        font.pixelSize: 14
        font.family: "Montserrat SemiBold"
    }

    Mybutton {
        id: importBtn
        width: 89
        height: 44
        text: qsTr("Import")
        font.weight: Font.DemiBold
        font.pixelSize: 14
        leftPadding: 20
        anchors.left: whitebox.left
        anchors.leftMargin: 36
        anchors.top: privatekeyEdit.bottom
        anchors.topMargin: 20
        font.capitalization: Font.MixedCase
        font.family: "Montserrat SemiBold"
        onClicked: importkeySignalintern(privatekeyEdit.text)
    }
    Mybutton {
        id: closeformBtn
        width: 80
        height: 44
        text: qsTr("Close")
        leftPadding: 20
        font.weight: Font.DemiBold
        anchors.top: privatekeyEdit.bottom
        font.family: "Times New Roman"
        font.capitalization: Font.MixedCase
        anchors.leftMargin: 20
        anchors.topMargin: 20
        font.pixelSize: 14
        anchors.left: importBtn.right
        onClicked: item1.visible=false
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
