import QtQuick 2.0

Rectangle {
    id: control
    Image {
        anchors.left: control.left
        y:8
        width:8
        height:control.height-16
        fillMode: Image.Stretch
        source: "../res/assets/Shadow/shadowleft.png"
    }
    Image {
        anchors.right: control.right
        y:8
        width:8
        height:control.height-16
        fillMode: Image.Stretch
        source: "../res/assets/Shadow/shadowright.png"
    }

    Image {
        anchors.top: control.top
        x:8
        width:control.width-16
        height:8
        fillMode: Image.Stretch
        source: "../res/assets/Shadow/shadowtop.png"
    }

    Image {
        anchors.bottom: control.bottom
        x:8
        width:control.width-16
        height:8
        fillMode: Image.Stretch
        source: "../res/assets/Shadow/shadowbottom.png"
    }
    Image {
        anchors.top: control.top
        anchors.left: control.left
        width:8
        height:8
        fillMode: Image.Tile
        source: "../res/assets/Shadow/shadowlefttop.png"
    }
    Image {
        anchors.top: control.top
        anchors.right: control.right
        width:8
        height:8
        fillMode: Image.Tile
        source: "../res/assets/Shadow/shadowrighttop.png"
    }
    Image {
        anchors.bottom: control.bottom
        anchors.left: control.left
        width:8
        height:8
        fillMode: Image.Tile
        source: "../res/assets/Shadow/shadowleftbottom.png"
    }
    Image {
        anchors.bottom: control.bottom
        anchors.right: control.right
        width:8
        height:8
        fillMode: Image.Tile
        source: "../res/assets/Shadow/shadowrightbottom.png"
    }
}

