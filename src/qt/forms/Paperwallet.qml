import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.3

Rectangle {
    id: item1
    color: "#f7f7f7"
    property alias privatekeyEdit: privatekeyEdit
    property alias publicaddressEdit: publicaddressEdit
    property alias printBtn: printBtn
    width: parent.width
    height: parent.height
    visible: false

    property real maxavailbalance: maxavailbalance
    property int selectStart
    property int selectEnd
    property alias linksendtoanyone: linksendtoanyone
    property int curPos

    signal generatepaperwalletSignalintern()
    signal printpaperwalletSignalintern()

    function setpaperwalletaddressesintern(address,privatekey) {
        publicaddressEdit.text=address
        privatekeyEdit.text=privatekey
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
            text: qsTr("You can use the paper wallet for a save long term storage of your BitCash")
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
        height: 549

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
      radius: 3
      border.color: "#efb735"
      border.width: 1

      height: 206

      Text {
          id: text12
          width: 484
          color: "#d49f26"
          text: qsTr("Your public address is the address you can share with other people. This is used so they can send you BitCash. The Private key should NEVER be shared with anyone otherwise they will have access to all your BitCash. The Private key can be imported later on to access your coins.")
          font.weight: Font.DemiBold
          font.family: "Montserrat SemiBold"
          lineHeight: 1.5
          anchors.bottom: parent.bottom
          anchors.bottomMargin: 35
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
          text: qsTr("The private key should NEVER be shared with anyone.")
          font.weight: Font.DemiBold
          font.family: "Montserrat SemiBold"
          lineHeight: 1.5
          anchors.bottom: parent.bottom
          anchors.bottomMargin: 20
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
        source: "../res/assets/Headlines/send.png"
    }

    Text {
        id: sendcap
        y: 74
        anchors.left: sendicon.right
        anchors.leftMargin: 15
        text: qsTr("Paper wallet")
        font.pixelSize: 20
        font.family: "Montserrat SemiBold"
        font.weight: Font.DemiBold
    }

    Label {
        id: text1
        color: "#3d3e40"
        text: qsTr("Public address (to receive coins)")
        font.weight: Font.DemiBold
        anchors.top: yellowbox.bottom
        anchors.topMargin: 20
        anchors.left: whitebox.left
        anchors.leftMargin: 36
        font.family: "Montserrat SemiBold"
        font.pixelSize: 14
    }

    MenuTextField {
        id: publicaddressEdit
        height: 48
        anchors.left: whitebox.left
        anchors.leftMargin: 36
        color: acceptableInput ? "green" : "red"
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
        anchors.right: whitebox.right
        anchors.rightMargin: 36
        selectByMouse: true
        placeholderText: ""
        readOnly: true
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
        readOnly: true
    }

    Label {
        id: text3
        color: "#3d3e40"
        text: qsTr("Private key (to spend coins)")
        font.weight: Font.DemiBold
        anchors.top: publicaddressEdit.bottom
        anchors.topMargin: 25
        anchors.left: whitebox.left
        anchors.leftMargin: 36
        font.pixelSize: 14
        font.family: "Montserrat SemiBold"
    }

    Mybutton {
        id: printBtn
        width: 81
        height: 44
        text: qsTr("Print")
        font.weight: Font.DemiBold
        font.pixelSize: 14
        leftPadding: 20
        anchors.left: whitebox.left
        anchors.leftMargin: 36
        anchors.top: privatekeyEdit.bottom
        anchors.topMargin: 20
        font.capitalization: Font.MixedCase
        font.family: "Montserrat SemiBold"
        onClicked: printpaperwalletSignalintern()
    }

    Mybutton {
        id: generateBtn
        x: 5
        width: 190
        height: 44
        text: qsTr("Generate new wallet")
        leftPadding: 20
        font.weight: Font.DemiBold
        anchors.top: printBtn.top
        font.family: "Montserrat SemiBold"
        font.capitalization: Font.MixedCase
        anchors.leftMargin: 20
        anchors.topMargin: 0
        font.pixelSize: 14
        anchors.left: printBtn.right
        onClicked: generatepaperwalletSignalintern()
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
        anchors.left: generateBtn.right
        onClicked: item1.visible=false
    }
}
