import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.3

Item {
    id: item1
    width: 1280
    height: 900

    property alias addressfornicknameEdit: addressfornicknameEdit
    property alias nicknameEdit: nicknameEdit
    property alias registernicknameBtn: registernicknameBtn
    property alias pastenickaddress: pastenickaddress
    property alias nickerrorlabel: nickerrorlabel
    property alias whitebox: whitebox
    property alias whitebox2: whitebox2
    property alias receivingnickname: receivingnickname
    property alias receivingnicknameEdit: receivingnicknameEdit
    property alias copynickname: copynickname

    Rectangle {
        id: toolBar
        y: 0
        height: 44
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        color: "#e2e3f2"

        Image {
            x: 30
            y: 13
            width: 16
            height: 16
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
            source: "../res/assets/Notification Alerts/info-icon.png"
        }

        Button {
            onClicked: toolBar.visible = false
            anchors.right: parent.right
            anchors.rightMargin: 30
            y: 13
            width: 16
            height: 16
            anchors.verticalCenter: parent.verticalCenter
            background: Image {
                fillMode: Image.PreserveAspectFit
                source: "../res/assets/Notification Alerts/info-close.png"
            }
        }

        Label {
            id: text10
            x: 58
            y: 13
            text: qsTr("Create your own nickname such as @joe or @amazon to receive payments from other BitCash users easier than using a BitCash address.")
            font.weight: Font.DemiBold
            anchors.verticalCenter: parent.verticalCenter
            textFormat: Text.AutoText
            font.pixelSize: 13
            font.family: "Montserrat SemiBold"
            color: "#3f49aa"
        }
    }

    Image {
        id: receiveicon
        y: 66
        anchors.verticalCenter: receivecap.verticalCenter
        anchors.left: layoutrect.left
        fillMode: Image.PreserveAspectFit
        source: "../res/assets/Headlines/create-your-nickname.png"
    }

    Text {
        id: receivecap
        y: 74
        width: 97
        color: "#202124"
        anchors.left: receiveicon.right
        anchors.leftMargin: 15
        text: qsTr("Create your nickname")
        font.pixelSize: 20
        font.weight: Font.DemiBold
        font.family: "Montserrat SemiBold"
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
        anchors.left: layoutrect.left
        anchors.right: layoutrect.right
        color: "white"
        radius: 3
        visible: true
        border.width: 0
        y: 119
        width: 632
        height: 342

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

            height: 82

            Text {
                id: text1
                width: 484
                color: "#d49f26"
                text: qsTr("Please choose your nickname carefully as you won't be able to change it later. Each BitCash address can only have one nickname.")
                font.weight: Font.DemiBold
                font.family: "Montserrat SemiBold"
                lineHeight: 1.5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 46
                anchors.top: parent.top
                anchors.topMargin: 20
                wrapMode: Text.WordWrap
                font.pixelSize: 13
            }
        }

        Image {
            anchors.left: yellowbox.left
            anchors.top: yellowbox.top
            anchors.topMargin: 22
            anchors.leftMargin: 20
            fillMode: Image.PreserveAspectFit
            source: "../res/icons/infoyellow.png"
        }

        MenuTextField {
            id: addressfornicknameEdit
            height: 44
            anchors.left: whitebox.left
            anchors.leftMargin: 30
            anchors.right: whitebox.right
            anchors.rightMargin: 30
            color: acceptableInput ? "green" : "red"
            visible: false
            bottomPadding: 10
            rightPadding: 16
            leftPadding: 16
            topPadding: 10
            anchors.top: nicknameEdit.bottom
            anchors.topMargin: 20
            placeholderText: "Your BitCash address"
            selectByMouse: true
        }

        Rectangle {
            id: rectangle
            anchors.right: nicknameEdit.left
            anchors.top: nicknameEdit.top
            anchors.bottom: nicknameEdit.bottom
            width: 53
            radius: 3
            border.width: 1
            border.color: "#eeeeef"
            color: "#f7f7f7"
            Text {
                color: "#7b7b7d"
                anchors.horizontalCenter: parent.horizontalCenter
                padding: 16
                text: "@"
                font.pixelSize: 14
                font.family: "Montserrat"
                anchors.verticalCenter: parent.verticalCenter
                bottomPadding: 10
                topPadding: 10
                font.capitalization: Font.AllUppercase
                font.weight: Font.Normal
            }
        }

        MenuTextField {
            id: nicknameEdit
            height: 44
            font.pixelSize: 14
            font.family: "Montserrat"
            bottomPadding: 10
            placeholderText: "Nickname"
            anchors.top: yellowbox.bottom
            anchors.topMargin: 30
            padding: 16
            rightPadding: 16
            leftPadding: 16
            topPadding: 10
            anchors.left: whitebox.left
            anchors.leftMargin: 89
            anchors.rightMargin: 36
            anchors.right: whitebox.right
            selectByMouse: true
        }

        Mybutton {
            id: registernicknameBtn
            font.capitalization: Font.MixedCase
            font.family: "Montserrat SemiBold"
            text: qsTr("Create nickname")
            font.weight: Font.DemiBold
            font.pixelSize: 14
            anchors.top: nickerrorlabel.bottom
            anchors.topMargin: 40
            anchors.left: whitebox.left
            anchors.leftMargin: 36
            rightPadding: 20
            leftPadding: 20
        }

        Button {
            id: pastenickaddress
            x: 428
            y: 134
            text: qsTr("Paste")
            visible: false
            anchors.right: parent.right
            anchors.rightMargin: 8
        }

        Label {
            id: nickerrorlabel
            color: "#ef5342"
            text: qsTr("")
            font.pixelSize: 13
            font.family: "Montserrat SemiBold"
            font.weight: Font.DemiBold
            anchors.leftMargin: 30
            anchors.left: whitebox.left
            anchors.top: nicknameEdit.bottom
            anchors.topMargin: 10
        }
    }

    ShadowBox {
        id: whitebox2
        anchors.left: layoutrect.left
        anchors.right: layoutrect.right
        color: "white"
        radius: 3
        visible: false
        border.width: 0
        y: 119
        width: 620
        height: 285

        Rectangle {
            id: yellowbox2
            anchors.left: whitebox2.left
            anchors.right: whitebox2.right
            anchors.top: whitebox2.top
            anchors.leftMargin: 36
            anchors.topMargin: 36
            anchors.rightMargin: 36
            color: "#fdf5e1"
            radius: 3
            border.color: "#efb735"
            border.width: 1

            height: 82

            Text {
                id: text2
                width: 484
                color: "#d49f26"
                text: qsTr("At present, only one Nickname per BitCash wallet is allowed. You have already created your nickname which is below.")
                font.weight: Font.DemiBold
                font.family: "Montserrat SemiBold"
                lineHeight: 1.5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 46
                anchors.top: parent.top
                anchors.topMargin: 20
                wrapMode: Text.WordWrap
                font.pixelSize: 13
            }
        }

        Image {
            anchors.left: yellowbox2.left
            anchors.top: yellowbox2.top
            anchors.topMargin: 22
            anchors.leftMargin: 20
            fillMode: Image.PreserveAspectFit
            source: "../res/icons/infoyellow.png"
        }

        Label {
            id: label1
            color: "#202124"
            text: qsTr("Your nickname")
            font.pixelSize: 14
            font.weight: Font.DemiBold
            font.family: "Montserrat SemiBold"
            anchors.top: yellowbox2.bottom
            anchors.topMargin: 30
            anchors.left: parent.left
            anchors.leftMargin: 36
        }

        Label {
            id: receivingnickname
            color: "#3e45ac"
            text: "test"
            font.pixelSize: 18
            font.family: "Montserrat"
            anchors.top: label1.bottom
            anchors.topMargin: 5
            anchors.right: whitebox2.right
            anchors.rightMargin: 30
            anchors.left: whitebox2.left
            anchors.leftMargin: 30
        }

        MenuTextField {
            id: receivingnicknameEdit
            visible: false
            height: 48
            text: ""
            font.pixelSize: 16
            font.family: "Montserrat"
            padding: 16
            rightPadding: 16
            leftPadding: 16
            topPadding: 16
            anchors.top: label1.bottom
            anchors.topMargin: 10
            anchors.right: whitebox2.right
            anchors.rightMargin: 36
            anchors.left: whitebox2.left
            anchors.leftMargin: 36
            selectByMouse: true
            readOnly: true
        }

        Mybutton {
            id: copynickname
            height: 44
            text: qsTr("Copy to clipboard")
            font.weight: Font.DemiBold
            font.pointSize: 14
            rightPadding: 20
            leftPadding: 20
            anchors.top: receivingnickname.bottom
            anchors.topMargin: 20
            anchors.left: whitebox2.left
            anchors.leftMargin: 36
            font.capitalization: Font.MixedCase
            font.family: "Montserrat SemiBold"
        }
    }
}
