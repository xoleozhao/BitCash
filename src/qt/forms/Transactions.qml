import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.3

Item {
    id: transactionsForm
    width: 1280
    height: 900

    property int  datewidth : 150
    property int  typewidth : 150
    property int  addresswidth : 150
    property int  amountwidth : 220

    function settxdetailsintern(text) {
        detailarea.text=text
        detaildialog.visible=true
    }

    signal showtxdetailsintern(int index)
    signal filtereditchangedsignalintern(string text)
    signal datefiltersignalintern(int index)
    signal downloadtransactionsSignalintern()

    function geticonname(nr)
    {
        if (nr===1) return "../res/assets/Type of Transaction/history-type-sent.png";else
        if (nr===2) return "../res/assets/Type of Transaction/history-type-mined.png";else
        return "../res/assets/Type of Transaction/history-type-received.png";
    }

    Image {
        id: historyicon
        y: 36
        anchors.verticalCenter: historycap.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 30
        fillMode: Image.PreserveAspectFit
        source: "../res/assets/Headlines/history.png"
    }

    Text {
        id: historycap
        y: 30
        width: 97
        color: "#202124"
        anchors.left: historyicon.right
        anchors.leftMargin: 15
        text: qsTr("History")
        font.pixelSize: 20
        font.family: "Montserrat SemiBold"
        font.weight: Font.DemiBold        
    }

    Row {
        id: header        
        clip: true
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 30
        anchors.rightMargin: 30
        anchors.top: filterEdit.bottom
        anchors.topMargin: 30
        spacing: 0
        height: 44


        Label {
            //without this column the background color of the next colum is not displayed???
            width: 1
            height: 44
            text: ""
        }
                        Label {
                            width: datewidth
                            height: 44
                            text: "Date"
                            verticalAlignment: Text.AlignVCenter
                            anchors.verticalCenter: parent.verticalCenter
                            rightPadding: 20
                            leftPadding: 20
                            font.family: "Montserrat SemiBold"
                            font.weight: Font.DemiBold                            
                            font.pixelSize: 13
                            color:"#202124"
                            padding: 10
                            background: Rectangle { color: "#ebebeb" }
                        }
                        Label {
                            width: typewidth
                            height: 44
                            text: "Type"
                            verticalAlignment: Text.AlignVCenter
                            anchors.verticalCenter: parent.verticalCenter
                            rightPadding: 20
                            leftPadding: 20
                            font.family: "Montserrat SemiBold"
                            font.weight: Font.DemiBold                            
                            font.pixelSize: 13
                            color:"#202124"
                            padding: 10
                            background: Rectangle { color: "#ebebeb" }
                        }
                        Label {
                            width: addresswidth
                            height: 44
                            text: "Address"
                            verticalAlignment: Text.AlignVCenter
                            anchors.verticalCenter: parent.verticalCenter
                            rightPadding: 20
                            leftPadding: 20
                            font.family: "Montserrat SemiBold"
                            font.weight: Font.DemiBold                            
                            font.pixelSize: 13
                            color:"#202124"
                            padding: 10
                            background: Rectangle { color: "#ebebeb" }
                        }
                        Label {
                            width: transactionsForm.width-datewidth-typewidth-addresswidth-amountwidth-30-30
                            height: 44
                            text: "Description"
                            verticalAlignment: Text.AlignVCenter
                            anchors.verticalCenter: parent.verticalCenter
                            rightPadding: 20
                            leftPadding: 20
                            font.family: "Montserrat SemiBold"
                            font.weight: Font.DemiBold                            
                            font.pixelSize: 13
                            color:"#202124"
                            padding: 10
                            background: Rectangle { color: "#ebebeb" }
                        }
                        Label {
                            width: amountwidth
                            height: 44
                            text: "Amount"
                            verticalAlignment: Text.AlignVCenter
                            anchors.verticalCenter: parent.verticalCenter
                            rightPadding: 20
                            leftPadding: 20
                            font.family: "Montserrat SemiBold"
                            font.weight: Font.DemiBold
                            horizontalAlignment: Text.AlignRight                            
                            font.pixelSize: 13
                            color:"#202124"
                            padding: 10
                            background: Rectangle { color: "#ebebeb" }
                        }


    }
    TextField
    {
        id: copytextfield
        width: 0
        height: 0
        visible: false
    }

    property alias listView: listView
    ListView {
        id: listView
        anchors.bottomMargin: 0        
        anchors.top: header.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        clip: true

            contentWidth: header.width
            flickableDirection: Flickable.VerticalFlick

            model: transactionsmodel
            delegate: Column {
                id: delegate
                property int row: index


                Row {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: 30
                        anchors.rightMargin: 30
                        height: 65
                        spacing: 0
                        ItemDelegate {
                            property int column: 0
                            width: datewidth
                            id: date
                            text: ""
                            clip: true
                            Label {
                                text: transactiondate
                                anchors.leftMargin: 20
                                anchors.rightMargin: 8
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter                                
                                font.weight: Font.DemiBold
                                font.family: "Montserrat SemiBold"
                                font.pixelSize: 14
                                color: "#202124"
                            }
                            ToolTip.delay: 1000
                            ToolTip.timeout: 5000
                            ToolTip.visible: hovered
                            ToolTip.text: transactiondate+"\n"+tooltip
                            MouseArea {
                                anchors.fill: parent
                                acceptedButtons: Qt.RightButton
                                hoverEnabled: true
                                onClicked: {
                                    contextMenu.x = mouse.x;
                                    contextMenu.y = mouse.y;
                                    contextMenu.open();
                                }
                                onPressAndHold: {
                                    if (mouse.source === Qt.MouseEventNotSynthesized) {
                                        contextMenu.x = mouse.x;
                                        contextMenu.y = mouse.y;
                                        contextMenu.open();
                                    }
                                }
                            }
                            Menu {
                                id: contextMenu
                                MenuItem {
                                    text: "Copy date"
                                    onTriggered: {
                                        copytextfield.text=transactiondate
                                        copytextfield.selectAll()
                                        copytextfield.copy()
                                    }
                                }
                            }
                            onDoubleClicked: {
                                showtxdetailsintern(index)
                            }
                        }
                        ItemDelegate {
                            property int column: 1
                            width: typewidth
                            text: ""
                            clip: true
                            Image {
                                id: typimage
                                anchors.left: parent.left
                                anchors.leftMargin: 20
                                anchors.verticalCenter: parent.verticalCenter

                                fillMode: Image.PreserveAspectFit
                                source: geticonname(transactiontypeno)
                            }
                            Label {
                                text: transactiontype
                                anchors.leftMargin: 8
                                anchors.rightMargin: 8
                                anchors.left: typimage.right
                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter                                
                                font.weight: Font.Normal
                                font.family: "Montserrat"                                
                                font.pixelSize: 14
                                color: "#202124"
                            }
                            ToolTip.delay: 1000
                            ToolTip.timeout: 5000
                            ToolTip.visible: hovered
                            ToolTip.text: transactiontype+"\n"+tooltip
                            MouseArea {
                                anchors.fill: parent
                                acceptedButtons: Qt.RightButton
                                hoverEnabled: true
                                onClicked: {
                                    contextMenutyp.x = mouse.x;
                                    contextMenutyp.y = mouse.y;
                                    contextMenutyp.open();
                                }
                                onPressAndHold: {
                                    if (mouse.source === Qt.MouseEventNotSynthesized) {
                                        contextMenutyp.x = mouse.x;
                                        contextMenutyp.y = mouse.y;
                                        contextMenutyp.open();
                                    }
                                }
                            }
                            Menu {
                                id: contextMenutyp
                                MenuItem {
                                    text: "Copy type"
                                    onTriggered: {
                                        copytextfield.text=transactiontype
                                        copytextfield.selectAll()
                                        copytextfield.copy()
                                    }
                                }
                            }
                            onDoubleClicked: {
                                showtxdetailsintern(index)
                            }
                        }
                        ItemDelegate {
                            property int column: 2
                            width: addresswidth
                            text: ""
                            Label {
                                text: transactionaddress
                                anchors.leftMargin: 20
                                anchors.rightMargin: 8
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter                                
                                font.weight: Font.Normal
                                font.family: "Montserrat"                                
                                font.pixelSize: 14
                                color: "#202124"
                            }
                            clip: true
                            ToolTip.delay: 1000
                            ToolTip.timeout: 5000
                            ToolTip.visible: hovered
                            ToolTip.text: transactionaddress+"\n"+tooltip
                            MouseArea {
                                anchors.fill: parent
                                acceptedButtons: Qt.RightButton
                                hoverEnabled: true
                                onClicked: {
                                    contextMenuaddress.x = mouse.x;
                                    contextMenuaddress.y = mouse.y;
                                    contextMenuaddress.open();
                                }
                                onPressAndHold: {
                                    if (mouse.source === Qt.MouseEventNotSynthesized) {
                                        contextMenuaddress.x = mouse.x;
                                        contextMenuaddress.y = mouse.y;
                                        contextMenuaddress.open();
                                    }
                                }
                            }
                            Menu {
                                id: contextMenuaddress
                                MenuItem {
                                    text: "Copy address"
                                    onTriggered: {
                                        copytextfield.text=transactionaddress
                                        copytextfield.selectAll()
                                        copytextfield.copy()
                                    }
                                }
                            }
                            onDoubleClicked: {
                                showtxdetailsintern(index)
                            }
                        }
                        ItemDelegate {
                            property int column: 3
                            width: transactionsForm.width-datewidth-typewidth-addresswidth-amountwidth-30-30
                            text: ""
                            Label {
                                text: transactionreferenceline
                                anchors.leftMargin: 20
                                anchors.rightMargin: 8
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter                                
                                font.weight: Font.Normal
                                font.family: "Montserrat"                                
                                font.pixelSize: 14
                                color: "#202124"
                            }
                            clip: true
                            ToolTip.delay: 1000
                            ToolTip.timeout: 5000
                            ToolTip.visible: hovered
                            ToolTip.text: transactionreferenceline+"\n"+tooltip
                            MouseArea {
                                anchors.fill: parent
                                acceptedButtons: Qt.RightButton
                                hoverEnabled: true
                                onClicked: {
                                    contextMenurefline.x = mouse.x;
                                    contextMenurefline.y = mouse.y;
                                    contextMenurefline.open();
                                }
                                onPressAndHold: {
                                    if (mouse.source === Qt.MouseEventNotSynthesized) {
                                        contextMenurefline.x = mouse.x;
                                        contextMenurefline.y = mouse.y;
                                        contextMenurefline.open();
                                    }
                                }
                            }
                            Menu {
                                id: contextMenurefline
                                MenuItem {
                                    text: "Copy description"
                                    onTriggered: {
                                        copytextfield.text=transactionreferenceline
                                        copytextfield.selectAll()
                                        copytextfield.copy()
                                    }
                                }
                            }
                            onDoubleClicked: {
                                showtxdetailsintern(index)
                            }
                        }
                        ItemDelegate {
                            property int column: 4
                            width: amountwidth
                            text: ""
                            Label {
                                text: transactionamount
                                anchors.leftMargin: 8
                                anchors.rightMargin: 20
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter
                                horizontalAlignment: Text.AlignRight                                
                                font.weight: Font.Bold
                                font.family: "Montserrat"                                
                                font.pixelSize: 14
                                color: "#202124"
                            }
                            clip: true
                            ToolTip.delay: 1000
                            ToolTip.timeout: 5000
                            ToolTip.visible: hovered
                            ToolTip.text: transactionamount+"\n"+tooltip
                            MouseArea {
                                anchors.fill: parent
                                acceptedButtons: Qt.RightButton
                                hoverEnabled: true
                                onClicked: {
                                    contextMenuamount.x = mouse.x;
                                    contextMenuamount.y = mouse.y;
                                    contextMenuamount.open();
                                }
                                onPressAndHold: {
                                    if (mouse.source === Qt.MouseEventNotSynthesized) {
                                        contextMenuamount.x = mouse.x;
                                        contextMenuamount.y = mouse.y;
                                        contextMenuamount.open();
                                    }
                                }
                            }
                            Menu {
                                id: contextMenuamount
                                MenuItem {
                                    text: "Copy amount"
                                    onTriggered: {
                                        copytextfield.text=transactionamount
                                        copytextfield.selectAll()
                                        copytextfield.copy()
                                    }
                                }
                            }
                            onDoubleClicked: {
                                showtxdetailsintern(index)
                            }
                        }

                }
                Rectangle {
                    width: parent.width
                    height: 1
                    color: Material.accent
                }
            }

            ScrollIndicator.horizontal: ScrollIndicator { }
            ScrollIndicator.vertical: ScrollIndicator { }
    }

        MenuTextField {
            id: filterEdit
            y: 31
            height: 44
            text: ""
            font.pixelSize: 14
            font.family: "Montserrat"
            placeholderText: "Search for address, transaction id or description..."
            bottomPadding: 10
            topPadding: 10
            rightPadding: 16
            leftPadding: 46
            anchors.topMargin: 30
            anchors.top:historycap.bottom
            anchors.right: downloadlistbtn.left
            anchors.rightMargin: 20
            anchors.left: dateselect.right
            anchors.leftMargin: 20
            selectByMouse: true
            onTextChanged: filtereditchangedsignalintern(text)
            background: Rectangle
            {
                radius: 3
                border.width: 1
                border.color: "#eeeeef"
                Image {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    fillMode: Image.PreserveAspectFit
                    source: "../res/assets/Miscellaneous/search.png"
                }

            }

        }

        Rectangle {
            id: detaildialog
            width: 600
            height: 500
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            color:Material.background
            radius: 10
            border.width: 3
            visible: false

            TextArea{
                id: detailarea
                textFormat: Text.RichText
                readOnly: true
                anchors.left:parent.left
                anchors.leftMargin: 10
                anchors.top:parent.top
                anchors.topMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.bottom:parent.bottom
                anchors.bottomMargin: 70
                selectByMouse: true
                wrapMode: TextEdit.Wrap                
            }
            Button{
                text: "Ok"
                anchors.top:detailarea.bottom
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: detaildialog.visible=false
            }

        }

        ComboBox {
            currentIndex: 4
            id: dateselect
            onActivated: datefiltersignalintern(index)
            width: 200
            font.pixelSize: 14
            font.family: "Montserrat"
            anchors.top: historycap.bottom
            anchors.topMargin: 28
            anchors.left: parent.left
            anchors.leftMargin: 30
            textRole: "key"
            model: ListModel {
                   ListElement { key: "Last month"; value: 1 }
                   ListElement { key: "Last 3 months"; value: 2 }
                   ListElement { key: "Last 6 months"; value: 3 }
                   ListElement { key: "Last year"; value: 4 }
                   ListElement { key: "Anytime"; value: 5 }
            }
        }


        Button {
            id: downloadlistbtn
            anchors.right: parent.right
            anchors.rightMargin: 40
            anchors.verticalCenter: filterEdit.verticalCenter
            width: 207
            onClicked: {
                downloadtransactionsSignalintern()
            }
            y: 13
            background: Image {
                id: imageforbutton                
                fillMode: Image.PreserveAspectFit
                source: "../res/assets/Miscellaneous/download.png"
                Label {
                    id: labelforbutton
                    color: "#3e45ac"
                    text: qsTr("Download list of transactions")
                    font.weight: Font.DemiBold
                    anchors.verticalCenterOffset: 0
                    font.pixelSize: 13
                    font.family: "Montserrat SemiBold"
                    anchors.left: parent.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }

}
