import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.3
import AmountEntryValidator 1.0

Item {
    id: item1
    visible: false
    width: parent.width
    height: parent.height
    /*visible: true
    width: 1024
    height: 768*/

    property int  targetwidth : 170
    property int  amountwidth : 200
    property int  senddollarwidth : 75
    property int  btnswidth : 50

    signal createOrderBtnSignalIntern(double amounttosend, double targetPrice, bool senddollar, bool whenpricegoesabove)
    signal deleteordersignalintern(string idstr)

    AmountEntryValidator {
        // use it
        id: amountCheckVal
    }

    function addorderintern(id, amount, target, senddollar, whenabove) {
        linksmodel.insert(0,{
                               "idstr": id,
                               "amount": amount,
                               "target": target,
                               "senddollar": senddollar,
                               "whenabove": whenabove
                           })
    }

    function clearorderslistmodelintern() {
        linksmodel.clear()
    }
    function clearorderfieldsintern(msg) {
        amounttosend.text = ""
        targetPrice.text = ""
    }

    function displayerrormessageintern(msg) {
        errorlabel.text = msg
        infoboxerror.visible = true
        timer.setTimeout(function(){
            infoboxerror.visible = false
        }, 5000);
    }

    function displayInfobox() {
        infobox.visible = true;
        timer.setTimeout(function(){
            infobox.visible = false
        }, 1000);
    }


    ListModel {
        id: linksmodel
    }

    Flickable {
        clip: true
        width: parent.width
        height: parent.height
        contentWidth: width
        contentHeight: 1024
        ScrollBar.vertical: ScrollBar {
            active: true;
            width: 10
            onActiveChanged: {
                if (!active)
                active = true;
            }
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
            height: 750


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

////////////// Main content ////////////////////
            SwipeView {
                id: swipeView
                clip: true
                //interactive: false
                anchors.top: tabBar.bottom
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                currentIndex: tabBar.currentIndex
                Item {
                    id: createorder

                    Rectangle {
                        id: radiogroup1
                        width: childrenRect.width
                        height: childrenRect.height
                        anchors.top: parent.top
                        anchors.topMargin: 30
                        anchors.left: parent.left
                        anchors.leftMargin: 30

                        RadioButton {
                            id: sendbitcash
                            text: qsTr("Send BitCash to your BitCash Dollar account")
                            bottomPadding: 8
                            visible: true
                            font.weight: Font.DemiBold
                            font.pixelSize: 14
                            font.family: "Montserrat SemiBold"
                            topPadding: 8
                            anchors.top: parent.top
                            anchors.topMargin: 0
                            leftPadding: 0
                            anchors.left: parent.left
                            anchors.leftMargin: 0
                            checked: true
                            onClicked: currencytosend.text = "BITC"
                        }
                        RadioButton {
                            id: senddollar
                            text: qsTr("Send BitCash Dollar to your BitCash account")
                            bottomPadding: 8
                            visible: true
                            font.weight: Font.DemiBold
                            font.pixelSize: 14
                            font.family: "Montserrat SemiBold"
                            topPadding: 8
                            anchors.top: sendbitcash.bottom
                            anchors.topMargin: 0
                            leftPadding: 0
                            anchors.left: parent.left
                            anchors.leftMargin: 0
                            onClicked: currencytosend.text = "USD"
                        }
                    }
                    Label {
                        id: label1
                        color: "#202124"
                        text: qsTr("If the price of one BitCash")
                        font.weight: Font.Normal
                        anchors.top: radiogroup1.bottom
                        anchors.topMargin: 30
                        anchors.left: parent.left
                        anchors.leftMargin: 30
                        font.family: "Montserrat SemiBold"
                        font.pixelSize: 14
                    }

                    Rectangle {
                        id: radiogroup2
                        width: childrenRect.width
                        height: childrenRect.height
                        anchors.top: label1.bottom
                        anchors.topMargin: 30
                        anchors.left: parent.left
                        anchors.leftMargin: 30

                        RadioButton {
                            id: goesbelow
                            text: qsTr("Goes below the target price of")
                            bottomPadding: 8
                            visible: true
                            font.weight: Font.DemiBold
                            font.pixelSize: 14
                            font.family: "Montserrat SemiBold"
                            topPadding: 8
                            anchors.top: parent.top
                            anchors.topMargin: 0
                            leftPadding: 0
                            anchors.left: parent.left
                            anchors.leftMargin: 0
                            checked: true
                        }
                        RadioButton {
                            id: goesabove
                            text: qsTr("Goes above the target price of")
                            bottomPadding: 8
                            visible: true
                            font.weight: Font.DemiBold
                            font.pixelSize: 14
                            font.family: "Montserrat SemiBold"
                            topPadding: 8
                            anchors.top: goesbelow.bottom
                            anchors.topMargin: 0
                            leftPadding: 0
                            anchors.left: parent.left
                            anchors.leftMargin: 0
                        }
                    }

                    MenuTextField {
                        id: targetPrice
                        width: 228
                        height: 48
                        font.pixelSize: 14
                        font.family: "Montserrat"
                        topPadding: 16
                        padding: 16
                        anchors.top: radiogroup2.top
                        anchors.topMargin: 10
                        anchors.left: radiogroup2.right
                        anchors.leftMargin: 30
                        horizontalAlignment: Text.AlignLeft
                        selectByMouse: true
                        placeholderText: "0.000000000"
                        validator: amountCheckVal
                    }
                    Rectangle {
                        anchors.left: targetPrice.right
                        anchors.top: targetPrice.top
                        anchors.bottom: targetPrice.bottom
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
                            text: "USD"
                            font.pixelSize: 14
                            font.weight: Font.Normal
                            font.family: "Montserrat"
                        }
                    }
                    Label {
                        id: text4
                        color: "#3d3e40"
                        text: qsTr("Amount to send:")
                        font.weight: Font.DemiBold
                        anchors.top: radiogroup2.bottom
                        anchors.topMargin: 30
                        anchors.left: parent.left
                        anchors.leftMargin: 30
                        font.pixelSize: 14
                        font.family: "Montserrat SemiBold"
                    }
                    MenuTextField {
                        id: amounttosend
                        width: 228
                        height: 48
                        font.pixelSize: 14
                        font.family: "Montserrat"
                        topPadding: 16
                        padding: 16
                        anchors.top: text4.bottom
                        anchors.topMargin: 20
                        anchors.left: parent.left
                        anchors.leftMargin: 30
                        horizontalAlignment: Text.AlignLeft
                        selectByMouse: true
                        placeholderText: "0.000000000"
                        validator: amountCheckVal
                    }
                    Rectangle {
                        anchors.left: amounttosend.right
                        anchors.top: amounttosend.top
                        anchors.bottom: amounttosend.bottom
                        width: 80
                        radius: 4
                        border.width: 1
                        border.color: "#eeeeef"
                        color: "#f7f7f7"
                        Text {
                            id: currencytosend
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
                        text: qsTr("Create order")
                        font.weight: Font.DemiBold
                        font.pixelSize: 14
                        leftPadding: 44
                        rightPadding: 20
                        anchors.left: parent.left
                        anchors.leftMargin: 36
                        anchors.top: amounttosend.bottom
                        anchors.topMargin: 30
                        iconname: "../res/assets/Miscellaneous/button-send.png"
                        font.capitalization: Font.MixedCase
                        font.family: "Montserrat SemiBold"
                        onClicked: createOrderBtnSignalIntern(amounttosend.text, targetPrice.text, senddollar.checked, goesabove.checked)
                    }

                }

                Item {
                    id: listoforders

////////////////////////////////////////////////////// LIST of Orders ////////////////////////////////////////////////
                    Row {
                        id: headerlinks
                        clip: true
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: 30
                        anchors.rightMargin: 30
                        anchors.top: parent.top
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
                            width: listViewlinks.width-targetwidth-amountwidth-senddollarwidth-btnswidth-30-30
                            height: 44
                            text: "If"
                            verticalAlignment: Text.AlignVCenter
                            anchors.verticalCenter: parent.verticalCenter
                            rightPadding: 20
                            leftPadding: 20
                            font.weight: Font.DemiBold
                            horizontalAlignment: Text.AlignLeft
                            font.pixelSize: 13
                            font.family: "Montserrat SemiBold"
                            color:"black"
                            padding: 10
                            background: Rectangle { color: "#ebebeb" }
                        }
                        Label {
                            width: targetwidth
                            height: 44
                            text: "USD"
                            verticalAlignment: Text.AlignVCenter
                            anchors.verticalCenter: parent.verticalCenter
                            horizontalAlignment: Text.AlignRight
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
                            width: amountwidth
                            height: 44
                            text: "Send amount"
                            verticalAlignment: Text.AlignVCenter
                            anchors.verticalCenter: parent.verticalCenter
                            horizontalAlignment: Text.AlignRight
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
                            width: senddollarwidth
                            height: 44
                            text: ""
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



                    }

                    TextField
                    {
                        id: copytextfieldlinks
                        width: 0
                        height: 0
                        visible: false
                    }

                    property alias listViewlinks: listViewlinks
                    ListView {
                        id: listViewlinks
                        anchors.topMargin: 0
                        anchors.bottomMargin: 0
                        anchors.top: headerlinks.bottom
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        clip: true

                            contentWidth: headerlinks.width
                            flickableDirection: Flickable.VerticalFlick

                            model: linksmodel
                            delegate: Column {
                                id: delegatelinks
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
                                            width: listViewlinks.width-targetwidth-amountwidth-senddollarwidth-btnswidth-30-30
                                            text: ""
                                            Label {
                                                text: whenabove
                                                anchors.leftMargin: 8
                                                anchors.rightMargin: 20
                                                anchors.left: parent.left
                                                anchors.right: parent.right
                                                anchors.verticalCenter: parent.verticalCenter
                                                horizontalAlignment: Text.AlignLeft

                                                font.family: "Montserrat"
                                                font.bold: true
                                                font.pixelSize: 14
                                                color: "#202124"
                                            }
                                            clip: true
                                            ToolTip.delay: 1000
                                            ToolTip.timeout: 5000
                                            ToolTip.visible: hovered
                                            ToolTip.text: whenabove
                                            MouseArea {
                                                anchors.fill: parent
                                                acceptedButtons: Qt.RightButton
                                                hoverEnabled: true
                                                onClicked: {
                                                    contextMenucurrencyan.x = mouse.x;
                                                    contextMenucurrencyan.y = mouse.y;
                                                    contextMenucurrencyan.open();
                                                }
                                                onPressAndHold: {
                                                    if (mouse.source === Qt.MouseEventNotSynthesized) {
                                                        contextMenucurrencyan.x = mouse.x;
                                                        contextMenucurrencyan.y = mouse.y;
                                                        contextMenucurrencyan.open();
                                                    }
                                                }
                                            }
                                            Menu {
                                                id: contextMenucurrencyan
                                                MenuItem {
                                                    text: "Copy when"
                                                    onTriggered: {
                                                        copytextfieldlinks.text = whenabove
                                                        copytextfieldlinks.selectAll()
                                                        copytextfieldlinks.copy()
                                                    }
                                                }
                                            }
                                        }

                                        ItemDelegate {
                                            property int column: 1
                                            width: targetwidth
                                            text: ""
                                            Label {
                                                text: target
                                                anchors.leftMargin: 20
                                                anchors.rightMargin: 8
                                                anchors.left: parent.left
                                                anchors.right: parent.right
                                                anchors.verticalCenter: parent.verticalCenter
                                                horizontalAlignment: Text.AlignRight
                                                font.weight: Font.Normal
                                                font.family: "Montserrat"
                                                font.pixelSize: 14
                                                color: "#202124"
                                            }
                                            clip: true
                                            ToolTip.delay: 1000
                                            ToolTip.timeout: 5000
                                            ToolTip.visible: hovered
                                            ToolTip.text: target
                                            MouseArea {
                                                anchors.fill: parent
                                                acceptedButtons: Qt.RightButton
                                                hoverEnabled: true
                                                onClicked: {
                                                    contextMenureflinelinks.x = mouse.x;
                                                    contextMenureflinelinks.y = mouse.y;
                                                    contextMenureflinelinks.open();
                                                }
                                                onPressAndHold: {
                                                    if (mouse.source === Qt.MouseEventNotSynthesized) {
                                                        contextMenureflinelinks.x = mouse.x;
                                                        contextMenureflinelinks.y = mouse.y;
                                                        contextMenureflinelinks.open();
                                                    }
                                                }
                                            }
                                            Menu {
                                                id: contextMenureflinelinks
                                                MenuItem {
                                                    text: "Copy target"
                                                    onTriggered: {
                                                        copytextfieldlinks.text = target
                                                        copytextfieldlinks.selectAll()
                                                        copytextfieldlinks.copy()
                                                    }
                                                }
                                            }

                                        }

                                        ItemDelegate {
                                            property int column: 2
                                            width: amountwidth
                                            id: recipientpay
                                            text: ""
                                            clip: true
                                            Label {
                                                text: amount
                                                anchors.leftMargin: 20
                                                anchors.rightMargin: 8
                                                anchors.left: parent.left
                                                anchors.right: parent.right
                                                anchors.verticalCenter: parent.verticalCenter
                                                horizontalAlignment: Text.AlignRight
                                                font.pixelSize: 14
                                                font.weight: Font.DemiBold
                                                font.family: "Montserrat SemiBold"
                                                color: "#202124"
                                            }
                                            ToolTip.delay: 1000
                                            ToolTip.timeout: 5000
                                            ToolTip.visible: hovered
                                            ToolTip.text: amount
                                            MouseArea {
                                                anchors.fill: parent
                                                acceptedButtons: Qt.RightButton
                                                hoverEnabled: true
                                                onClicked: {
                                                    contextMenulinks.x = mouse.x;
                                                    contextMenulinks.y = mouse.y;
                                                    contextMenulinks.open();
                                                }
                                                onPressAndHold: {
                                                    if (mouse.source === Qt.MouseEventNotSynthesized) {
                                                        contextMenulinks.x = mouse.x;
                                                        contextMenulinks.y = mouse.y;
                                                        contextMenulinks.open();
                                                    }
                                                }
                                            }
                                            Menu {
                                                id: contextMenulinks
                                                MenuItem {
                                                    text: "Copy amount"
                                                    onTriggered: {
                                                        copytextfieldlinks.text = amount
                                                        copytextfieldlinks.selectAll()
                                                        copytextfieldlinks.copy()
                                                    }
                                                }
                                            }
                                        }

                                        ItemDelegate {
                                            property int column: 3
                                            width: senddollarwidth
                                            text: ""
                                            Label {
                                                text: senddollar
                                                anchors.leftMargin: 8
                                                anchors.rightMargin: 20
                                                anchors.left: parent.left
                                                anchors.right: parent.right
                                                anchors.verticalCenter: parent.verticalCenter
                                                horizontalAlignment: Text.AlignLeft

                                                font.family: "Montserrat"
                                                font.bold: true
                                                font.pixelSize: 14
                                                color: "#202124"
                                            }
                                            clip: true
                                            ToolTip.delay: 1000
                                            ToolTip.timeout: 5000
                                            ToolTip.visible: hovered
                                            ToolTip.text: senddollar
                                            MouseArea {
                                                anchors.fill: parent
                                                acceptedButtons: Qt.RightButton
                                                hoverEnabled: true
                                                onClicked: {
                                                    contextMenuamountan.x = mouse.x;
                                                    contextMenuamountan.y = mouse.y;
                                                    contextMenuamountan.open();
                                                }
                                                onPressAndHold: {
                                                    if (mouse.source === Qt.MouseEventNotSynthesized) {
                                                        contextMenuamountan.x = mouse.x;
                                                        contextMenuamountan.y = mouse.y;
                                                        contextMenuamountan.open();
                                                    }
                                                }
                                            }
                                            Menu {
                                                id: contextMenuamountan
                                                MenuItem {
                                                    text: "Copy currency"
                                                    onTriggered: {
                                                        copytextfieldlinks.text = senddollar
                                                        copytextfieldlinks.selectAll()
                                                        copytextfieldlinks.copy()
                                                    }
                                                }
                                            }
                                        }
                                        ItemDelegate {
                                            property int column: 4
                                            width: btnswidth
                                            text: ""
                                            ToolTip.text: "Cancel order"
                                            ToolTip.delay: 1000
                                            ToolTip.timeout: 5000
                                            ToolTip.visible: hovered
                                            Button {
                                                anchors.leftMargin: 20
                                                anchors.left: parent.left
                                                anchors.verticalCenter: parent.verticalCenter
                                                onClicked: {
                                                    displayInfobox()
                                                    deleteordersignalintern(idstr)
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
////////////////////////////////////////////////////// END: LIST of Orders ////////////////////////////////////////////////
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
                text: qsTr("Automatic trading")
                anchors.top: parent.top
                anchors.topMargin: 30
                font.pixelSize: 18
                font.family: "Montserrat SemiBold"
                font.weight: Font.DemiBold
            }

            TabBar {
                id: tabBar
                font.capitalization: Font.MixedCase
                font.family: "Montserrat SemiBold"
                currentIndex: swipeView.currentIndex
                width: parent.width
                height: 60
                position: TabBar.Header
                anchors.top: sendcap.bottom
                anchors.topMargin: 15
                font.weight: Font.DemiBold
                font.pixelSize: 14


                TabButton {
                    id: tabButton1
                    y: 0
                    text: qsTr("Create order")
                    rightPadding: 15
                    leftPadding: 30
                    width: implicitWidth
                    height: 60
                    contentItem: Text {
                        id: textoverview
                        x: 58
                        text: parent.text
                        font: parent.font
                        opacity: enabled ? 1.0 : 0.3
                        color: "#4d505e"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                    onCheckedChanged: {
                        if (checked) {
                            textoverview.color="#202124"

                        }else {
                            textoverview.color="#4d505e"
                        }
                    }

                }

                TabButton {
                    id: tabButton
                    text: qsTr("List of orders")
                    rightPadding: 15
                    font.capitalization: Font.MixedCase
                    leftPadding: 15
                    width: implicitWidth
                    height: 60

                    contentItem: Text {
                        id: textmining
                        text: parent.text
                        font: parent.font
                        opacity: enabled ? 1.0 : 0.3
                        color: "#4d505e"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                    onCheckedChanged: {
                        if (checked) {
                            textmining.color="#202124"
                        }else {
                            textmining.color="#4d505e"
                        }
                    }

                }

            }
////////////// END: Main content ///////////////


        }//End: window

    }//flickable

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
            id: infobox
            visible: false
            anchors.right:parent.right
            anchors.top:parent.top
            anchors.rightMargin: 20
            anchors.topMargin: 20
            height: 44
            width: 300
            radius: 3
            border.width: 0
            color: "#4d505e"
            Label{
                text: qsTr("Removed order.")
                font.weight: Font.DemiBold
                font.pixelSize: 14
                font.family: "Montserrat SemiBold"
                color: "#ffffff"
                anchors.left:parent.left
                anchors.leftMargin: 20
                anchors.verticalCenter: parent.verticalCenter
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
                background: {
                    x:0
                    y:0
                    fillMode: Image.PreserveAspectFit
                    source: "../res/icons/closebtngrey.png"
                }
            }
        }
}
