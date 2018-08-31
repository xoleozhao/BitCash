import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.3

Item {
    id: overviewForm
    width: 1280
    height: 800

    onWidthChanged: {
       if (overviewForm.width<1200){
           if (1200-overviewForm.width>220){
               if (1200-overviewForm.width>350){
                   image.width=0
                   image.anchors.rightMargin=0
                   image.visible=false
               }else {
                   image.width=200;
                   image.anchors.rightMargin=30
                   image.visible=true
               }
           }else {
               image.width=420-(1200-overviewForm.width);
               image.visible=true
               image.anchors.rightMargin=30
           }
       } else {
           image.width=420
           image.visible=true
           image.anchors.rightMargin=30
       }
    }

    signal startMiningSignalInternoverview()
    signal startBackupSignalInternoverview()

    function setbalancesintern(avail, pending, immature, total) {
        availLabel.text=avail
        pendingLabel.text=pending
        immatureLabel.text=immature
        totalLabel.text=total
    }

    function geticonname(nr)
    {
        if (nr===1) return "../res/assets/Type of Transaction/history-type-sent.png";else
        if (nr===2) return "../res/assets/Type of Transaction/history-type-mined.png";else
        return "../res/assets/Type of Transaction/history-type-received.png";
    } 

    ShadowBox {
        id: balancerect
        y: 25
        radius: 1
        border.width: 0
        clip: true
        height: 284
        color: "white"
        anchors.left: parent.left
        anchors.leftMargin: 24
        anchors.right: image.left
        anchors.rightMargin: 24

        Label {
            id: label1
            text: qsTr("Available")
            font.weight: Font.Normal
            font.pixelSize: 13
            font.family: "Montserrat"
            anchors.left: label2.left
            anchors.leftMargin: 0
            anchors.top: availLabel.top
            anchors.topMargin: 0
            color: "#202124"
        }

        Label {
            id: label2
            y: 104
            text: qsTr("Pending")
            font.weight: Font.Normal
            font.pixelSize: 13
            font.family: "Montserrat"
            anchors.right: parent.right
            anchors.rightMargin: 250
            anchors.verticalCenter: parent.verticalCenter
            color: "#202124"

            property string toolTipText: qsTr("You have received Bitcash but it has<br> not yet been confirmed by the Bitcash<br> blockchain network. Once it has been<br> confirmed, it will become available for<br> you to spend. This usually takes a few<br> minutes but can take up to one hour.")
            ToolTip.text: toolTipText
            ToolTip.visible: toolTipText ? ma.containsMouse : false
            ToolTip.delay: 100
            ToolTip.timeout: 5000
            MouseArea {
                id: ma
                anchors.fill: parent
                hoverEnabled: true
            }
        }
        Image {
            id: pendinginfo
            width: 16
            height: 16
            anchors.verticalCenter: label2.verticalCenter
            fillMode: Image.PreserveAspectFit
            anchors.left: label2.right
            anchors.leftMargin: 5
            source: "../res/assets/Navigation/help-inactive.png"

            property string toolTipText: qsTr("You have received Bitcash but it has<br> not yet been confirmed by the Bitcash<br> blockchain network. Once it has been<br> confirmed, it will become available for<br> you to spend. This usually takes a few<br> minutes but can take up to one hour.")
            ToolTip.text: toolTipText
            ToolTip.visible: toolTipText ? ma2.containsMouse : false
            ToolTip.delay: 100
            ToolTip.timeout: 5000
            MouseArea {
                id: ma2
                anchors.fill: parent
                hoverEnabled: true
            }
        }

        Label {
            id: availLabel
            x: 285
            y: 33
            text: qsTr("32.950000000")
            font.pixelSize: 14
            font.family: "Montserrat SemiBold"
            font.weight: Font.DemiBold
            leftPadding: 0
            anchors.bottom: pendingLabel.top
            anchors.bottomMargin: 46
            anchors.right: parent.right
            anchors.rightMargin: 36
            color: "#202124"
        }

        Label {
            id: availbitcashicon
            anchors.right: availLabel.left
            anchors.verticalCenter: availLabel.verticalCenter
            font.pixelSize: 14
            font.family: "Montserrat SemiBold"
            font.weight: Font.DemiBold
            color: "#202124"
            text: "₡"
        }

        Label {
            id: pendingLabel
            x: 282
            y: 104
            text: qsTr("8764332,956544566")
            font.pixelSize: 14
            font.family: "Montserrat SemiBold"
            font.weight: Font.DemiBold
            leftPadding: 0
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignRight            
            anchors.right: parent.right
            anchors.rightMargin: 36
            color: "#202124"
            Label {
                id: pendingbitcashicon
                anchors.right: pendingLabel.left
                anchors.verticalCenter: pendingLabel.verticalCenter

                font.pixelSize: 14
                font.family: "Montserrat SemiBold"
                font.weight: Font.DemiBold
                color: "#202124"
                text: "₡"
            }
        }

        Rectangle {
            id: totalbalancerect
            onWidthChanged: {
               totalLabel.font.pixelSize=42
               totalLabel.font.letterSpacing=0;
               totalbitcashicon.font.pixelSize=totalLabel.font.pixelSize

               while (totalLabel.width+totalbitcashicon.width+30+30>totalbalancerect.width && totalLabel.font.pixelSize>13)
               {
                  totalLabel.font.pixelSize--;
                  totalbitcashicon.font.pixelSize=totalLabel.font.pixelSize
               }
               while (totalLabel.width+totalbitcashicon.width+30+30>totalbalancerect.width && totalLabel.font.letterSpacing>-1)
               {
                  totalLabel.font.letterSpacing-=0.05;
               }

            }
            y: 25
            radius: 4
            clip: true
            height: 189
            color: "#00000000"
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            anchors.left: parent.left
            anchors.right: label2.left
            anchors.rightMargin: 10

            Label {
                id: label3
                text: qsTr("Total balance")
                anchors.top: parent.top
                anchors.topMargin: 36
                font.pixelSize: 18
                font.family: "Montserrat SemiBold"
                font.weight: Font.DemiBold
                anchors.left: parent.left
                anchors.leftMargin: 36
                color: "#212225"
            }

        Label {
            id: totalLabel
            text: qsTr("3345154,000000000")            
            font.pixelSize: 42
            font.family: "Montserrat Light"
            font.weight: Font.Light
            leftPadding: 0
            anchors.left: totalbitcashicon.right
            anchors.leftMargin: 0
            anchors.top: label3.bottom
            anchors.topMargin: 10
            color: "#3e45ac"
        }
        Label {
            id: totalbitcashicon
            anchors.left: parent.left
            anchors.leftMargin: 36
            anchors.verticalCenter: totalLabel.verticalCenter

            font.pixelSize: 42
            font.family: "Montserrat Light"
            font.weight: Font.Light
            color: "#3e45ac"
            text: "₡"
        }

        }

        Label {
            id: immaturecaption
            text: qsTr("Immature")
            font.weight: Font.Normal
            font.pixelSize: 13
            font.family: "Montserrat"
            anchors.top: immatureLabel.top
            anchors.topMargin: 0
            anchors.left: label2.left
            anchors.leftMargin: 0
            color: "#202124"
            property string toolTipText: qsTr("You have received Bitcash from mining,<br> but it has not yet been confirmed by<br> the Bitcash blockchain network. Once it<br> has been confirmed, it will become<br> available for you to spend. This usually<br> takes a few minutes but can take up to<br> one hour.")
            ToolTip.text: toolTipText
            ToolTip.visible: toolTipText ? ma3.containsMouse : false
            ToolTip.delay: 100
            ToolTip.timeout: 5000
            MouseArea {
                id: ma3
                anchors.fill: parent
                hoverEnabled: true
            }
        }
        Image {
            id: immatureinfo
            width: 16
            height: 16
            anchors.verticalCenter: immaturecaption.verticalCenter
            fillMode: Image.PreserveAspectFit
            anchors.left: immaturecaption.right
            anchors.leftMargin: 5
            source: "../res/assets/Navigation/help-inactive.png"
            property string toolTipText: qsTr("You have received Bitcash from mining,<br> but it has not yet been confirmed by<br> the Bitcash blockchain network. Once it<br> has been confirmed, it will become<br> available for you to spend. This usually<br> takes a few minutes but can take up to<br> one hour.")
            ToolTip.text: toolTipText
            ToolTip.visible: toolTipText ? ma4.containsMouse : false
            ToolTip.delay: 100
            ToolTip.timeout: 5000
            MouseArea {
                id: ma4
                anchors.fill: parent
                hoverEnabled: true
            }
        }
        Label {
            id: immaturebitcashicon
            anchors.right: immatureLabel.left
            anchors.verticalCenter: immatureLabel.verticalCenter

            font.pixelSize: 14
            font.family: "Montserrat SemiBold"
            font.weight: Font.DemiBold
            color: "#202124"
            text: "₡"
        }


        Label {
            id: immatureLabel
            x: 282
            text: qsTr("2,453000")
            font.pixelSize: 14
            font.weight: Font.DemiBold
            font.family: "Montserrat SemiBold"
            leftPadding: 0
            anchors.top: pendingLabel.bottom
            anchors.topMargin: 46
            horizontalAlignment: Text.AlignRight            
            anchors.right: parent.right
            anchors.rightMargin: 36
            color: "#202124"
        }

        Rectangle {
            id: rectangle1
            height: 1
            radius: 10
            anchors.top: pendingLabel.bottom
            anchors.topMargin: 20
            color: "#eaeaea"
            anchors.right: immatureLabel.right
            anchors.rightMargin: 0
            anchors.left: label2.left
            anchors.leftMargin: 0
        }

        Rectangle {
            id: rectangle2
            height: 1
            radius: 10
            anchors.bottom: pendingLabel.top
            anchors.bottomMargin: 20
            color: "#eaeaea"
            anchors.right: immatureLabel.right
            anchors.rightMargin: 0
            anchors.left: label2.left
            anchors.leftMargin: 0
        }
    }

    property int  datewidth : 150
    property int  typewidth : 150
    property int  amountwidth : 220
    Label{
        id: lasttranslabel
        anchors.top: balancerect.bottom
        anchors.topMargin: 40
        width: 223
        height: 19
        color: "#202124"
        text: "Last transactions"
        font.pixelSize: 18
        font.family: "Montserrat SemiBold"
        anchors.left: parent.left
        anchors.leftMargin: 30
        font.weight: Font.DemiBold        
    }

    Row {
        id: header
        height: 44
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 30
        anchors.rightMargin: 30
        anchors.top: lasttranslabel.bottom
        anchors.topMargin: 28
        clip: true
        spacing: 0

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
                            anchors.verticalCenterOffset: 0
                            rightPadding: 20
                            leftPadding: 20
                            anchors.verticalCenter: parent.verticalCenter
                            font.weight: Font.DemiBold
                            font.family: "Montserrat SemiBold"
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
                            rightPadding: 20
                            leftPadding: 20
                            anchors.verticalCenter: parent.verticalCenter
                            font.weight: Font.DemiBold
                            font.family: "Montserrat SemiBold"
                            font.pixelSize: 13
                            color:"#202124"
                            padding: 10
                            background: Rectangle { color: "#ebebeb" }
                        }
                        Label {
                            width: overviewForm.width-datewidth-typewidth-amountwidth-30-30
                            height: 44
                            text: "Address"
                            verticalAlignment: Text.AlignVCenter
                            rightPadding: 20
                            leftPadding: 20
                            anchors.verticalCenter: parent.verticalCenter
                            font.weight: Font.DemiBold
                            font.family: "Montserrat SemiBold"
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
                            bottomPadding: 10
                            rightPadding: 20
                            leftPadding: 20
                            anchors.verticalCenter: parent.verticalCenter
                            font.weight: Font.DemiBold
                            font.family: "Montserrat SemiBold"
                            horizontalAlignment: Text.AlignRight                            
                            font.pixelSize: 13
                            color:"#202124"
                            padding: 10
                            background: Rectangle { color: "#ebebeb" }
                        }

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
        flickableDirection: Flickable.VerticalFlick

            contentWidth: header.width

            model: overviewtransactions
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
                        }
                        ItemDelegate {
                            property int column: 2
                            width: overviewForm.width-datewidth-typewidth-amountwidth-30-30
                            text: ""
                            clip: true
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
                        }
                        ItemDelegate {
                            property int column: 3
                            width: amountwidth
                            text: ""
                            clip: true
                            Label {
                                text: transactionamount
                                anchors.leftMargin: 8
                                anchors.rightMargin: 20                                
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter
                                horizontalAlignment: Text.AlignRight
                                font.family: "Montserrat SemiBold"
                                font.weight: Font.DemiBold
                                font.pixelSize: 14
                                color: "#202124"
                            }
                        }
                }
                Rectangle {
                    width: parent.width
                    height: 1
                    color: "#ebebeb"
                }
            }

            ScrollIndicator.horizontal: ScrollIndicator { }
            ScrollIndicator.vertical: ScrollIndicator { }
    }


    Rectangle{
        id: image
        x: 354
        y: 31
        width: 420
        height: 122
        anchors.right: parent.right
        anchors.rightMargin: 30
        radius: 3
        border.width: 0
        color: "#3e45ac"

        Image {            
            fillMode: Image.PreserveAspectFit
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            source: "../res/assets/illustration-overview-copy-2.png"
         }
            Label {
                id: label
                y: 24
                text: qsTr("Start mining")
                font.weight: Font.DemiBold
                color: "white"                
                font.pixelSize: 18
                font.family: "Montserrat SemiBold"
                anchors.top: parent.top
                anchors.topMargin: 30
                anchors.left: parent.left
                anchors.leftMargin: 30
            }

            Text {
                id: label4
                x: -4
                y: 5
                height: 54
                text: qsTr("Use your computer to mine and earn BitCash now.")
                wrapMode: Text.WordWrap
                anchors.right: startminingbutton.left
                anchors.rightMargin: 20
                color: "white"
                anchors.topMargin: 5
                font.pixelSize: 13
                font.family: "Montserrat"
                anchors.left: parent.left
                anchors.top: label.bottom
                anchors.leftMargin: 30
            }

            Mybutton {
                id: startminingbutton
                x: 244
                y: 208
                width: 156
                height: 44
                text: qsTr("Start mining")
                font.bold: false
                anchors.verticalCenter: parent.verticalCenter
                font.weight: Font.DemiBold
                font.pixelSize: 14
                rightPadding: 20
                leftPadding: 40
                font.family: "Montserrat SemiBold"
                font.capitalization: Font.MixedCase
                btncolor: "white"
                txtcolor: "#3e45ac"
                btncolordown: "#eaeaea"
                txtcolordown: "#494ea7"
                anchors.right: parent.right
                anchors.rightMargin: 20                
                iconname: "../res/assets/Miscellaneous/button-start-2.png"
                onClicked: startMiningSignalInternoverview()
            }

    }

    ShadowBox{
        id: backup
        x: 354
        y: 31
        width: 432
        height: 134
        anchors.right: parent.right
        anchors.rightMargin: 24
        radius: 3
        anchors.bottom: balancerect.bottom
        anchors.bottomMargin: 0
        border.width: 0

        Image {
            anchors.leftMargin: 14
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            source: "../res/assets/backup-icon-copy.png"
         }
            Label {
                id: label11
                text: qsTr("Backup wallet")
                font.weight: Font.DemiBold
                color: "#202124"
                font.pixelSize: 18
                font.family: "Montserrat SemiBold"
                anchors.top: parent.top
                anchors.topMargin: 30
                anchors.left: parent.left
                anchors.leftMargin: 30
            }

            Text {
                id: label42
                x: -4
                y: 5
                height: 54
                text: qsTr("Save a backup of your wallet as a precaution now.")
                wrapMode: Text.WordWrap
                anchors.right: backupbutton.left
                anchors.rightMargin: 20
                color: "#4f515a"
                anchors.topMargin: 5
                font.pixelSize: 13
                font.family: "Montserrat"
                anchors.left: parent.left
                anchors.top: label11.bottom
                anchors.leftMargin: 30
            }

            Mybutton {
                id: backupbutton
                x: 244
                y: 208
                width: 154
                height: 44
                text: qsTr("Backup wallet")
                font.bold: false
                anchors.verticalCenter: parent.verticalCenter
                font.weight: Font.DemiBold
                font.pixelSize: 14
                rightPadding: 20
                leftPadding: 20
                font.family: "Montserrat SemiBold"
                font.capitalization: Font.MixedCase
                anchors.right: parent.right
                anchors.rightMargin: 20
                onClicked: startBackupSignalInternoverview()
            }

    }

    property alias progressBar: progressBar
    property alias percentlabel: percentlabel
    property alias progressinfolabel: progressinfolabel
    property alias progressinfolabel2: progressinfolabel2

    Rectangle {
        id: statusbar
        y: 720
        height: 44
        color: "#ffffff"
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0

        ProgressBar {
            id: progressBar
            x: 854
            y: 20

            width: 300
            anchors.right: percentlabel.left
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            value: 0.5
            visible: false
        }

        Label {
            id: percentlabel
            x: 1176
            y: 14
            color: "#3e45ac"
            text: qsTr("Label")
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 13
            font.family: "Montserrat"
            visible: false
        }

        Label {
            id: progressinfolabel
            y: 18
            color: "#4d505e"
            text: qsTr("Label")
            anchors.left: parent.left
            anchors.leftMargin: 20
            font.pixelSize: 13
            font.family: "Montserrat"
            anchors.verticalCenter: parent.verticalCenter
            visible: false
        }
        Label {
            id: progressinfolabel2
            y: 18
            color: "#4d505e"
            text: qsTr("Label")
            anchors.left: progressinfolabel.right
            anchors.leftMargin: 20
            font.pixelSize: 13
            font.family: "Montserrat"
            anchors.verticalCenter: parent.verticalCenter
            visible: false
        }

    }


}
