import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.3

    TextField
    {

        id: textInput
        font.family: "Montserrat"
        background: Rectangle
        {
            radius: 3
            border.width: 1
            border.color: "#eeeeef"

        }

   /*     property string placeholderText: "Enter text here..."

        Text {
            text: textEdit.placeholderText
            color: "#aaa"
            visible: !textEdit.text
        }*/

        property int selectStart
        property int selectEnd
        property int curPos

        selectByMouse: true

        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.RightButton
            hoverEnabled: true
            onClicked: {
                selectStart = textInput.selectionStart;
                selectEnd = textInput.selectionEnd;
                curPos = textInput.cursorPosition;
                contextMenu.x = mouse.x;
                contextMenu.y = mouse.y;
                copyid.enabled=selectStart!=selectEnd
                cutid.enabled=selectStart!=selectEnd
                pasteid.enabled=canPaste
                pasteallid.enabled=canPaste
                undoid.enabled=canUndo
                redoid.enabled=canRedo
                contextMenu.open();
                textInput.cursorPosition = curPos;
                textInput.select(selectStart,selectEnd);
            }
            onPressAndHold: {
                if (mouse.source === Qt.MouseEventNotSynthesized) {
                    selectStart = textInput.selectionStart;
                    selectEnd = textInput.selectionEnd;
                    curPos = textInput.cursorPosition;
                    contextMenu.x = mouse.x;
                    contextMenu.y = mouse.y;
                    copyid.enabled=selectStart!=selectEnd
                    cutid.enabled=selectStart!=selectEnd
                    pasteid.enabled=canPaste
                    pasteallid.enabled=canPaste
                    undoid.enabled=canUndo
                    redoid.enabled=canRedo
                    contextMenu.open();
                    textInput.cursorPosition = curPos;
                    textInput.select(selectStart,selectEnd);
                }
            }

            Menu {
                id: contextMenu
                MenuItem {
                    text: "Undo"
                    id:undoid
                    onTriggered: {
                        textInput.cursorPosition = curPos;
                        textInput.select(selectStart,selectEnd);
                        textInput.undo()
                    }
                }
                MenuItem {
                    text: "Redo"
                    id:redoid
                    onTriggered: {
                        textInput.cursorPosition = curPos;
                        textInput.select(selectStart,selectEnd);
                        textInput.redo()
                    }
                }
                /*MenuSeparator {
                       padding: 0
                       topPadding: 12
                       bottomPadding: 12
                       contentItem: Rectangle {
                           implicitWidth: 200
                           implicitHeight: 1
                           color: "#1E000000"
                       }
                   }*/
                MenuItem {
                    text: "Cut"
                    id: cutid
                    onTriggered: {
                        textInput.cursorPosition = curPos;
                        textInput.select(selectStart,selectEnd);
                        textInput.cut()
                    }
                }
                MenuItem {
                    text: "Copy"
                    id: copyid
                    onTriggered: {
                        textInput.cursorPosition = curPos;
                        textInput.select(selectStart,selectEnd);
                        textInput.copy()
                    }
                }
                MenuItem {
                    text: "Copy all"
                    onTriggered: {
                        textInput.selectAll()
                        textInput.copy()
                    }
                }
                MenuItem {
                    text: "Paste"
                    id:pasteid
                    onTriggered: {
                        textInput.cursorPosition = curPos;
                        textInput.select(selectStart,selectEnd);
                        textInput.paste()
                    }
                }
                MenuItem {
                    text: "Paste and replace all"
                    id:pasteallid
                    onTriggered: {
                        textInput.selectAll()
                        textInput.paste()
                    }
                }
                /*MenuSeparator {
                       padding: 0
                       topPadding: 12
                       bottomPadding: 12
                       contentItem: Rectangle {
                           implicitWidth: 200
                           implicitHeight: 1
                           color: "#1E000000"
                       }
                   }*/
                MenuItem {
                    text: "Select all"
                    onTriggered: {
                        textInput.selectAll()
                    }
                }
            }
        }
    }

