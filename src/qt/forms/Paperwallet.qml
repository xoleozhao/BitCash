import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.3

Item {
    id: item1
    visible: false
    width: parent.width
    height: parent.height

    property alias privatekeyEdit: privatekeyEdit
    property alias publicaddressEdit: publicaddressEdit
    property alias printBtn: printBtn

    property real maxavailbalance: maxavailbalance
    property int selectStart
    property int selectEnd    
    property int curPos

    signal generatepaperwalletSignalintern()
    signal printpaperwalletSignalintern()

    function setpaperwalletaddressesintern(address,privatekey) {
        publicaddressEdit.text=address
        privatekeyEdit.text=privatekey
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
        anchors.top: screen.top
        anchors.topMargin: 40
        anchors.horizontalCenter: screen.horizontalCenter
    border.color: "#ffffff"
    border.width: 1
    width: 690
    height: 500

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

    Rectangle {
      id: yellowbox
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.top: sendcap.bottom
      anchors.leftMargin: 30
      anchors.topMargin: 15
      anchors.rightMargin: 30
      color: "#fdf5e1"
      radius: 3
      border.color: "#efb735"
      border.width: 1

      height: 130

      Text {
          id: text14
          color: "#d49f26"
          text: qsTr("You can use the paper wallet for a save long term storage of your BitCash. Your public address is the address you can share with other people. The private key should never be shared with anyone otherwise they will have access to all your BitCash. This Private key can be imported later on to access your coins.")
          anchors.right: parent.right
          anchors.rightMargin: 30
          font.weight: Font.DemiBold
          font.family: "Montserrat SemiBold"
          lineHeight: 1.5
          anchors.bottom: parent.bottom
          anchors.bottomMargin: 20
          anchors.left: infoicon2.right
          anchors.leftMargin: 10
          anchors.top: parent.top
          anchors.topMargin: 20
          wrapMode: Text.WordWrap
          font.pixelSize: 13
      }

      Image {
          id: infoicon2
          anchors.top: parent.top
          anchors.topMargin: 20
          anchors.leftMargin: 20
          anchors.left: parent.left
          fillMode: Image.PreserveAspectFit
          source: "../res/assets/Miscellaneous/info-yellow.png"
      }
  }

    Image {
        id: sendicon
        y: 66
        anchors.leftMargin: 30
        anchors.verticalCenter: sendcap.verticalCenter
        anchors.left: parent.left
        fillMode: Image.PreserveAspectFit
        source: "../res/assets/Navigation/backup-icon.png"
    }

    Text {
        id: sendcap
        color: "#202124"
        anchors.left: sendicon.right
        anchors.leftMargin: 10
        text: qsTr("Print a paper wallet")
        anchors.top: parent.top
        anchors.topMargin: 30
        font.pixelSize: 18
        font.family: "Montserrat SemiBold"
        font.weight: Font.DemiBold
    }

    Label {
        id: text1
        color: "#202124"
        text: qsTr("Public address")
        font.weight: Font.DemiBold
        anchors.top: yellowbox.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 30
        font.family: "Montserrat SemiBold"
        font.pixelSize: 14
    }
    Label {
        id: text15
        color: "#8f9091"
        text: qsTr("(to receive coins)")
        anchors.top: yellowbox.bottom
        anchors.topMargin: 20
        anchors.left: text1.right
        anchors.leftMargin: 5
        font.family: "Montserrat"
        font.pixelSize: 14
    }

    MenuTextField {
        id: publicaddressEdit
        height: 48
        anchors.left: parent.left
        anchors.leftMargin: 30
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
        anchors.right: copyBtn1.left
        anchors.rightMargin: 0
        selectByMouse: true
        placeholderText: ""
        readOnly: true
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
    Mybutton {
        id: copyBtn1
        width: 90
        height: 48
        text: qsTr("Copy")
        anchors.right: parent.right
        anchors.rightMargin: 30
        font.weight: Font.DemiBold
        font.pixelSize: 14
        leftPadding: 20
        anchors.top: publicaddressEdit.top
        anchors.topMargin: 0
        font.capitalization: Font.MixedCase
        font.family: "Montserrat SemiBold"
        onClicked: {
            publicaddressEdit.selectAll()
            publicaddressEdit.copy()
            copyBtn1.text="Copied"
            timer.setTimeout(function(){
                copyBtn1.text="Copy"
            }, 3000);
        }
        btncolor: "#f7f7f7"
        txtcolor: "#4d505e"
        btncolordown: "#eaeaea"
        txtcolordown: "#494ea7"
        btnbordercolor: "#dededf"
        borderwidth: 1
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
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.rightMargin: 0
        anchors.right: copyBtn2.left
        selectByMouse: true
        placeholderText: ""
        readOnly: true
    }

    Mybutton {
        id: copyBtn2
        width: 90
        height: 48
        text: qsTr("Copy")
        anchors.right: parent.right
        anchors.rightMargin: 30
        font.weight: Font.DemiBold
        font.pixelSize: 14
        leftPadding: 20
        anchors.top: privatekeyEdit.top
        anchors.topMargin: 0
        font.capitalization: Font.MixedCase
        font.family: "Montserrat SemiBold"
        onClicked: {
            privatekeyEdit.selectAll()
            privatekeyEdit.copy()
            copyBtn2.text="Copied"
            timer.setTimeout(function(){
                copyBtn2.text="Copy"
            }, 3000);
        }
        btncolor: "#f7f7f7"
        txtcolor: "#4d505e"
        btncolordown: "#eaeaea"
        txtcolordown: "#494ea7"
        btnbordercolor: "#dededf"
        borderwidth: 1
    }

    Label {
        id: text3
        color: "#202124"
        text: qsTr("Private key")
        font.weight: Font.DemiBold
        anchors.top: publicaddressEdit.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 30
        font.pixelSize: 14
        font.family: "Montserrat SemiBold"
    }

    Label {
        id: text35
        color: "#8f9091"
        text: qsTr("(to spend coins)")
        anchors.top: publicaddressEdit.bottom
        anchors.topMargin: 20
        anchors.left: text3.right
        anchors.leftMargin: 5
        font.family: "Montserrat"
        font.pixelSize: 14
    }

    Mybutton {
        id: printBtn
        width: 102
        height: 44
        text: qsTr("Print")
        font.weight: Font.DemiBold
        font.pixelSize: 14
        leftPadding: 42
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.top: privatekeyEdit.bottom
        anchors.topMargin: 20
        font.capitalization: Font.MixedCase
        font.family: "Montserrat SemiBold"
        onClicked: printpaperwalletSignalintern()
        iconname: "../res/assets/Miscellaneous/print-icon.png"
        btncolor: "white"
        txtcolor: "#3e45ac"
        btncolordown: "#eaeaea"
        txtcolordown: "#494ea7"
        btnbordercolor: "#3e45ac"
        borderwidth: 1
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
}
}
