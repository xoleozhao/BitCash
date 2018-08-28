import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.3

Item {
    width: 1000
    height: 1000
    id: miningform

    property alias toolBar: toolBar
    property alias toolBar2: toolBar2
    property alias toolBar3: toolBar3
    property alias text11: text11
    property alias text12: text12
    property alias animation1: animation1
    property alias animation2: animation2
    property alias animation3: animation3
    property alias whitebox: whitebox

    Rectangle {
        id: toolBar
        y: 0
        height: 44
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        color: "#e2e3f3"
        visible: false

        Image {
            x: 30
            y: 13
            width: 16
            height: 16
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
            background: Image {
                fillMode: Image.PreserveAspectFit
                source: "../res/assets/Notification Alerts/info-close.png"
            }
        }

        Label {
            id: text10
            x: 58
            y: 13
            text: qsTr("Mining BitCash is easy. Simply click the Start mining button and your computer will start earning BitCash.")
            font.pixelSize: 13
            font.family: "Montserrat SemiBold"
            font.weight: Font.DemiBold
            color: "#3e45ac"
        }
    }

    Rectangle {
        id: toolBar2
        y: 0
        visible: false
        height: 44
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        color: "#ddf5e3"

        Image {
            x: 30
            y: 13
            width: 16
            height: 16
            fillMode: Image.PreserveAspectFit
            source: "../res/assets/Notification Alerts/success-icon.png"
        }

        Button {
            onClicked: toolBar2.visible = false
            anchors.right: parent.right
            anchors.rightMargin: 30
            y: 13
            width: 16
            height: 16
            background: Image {
                fillMode: Image.PreserveAspectFit
                source: "../res/assets/Notification Alerts/success-close.png"
            }
        }

        Label {
            id: text11
            x: 58
            y: 13
            text: qsTr("You have successfully earned 0 BITC. It's been automatically added to your total balance.")
            font.pixelSize: 13
            font.family: "Montserrat SemiBold"
            font.weight: Font.DemiBold
            color: "#1bb846"
        }
    }

    Rectangle {
        id: toolBar3
        y: 0
        visible: false
        height: 44
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        color: "#ddf5e3"

        Image {
            x: 30
            y: 13
            width: 16
            height: 16
            fillMode: Image.PreserveAspectFit
            source: "../res/assets/Notification Alerts/success-icon.png"
        }

        Button {
            onClicked: toolBar3.visible = false
            anchors.right: parent.right
            anchors.rightMargin: 30
            y: 13
            width: 16
            height: 16
            background: Image {
                fillMode: Image.PreserveAspectFit
                source: "../res/assets/Notification Alerts/success-close.png"
            }
        }

        Label {
            id: text12
            x: 58
            y: 13
            text: qsTr("Mining information")
            font.pixelSize: 13
            font.family: "Montserrat SemiBold"
            font.weight: Font.DemiBold
            color: "#1bb846"
        }
    }

    AnimatedImage {
        id: animation1
        width: 808
        height: 606
        source: "../res/movies/Part-1.gif"

        fillMode: Image.PreserveAspectFit
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        playing: false
        visible: true
    }
    AnimatedImage {
        height: 606
        transformOrigin: Item.Center
        id: animation2
        width: 808
        source: "../res/movies/Part-2.gif"

        fillMode: Image.PreserveAspectFit
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        playing: false
        visible: false
    }
    AnimatedImage {
        height: 606
        id: animation3
        width: 808
        source: "../res/movies/Part-3.gif"

        fillMode: Image.PreserveAspectFit
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        playing: false
        visible: false
    }

    /*Image {
        id: image
        width: 571
        height: 404
        fillMode: Image.PreserveAspectFit
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        source: "../res/assets/illustration-mining.png"
    }*/
    property alias startminingbutton: startminingbutton
    property alias stopminingbutton: stopminingbutton

    Rectangle {
        id: layoutrect
        anchors.top: toolBar.bottom
        anchors.topMargin: 10
        visible: false
        width: 620
        height: 210
        anchors.horizontalCenter: parent.horizontalCenter
    }

    ShadowBox {
        id: whitebox
        anchors.left: layoutrect.left
        anchors.right: layoutrect.right
        color: "white"
        radius: 3
        anchors.leftMargin: -6
        anchors.top: mininglabel.bottom
        anchors.topMargin: 24
        border.width: 0
        width: 632
        height: 130
    }

    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: whitebox.top
        anchors.topMargin: 30
        anchors.bottom: whitebox.bottom
        anchors.bottomMargin: 30
        border.color: "#00000000"
        border.width: 0
        width: 1
        color: "#e3e3e3"
    }

    Image {
        id: miningicon
        y: 74
        anchors.left: layoutrect.left
        width: 24
        height: 24
        anchors.verticalCenter: mininglabel.verticalCenter
        fillMode: Image.PreserveAspectFit
        source: "../res/assets/Headlines/mining.png"
    }

    Text {
        id: mininglabel
        y: 74
        anchors.left: miningicon.right
        anchors.leftMargin: 15
        text: qsTr("Mining")
        font.pixelSize: 20
        font.family: "Montserrat SemiBold"
        font.weight: Font.DemiBold
    }

    Mybutton {
        id: startminingbutton
        anchors.right: layoutrect.right
        y: 66
        width: 147
        height: 44
        text: qsTr("Start mining")
        font.pixelSize: 16
        anchors.verticalCenter: mininglabel.verticalCenter
        leftPadding: 40
        iconname: "../res/assets/Miscellaneous/button-start.png"
        font.capitalization: Font.MixedCase
        font.family: "Montserrat"
    }

    Mybutton {
        id: stopminingbutton
        y: 66
        width: 147
        text: qsTr("Stop mining")
        font.weight: Font.DemiBold
        font.pixelSize: 14
        anchors.verticalCenter: mininglabel.verticalCenter
        leftPadding: 46
        anchors.left: startminingbutton.left
        height: 44
        iconname: "../res/assets/Miscellaneous/button-stop.png"
        font.capitalization: Font.MixedCase
        font.family: "Montserrat SemiBold"
        visible: false
        checkable: false
    }

    property alias labelgraphs: labelgraphs
    property alias labelcycles: labelcycles

    Label {
        id: labelgraphs
        color: "#4d505e"
        anchors.left: whitebox.left
        anchors.leftMargin: 36
        anchors.top: whitebox.top
        anchors.topMargin: 36
        text: qsTr("Graphs per second")
        font.weight: Font.DemiBold
        font.pixelSize: 13
        font.family: "Montserrat SemiBold"
        opacity: 0.5
    }

    Label {
        id: labelcycles
        color: "#4d505e"
        anchors.left: whitebox.horizontalCenter
        anchors.leftMargin: 30
        anchors.top: whitebox.top
        anchors.topMargin: 36
        text: qsTr("Cycles per second")
        font.weight: Font.DemiBold
        font.pixelSize: 13
        font.family: "Montserrat SemiBold"
        opacity: 0.5
    }

    property alias graphsstat: graphsstat
    property alias cyclesstat: cyclesstat
    property alias minereduced: minereduced
    property alias stopanimation: stopanimation

    Label {
        id: graphsstat
        color: "#3e45ac"
        anchors.left: labelgraphs.left
        anchors.top: labelgraphs.bottom
        anchors.topMargin: 10
        text: qsTr("0.000000")
        font.pixelSize: 18
        font.family: "Montserrat"
        opacity: 0.5
    }

    Label {
        id: cyclesstat
        color: "#3e45ac"
        anchors.left: labelcycles.left
        anchors.top: labelcycles.bottom
        anchors.topMargin: 10
        text: qsTr("0.000000")
        font.pixelSize: 18
        font.family: "Montserrat"
        opacity: 0.5
    }

    CheckBox {
        id: minereduced
        text: qsTr("Reduce mining power")
        font.weight: Font.DemiBold
        font.pixelSize: 14
        font.family: "Montserrat SemiBold"
        bottomPadding: 5
        topPadding: 20
        rightPadding: 24
        anchors.top: whitebox.bottom
        anchors.topMargin: 0
        checkState: Qt.Unchecked
        leftPadding: 0
        anchors.left: layoutrect.left
        anchors.leftMargin: 0
        hoverEnabled: true
        ToolTip.visible: hovered
        ToolTip.text: qsTr("We recommend checking this option if mining is slowing down your computer.")
        ToolTip.delay: 100
        ToolTip.timeout: 5000
        Image {
            id: imageinfo
            width: 16
            height: 16
            anchors.verticalCenterOffset: 7
            anchors.verticalCenter: minereduced.verticalCenter
            fillMode: Image.PreserveAspectFit
            anchors.right: minereduced.right
            source: "../res/assets/Miscellaneous/info.png"
        }
    }
    CheckBox {
        id: stopanimation
        text: qsTr("Stop animation")
        font.weight: Font.DemiBold
        font.pixelSize: 14
        font.family: "Montserrat SemiBold"
        bottomPadding: 5
        topPadding: 5
        rightPadding: 24
        anchors.top: minereduced.bottom
        anchors.topMargin: 0
        checkState: Qt.Unchecked
        leftPadding: 0
        anchors.left: layoutrect.left
        anchors.leftMargin: 0
        hoverEnabled: true
        ToolTip.visible: hovered
        ToolTip.text: qsTr("We recommend checking this option if the animation is slowing down the mining.")
        ToolTip.delay: 100
        ToolTip.timeout: 5000
        Image {
            id: imageinfo2
            width: 16
            height: 16
            anchors.verticalCenter: stopanimation.verticalCenter
            fillMode: Image.PreserveAspectFit
            anchors.right: stopanimation.right
            source: "../res/assets/Miscellaneous/info.png"
        }
    }
}
