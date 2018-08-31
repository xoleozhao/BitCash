import QtQuick 2.7
import QtQuick.Templates 2.0 as T

T.Button {
    id: control
    property string iconname: ""
    property color btncolor: "#3f49aa"
    property color btncolordown: "#30357c"
    property color txtcolor: "white"
    property color txtcolordown: "#f2f2f2"    
    property color btnbordercolor: "#3e45ac"
    property int borderwidth: 0

    font.family: "Montserrat SemiBold"

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                                         contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                                          contentItem.implicitHeight + topPadding + bottomPadding)
    leftPadding: 35
    rightPadding: 10

    background: Rectangle {
        id: buttonBackground
        implicitWidth: 100
        implicitHeight: 40
        opacity: enabled ? 1 : 0.3
        color: btncolor
        border.color: btnbordercolor
        border.width: borderwidth
        radius: 3

        Image {
            id: buttonimage
            x: 20
            anchors.verticalCenter: parent.verticalCenter
            source: iconname
        }

        states: [
            State {
                name: "normal"
                when: !control.down
                PropertyChanges {
                    target: buttonBackground
                }
            },
            State {
                name: "down"
                when: control.down
                PropertyChanges {
                    target: buttonBackground
                    color: btncolordown
                }
            }
        ]
    }

    contentItem: Text {
        id: textItem
        text: control.text

        font.family: "Montserrat SemiBold"
        font.pixelSize: 14
        font.weight: Font.DemiBold
        opacity: enabled ? 1.0 : 0.3
        color: txtcolor
        x: 40
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight

        states: [
            State {
                name: "normal"
                when: !control.down
            },
            State {
                name: "down"
                when: control.down
                PropertyChanges {
                    target: textItem
                    color: txtcolordown
                }
            }
        ]
    }
}
