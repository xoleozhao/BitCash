import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.3
import AmountEntryValidator 1.0

Item {
    id: sendlinksform
    width: 1100
    height: 800

    property int  datewidth : 150
    property int  btnswidth : 50
    property int  btnswidth2 : 50
    property int  linkwidth : 400
    property int  amountwidth : 220



    signal sendlinkBtnSignalIntern(string description, double amount)
    signal claimlinkBtnSignalIntern(string link)
    signal deletelinksignalintern(string link)
    signal undolinkremovalSignalintern()

    property real maxbalancenum : 0

    function setmaxbalanceintern(avail,availnum) {
        maxbalance.text=avail
        maxbalancenum=availnum;
    }


    function generatedlinkintern() {
        text11.text=qsTr("You have successfully generated a link which you can send to anyone. The link has been copied to the clipboard.")
        toolBar2.visible=true;
        timer.setTimeout(function(){
            toolBar2.visible=false
        }, 5000);
    }

    function closelinksundoinfointern(show) {
        infobox.visible=show
    }
    function clearlinklistmodelintern() {
        linksmodel.clear()
    }

    function displayerrormessageintern(msg) {
        errorlabel.text=msg
        infoboxerror.visible=true
        timer.setTimeout(function(){
            infoboxerror.visible=false
        }, 5000);
    }

    function addbitcashexpresslinkintern(link,desc,amount,date) {
        linksmodel.insert(0,{
                               "name": link,
                               "description": desc,
                               "amount": amount,
                               "txdate": date
                           })
        amountEdit.text=""
        descriptionEdit.text=""
    }
    function bitcashexpressclaimedintern() {
        linkedit.text=""
        text11.text=qsTr("You have successfully claimed the coins from the link.")
        toolBar2.visible=true;
        timer.setTimeout(function(){
            toolBar2.visible=false
        }, 5000);
    }
    AmountEntryValidator {
        // use it
        id: amountCheckVal
    }

    ListModel {
        id: linksmodel

       /* ListElement {
            name: "Apple"
            amount: 2.45
            description: "hgfhdh"
        }
        ListElement {
            name: "Orange"
            amount: 3.25
            description: "f435345"
        }
        ListElement {
            name: "Banana"
            amount: 1.95
            description: "ffff"
        }*/
    }

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
            text: qsTr("If you want to send BitCash to someone without an existing BitCash address, you can simply create a BitCash link and send it via email, SMS or social media.")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 13
            font.weight: Font.DemiBold
            font.family: "Montserrat SemiBold"
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
            text: ""
            font.pixelSize: 13
            font.weight: Font.DemiBold
            font.family: "Montserrat SemiBold"
            color: "#1bb846"
        }
    }

    ShadowBox {
        id: whitebox
        anchors.left: parent.left
        anchors.leftMargin: 24
        anchors.right: parent.horizontalCenter
        anchors.rightMargin: 9
        color: "white"
        radius: 3
        border.width: 0
        y: 68
        height: 222
    }

    ShadowBox {
        id: whitebox2
        anchors.right: parent.right
        anchors.leftMargin: 9
        anchors.left: parent.horizontalCenter
        anchors.rightMargin: 24
        color: "white"
        radius: 1
        border.width: 0
        y: 68
        height: 222
    }

    property alias descriptionEdit: descriptionEdit
    MenuTextField {
        id: descriptionEdit
        height: 48
        color: "#202124"
        font.pixelSize: 14
        font.family: "Montserrat"
        anchors.top: sendcap.bottom
        anchors.topMargin: 30
        anchors.right: amountEdit.left
        anchors.rightMargin: 20
        topPadding: 16
        padding: 16
        leftPadding: 16
        placeholderText: "Description"
        anchors.left: whitebox.left
        anchors.leftMargin: 36
        selectByMouse: true
    }

    MenuTextField {
        id: amountEdit
        x: 257
        width: 180
        height: 48
        color: "#202124"
        font.pixelSize: 14
        font.family: "Montserrat"
        anchors.top: descriptionEdit.top
        anchors.topMargin: 0
        anchors.right: whitebox.right
        anchors.rightMargin: 116
        topPadding: 16
        padding: 16
        placeholderText: "Amount"
        horizontalAlignment: Text.AlignLeft
        validator: amountCheckVal
        selectByMouse: true
    }
    Rectangle {
        anchors.left: amountEdit.right
        anchors.top: amountEdit.top
        anchors.bottom: amountEdit.bottom
        width: 80
        radius: 4
        border.width: 1
        border.color: "#eeeeef"
        color: "#f7f7f7"
        Text {
            color: "#4d505e"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            padding: 16
            text: "BITC"
            font.pixelSize: 14
            font.weight: Font.Normal
            font.family: "Montserrat"
        }
    }


    Mybutton {
        id: sendBtn
        height: 44
        text: qsTr("Generate link")
        font.weight: Font.DemiBold
        font.pixelSize: 14
        anchors.top: descriptionEdit.bottom
        anchors.topMargin: 20
        rightPadding: 20
        anchors.left: whitebox.left
        anchors.leftMargin: 36
        leftPadding: 20
        font.capitalization: Font.MixedCase
        font.family: "Montserrat SemiBold"
        onClicked:
        {   sendlinkBtnSignalIntern(descriptionEdit.text,amountEdit.text)
        }
    }

    Mybutton {
        id: availableBalanceBtn
        x: 201
        y: 134
        text: qsTr("Use available balance")
        visible: false
        anchors.right: parent.right
        anchors.rightMargin: 8
        onClicked: amountEdit.text=maxbalancenum
        leftPadding: 8
        font.capitalization: Font.MixedCase
        font.family: "Montserrat"
    }

    property alias maxbalance: maxbalance
    Label {
        id: maxbalance
        x: 304
        y: 193
        text: qsTr("0.000000 BITC")
        visible: false
        anchors.right: parent.right
        anchors.rightMargin: 8
        font.pixelSize: 12
        font.family: "Montserrat"
    }

    Label {
        id: text7
        x: 240
        y: 193
        width: 58
        height: 15
        text: qsTr("Balance:")
        visible: false
        anchors.right: maxbalance.left
        anchors.rightMargin: 6
        font.pixelSize: 12
        font.family: "Montserrat"
    }

    Row {
        id: header
        clip: true
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 30
        anchors.rightMargin: 30
        anchors.top: historycap.bottom
        anchors.topMargin: 20
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
            font.weight: Font.DemiBold            
            font.pixelSize: 13
            font.family: "Montserrat SemiBold"
            color:"#202124"
            padding: 10
            background: Rectangle { color: "#ebebeb" }
        }
                        Label {
                            width: sendlinksform.width-amountwidth-linkwidth-btnswidth2-btnswidth-datewidth-30-30
                            height: 44
                            text: "Description"
                            verticalAlignment: Text.AlignVCenter
                            anchors.verticalCenter: parent.verticalCenter
                            rightPadding: 20
                            leftPadding: 20
                            font.weight: Font.DemiBold                            
                            font.pixelSize: 13
                            font.family: "Montserrat SemiBold"
                            color:"#202124"
                            padding: 10
                            background: Rectangle { color: "#ebebeb" }
                        }

                        Label {
                            width: linkwidth
                            height: 44
                            text: "Link"
                            verticalAlignment: Text.AlignVCenter
                            anchors.verticalCenter: parent.verticalCenter
                            rightPadding: 20
                            leftPadding: 20
                            font.weight: Font.DemiBold                            
                            font.pixelSize: 13
                            font.family: "Montserrat SemiBold"
                            color:"#202124"
                            padding: 10
                            background: Rectangle { color: "#ebebeb" }
                        }
                        Label {
                            width: btnswidth
                            height: 44
                            text: ""
                            verticalAlignment: Text.AlignVCenter
                            anchors.verticalCenter: parent.verticalCenter
                            rightPadding: 20
                            leftPadding: 20
                            font.weight: Font.DemiBold
                            font.pixelSize: 13
                            font.family: "Montserrat SemiBold"
                            color:"black"
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
                            font.weight: Font.DemiBold
                            horizontalAlignment: Text.AlignRight                            
                            font.pixelSize: 13
                            font.family: "Montserrat SemiBold"
                            color:"black"
                            padding: 10
                            background: Rectangle { color: "#ebebeb" }
                        }
                        Label {
                            width: btnswidth2
                            height: 44
                            text: ""
                            verticalAlignment: Text.AlignVCenter
                            anchors.verticalCenter: parent.verticalCenter
                            rightPadding: 20
                            leftPadding: 20
                            font.weight: Font.DemiBold                            
                            font.pixelSize: 13
                            font.family: "Montserrat SemiBold"
                            color:"black"
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

    property alias listView: listView
    ListView {
        id: listView
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        anchors.top: header.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        clip: true

            contentWidth: header.width
            flickableDirection: Flickable.VerticalFlick

            model: linksmodel
            delegate: Column {
                id: delegate
                property int row: index


                Row {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: 30
                        anchors.rightMargin: 30
                        spacing: 0
                        height: 65

                        ItemDelegate {
                            property int column: 0
                            width: datewidth
                            id: date
                            text: ""
                            clip: true
                            Label {
                                text: txdate
                                anchors.leftMargin: 20
                                anchors.rightMargin: 8
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter                                
                                font.pixelSize: 14
                                font.weight: Font.DemiBold                                
                                font.family: "Montserrat SemiBold"
                                color: "#202124"
                            }
                            ToolTip.delay: 1000
                            ToolTip.timeout: 5000
                            ToolTip.visible: hovered
                            ToolTip.text: txdate
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
                                        copytextfield.text=txdate
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
                            width: sendlinksform.width-linkwidth-amountwidth-datewidth-btnswidth-btnswidth2-30-30
                            text: ""
                            Label {
                                text: description
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
                            ToolTip.text: description
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
                                        copytextfield.text=description
                                        copytextfield.selectAll()
                                        copytextfield.copy()
                                    }
                                }
                            }

                        }

                        ItemDelegate {
                            property int column: 2
                            width: linkwidth
                            text: ""
                            Label {
                                text: name
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
                            ToolTip.text: name
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
                                    text: "Copy link"
                                    onTriggered: {
                                        copytextfield.text=name
                                        copytextfield.selectAll()
                                        copytextfield.copy()
                                    }
                                }
                            }
                        }
                        ItemDelegate {
                            property int column: 4
                            width: btnswidth
                            text: ""
                            Button {
                                anchors.leftMargin: 20
                                anchors.left: parent.left
                                anchors.verticalCenter: parent.verticalCenter
                                onClicked: {
                                    copytextfield.text=name
                                    copytextfield.selectAll()
                                    copytextfield.copy()
                                    infoboxcopied.visible=true
                                    timer.setTimeout(function(){
                                        infoboxcopied.visible=false
                                    }, 3000);
                                }
                                background: Image {
                                    id: imageforbutton                                    
                                    fillMode: Image.PreserveAspectFit
                                    source: "../res/assets/Miscellaneous/copy-link.png"
                                }
                            }
                            clip: true

                        }
                        ItemDelegate {
                            property int column: 3
                            width: amountwidth
                            text: ""
                            Label {
                                text: amount
                                anchors.leftMargin: 8
                                anchors.rightMargin: 20
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter
                                horizontalAlignment: Text.AlignRight

                                font.family: "Montserrat"
                                font.bold: true                                
                                font.pixelSize: 14
                                color: "#202124"
                            }
                            clip: true
                            ToolTip.delay: 1000
                            ToolTip.timeout: 5000
                            ToolTip.visible: hovered
                            ToolTip.text: amount
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
                                        copytextfield.text=amount
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
                            width: btnswidth2
                            text: ""
                            Button {
                                anchors.leftMargin: 20
                                anchors.left: parent.left
                                anchors.verticalCenter: parent.verticalCenter
                                onClicked: {
                                    deletelinksignalintern(name)
                                    linksmodel.remove(index)
                                }
                                background: Image {
                                    id: imageforbutton2                                    
                                    fillMode: Image.PreserveAspectFit
                                    source: "../res/assets/Miscellaneous/delete.png"
                                }
                            }
                            clip: true

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

    Label {
        id: label
        x: 8
        y: 234
        text: qsTr("Created links:")
        visible: false
    }

    MenuTextField {
        id: linkedit
        height: 48
        anchors.top: descriptionEdit.top

        color: "#202124"
        font.pixelSize: 14
        font.family: "Montserrat"
        anchors.right: whitebox2.right
        anchors.rightMargin: 36
        anchors.left: whitebox2.left
        anchors.leftMargin: 36
        padding: 16
        rightPadding: 16
        leftPadding: 16
        topPadding: 16
        placeholderText: "Paste your link here"
        anchors.topMargin: 0
        selectByMouse: true
    }


    Mybutton {
        id: claimcoinsbtn
        height: 44
        anchors.top: sendBtn.top
        text: qsTr("Receive money")
        font.weight: Font.DemiBold
        font.pixelSize: 14
        rightPadding: 20
        anchors.left: whitebox2.left
        anchors.leftMargin: 36
        anchors.topMargin: 0
        leftPadding: 20
        font.capitalization: Font.MixedCase
        font.family: "Montserrat SemiBold"
        onClicked:
        {   claimlinkBtnSignalIntern(linkedit.text)
        }
    }

    Image {
        id: receiveicon
        anchors.left: whitebox.left
        anchors.verticalCenter: sendcap.verticalCenter
        anchors.leftMargin: 36
        fillMode: Image.PreserveAspectFit
        source: "../res/assets/Navigation/send-inactive.png"
    }

    Text {
        id: sendcap
        color: "#202124"
        anchors.left: receiveicon.right
        anchors.leftMargin: 15
        text: qsTr("Send money")
        font.pixelSize: 18
        anchors.top: whitebox.top
        anchors.topMargin: 31
        font.weight: Font.DemiBold
        font.family: "Montserrat SemiBold"
    }

    Image {
        id: receiveicon2
        anchors.left: whitebox2.left
        anchors.verticalCenter: reccap.verticalCenter
        anchors.leftMargin: 36
        fillMode: Image.PreserveAspectFit
        source: "../res/assets/Navigation/receive-inactive.png"
    }

    Text {
        id: reccap
        color: "#202124"
        anchors.left: receiveicon2.right
        anchors.leftMargin: 15
        text: qsTr("Receive money")
        font.pixelSize: 18
        font.weight: Font.DemiBold
        font.family: "Montserrat SemiBold"
        anchors.top: whitebox2.top
        anchors.topMargin: 31
    }

    Image {
        id: historyicon
        y: 36
        anchors.verticalCenter: historycap.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 30
        fillMode: Image.PreserveAspectFit
        source: "../res/assets/Navigation/history-inactive.png"
    }

    Text {
        id: historycap
        width: 97
        color: "#202124"
        anchors.left: historyicon.right
        anchors.leftMargin: 15
        text: qsTr("History of generated links")
        font.pixelSize: 18
        font.family: "Montserrat SemiBold"
        anchors.top: whitebox.bottom
        anchors.topMargin: 40
        font.weight: Font.DemiBold        
    }
    Rectangle{
        id: infoboxcopied
        visible: false
        anchors.left:parent.left
        anchors.bottom:parent.bottom
        anchors.leftMargin: 30
        anchors.bottomMargin: 80
        height: 44
        width: 270
        radius: 3
        border.width: 0
        color: "#4d505e"
        Label{
            text: qsTr("Link copied to clipboard.")
            font.weight: Font.DemiBold
            font.pixelSize: 14
            font.family: "Montserrat SemiBold"
            color: "#ffffff"
            anchors.left:parent.left
            anchors.leftMargin: 20
            anchors.verticalCenter: parent.verticalCenter
        }
        Button {
            id: closebuttoncopy
            onClicked: infoboxcopied.visible = false            
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

    Rectangle{
        id: infobox
        visible: false
        anchors.left:parent.left
        anchors.bottom:parent.bottom
        anchors.leftMargin: 30
        anchors.bottomMargin: 30
        height: 44
        width: 270
        radius: 3
        border.width: 0
        color: "#4d505e"
        Label{
            text: qsTr("Removed link.")
            font.weight: Font.DemiBold
            font.pixelSize: 14
            font.family: "Montserrat SemiBold"
            color: "#ffffff"
            anchors.left:parent.left
            anchors.leftMargin: 20
            anchors.verticalCenter: parent.verticalCenter
        }
        Button {
            id: closebutton
            onClicked: infobox.visible = false
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
        Mybutton{
            width: 61
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: closebutton.left
            anchors.rightMargin: 20
            text: "Undo"
            font.weight: Font.DemiBold
            leftPadding: 10
            height:28
            font.capitalization: Font.MixedCase
            font.family: "Montserrat SemiBold"
            btncolor: "#ffffff"
            btncolordown: "#e5e5e5"
            txtcolor: "#3e45ac"
            txtcolordown: "#353b9b"
            onClicked: undolinkremovalSignalintern()
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

