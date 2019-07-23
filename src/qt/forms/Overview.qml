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
           if (1200-overviewForm.width>70){
               if (1200-overviewForm.width>350){
                   image.width=0
                   image.anchors.rightMargin=0
                   image.visible=false
                   backup.width=0
                   backup.anchors.rightMargin=0
                   backup.visible=false
                   label4.visible=false
                   label42.visible=false
                   label11.visible=false
                   label.visible=false
                   backupimage.visible=false
                   trading.width = 0
                   trading.visible = false
                   trading.anchors.rightMargin = 0
                   label43.visible=false
                   label12.visible=false
               }else {
                   image.width=200;
                   image.anchors.rightMargin=30
                   image.visible=true
                   backup.width=image.width+12;
                   backup.anchors.rightMargin=24
                   backup.visible=true
                   label4.visible=false
                   label42.visible=false
                   label11.visible=false
                   label.visible=false
                   backupimage.visible=false
                   trading.width = backup.width
                   trading.visible = true
                   trading.anchors.rightMargin = 24
                   label43.visible=false
                   label12.visible=false
               }
           }else {
               image.width=420-(1200-overviewForm.width);
               image.visible=true
               image.anchors.rightMargin=30
               backup.width=image.width+12;
               backup.visible=true
               backup.anchors.rightMargin=24
               label4.visible=true
               label42.visible=true
               label11.visible=true
               label.visible=true
               backupimage.visible=true
               trading.width = backup.width
               trading.visible = true
               trading.anchors.rightMargin = 24
               label43.visible=true
               label12.visible=true
           }
       } else {
           image.width = 420
           image.visible = true
           image.anchors.rightMargin = 30
           backup.width = image.width+12
           backup.visible = true
           backup.anchors.rightMargin = 24
           label4.visible = true
           label42.visible = true
           label11.visible = true
           label.visible = true
           backupimage.visible = true
           trading.width = backup.width
           trading.visible = true
           trading.anchors.rightMargin = 24
           label43.visible = true
           label12.visible = true
       }
    }

    signal sendtobitcashsignalintern()
    signal sendtodollarsignalintern()
    signal startMiningSignalInternoverview()
    signal startBackupSignalInternoverview()
    signal startTradingSignalInternoverview()

    function setbalancesintern(avail, pending, immature, total) {
        availLabel.text = avail
        pendingLabel.text = pending
        immatureLabel.text = immature
        totalLabel.text = total
    }

    function setbalancesinternDo(avail, pending, immature, total) {
        availLabelDo.text = avail
        pendingLabelDo.text = pending
        immatureLabelDo.text = immature
        totalLabelDo.text = total
    }

    function setpriceDointern(price, price2) {
        priceLabelDo.text = price
        price2LabelDo.text = price2
    }

    function setwalletvalueintern(value)
    {
        valueLabel.text= value
    }

    function geticonname(nr)
    {
        if (nr===1) return "../res/assets/Type of Transaction/history-type-sent.png";else
        if (nr===2) return "../res/assets/Type of Transaction/history-type-mined.png";else
        return "../res/assets/Type of Transaction/history-type-received.png";
    } 

    function setsupplyintern(bitcash, dollar, blockheight) {
        supplyLabel.text = bitcash
        supplyusdLabel.text = dollar
        blockheightLabel.text = blockheight;
    }

    ShadowBox {
        id: balancerect
        y: 25
        radius: 1
        border.width: 0
        clip: true
        height: 410
        color: "white"
        anchors.left: parent.left
        anchors.leftMargin: 24
        anchors.right: image.left
        anchors.rightMargin: 24

        Mybutton {
            id: converttodollarbtn
            width: 76
            height: 44
            anchors.right: converttobitcashbtn.left
            anchors.rightMargin: 20
            font.bold: false
            font.weight: Font.DemiBold
            font.pixelSize: 14
            imagestartleft: 15
            rightPadding: 20
            leftPadding: 20
            font.family: "Montserrat SemiBold"
            font.capitalization: Font.MixedCase
            anchors.top: immatureLabelDo.bottom
            anchors.topMargin: 25
            iconname: "../res/assets/Miscellaneous/converttodollar.png"
            onClicked: sendtodollarsignalintern()
        }

        Mybutton {
            id: converttobitcashbtn
            width: 76
            height: 44
            anchors.right: immatureLabelDo.right
            anchors.rightMargin: 0
            font.bold: false
            font.weight: Font.DemiBold
            font.pixelSize: 14
            imagestartleft: 15
            rightPadding: 20
            leftPadding: 20
            font.family: "Montserrat SemiBold"
            font.capitalization: Font.MixedCase
            anchors.top: immatureLabelDo.bottom
            anchors.topMargin: 25
            iconname: "../res/assets/Miscellaneous/converttobitcash.png"
            onClicked: sendtobitcashsignalintern()
        }

        Image {
            id: convertinfo
            width: 16
            height: 16
            anchors.verticalCenter: convertcaption.verticalCenter
            fillMode: Image.PreserveAspectFit
            anchors.left: convertcaption.right
            anchors.leftMargin: 5
            source: "../res/assets/Navigation/help-inactive.png"
            property string toolTipText: qsTr("You can convert BitCash into BitCash Dollars (c->d) and BitCash Dollars into BitCash (d->c) with these two buttons.")
            ToolTip.text: toolTipText
            ToolTip.visible: toolTipText ? ma6.containsMouse : false
            ToolTip.delay: 100
            ToolTip.timeout: 5000
            MouseArea {
                id: ma6
                anchors.fill: parent
                hoverEnabled: true
            }
        }

        Rectangle {
            id: rectangle4
            height: 1
            radius: 10
            anchors.top: immatureLabelDo.bottom
            anchors.topMargin: 10
            color: "#eaeaea"
            anchors.right: immatureLabel.right
            anchors.rightMargin: 0
            anchors.left: label2.left
            anchors.leftMargin: 0
        }

        Label {
            id: convertcaption
            text: qsTr("Convert")
            font.weight: Font.Normal
            font.pixelSize: 13
            font.family: "Montserrat"
            anchors.top: immatureLabelDo.bottom
            anchors.topMargin: 25
            anchors.left: label2.left
            anchors.leftMargin: 0
            color: "#202124"
            property string toolTipText: qsTr("You can convert BitCash into BitCash Dollars (c->d) and BitCash Dollars into BitCash (d->c) with these two buttons.")
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

        Rectangle {
        id: rectangle5
        height: 1
        color: "#eaeaea"
        radius: 10
        anchors.bottomMargin: 10
        anchors.right: immatureLabel.right
        anchors.bottom: label1.top
        anchors.left: label2.left
        anchors.topMargin: 10
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        }

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
            id: labelvalue1
            text: qsTr("Value of wallet")
            font.weight: Font.Normal
            font.pixelSize: 13
            font.family: "Montserrat"
            anchors.left: label2.left
            anchors.leftMargin: 0
            anchors.top: valueLabel.top
            anchors.topMargin: 0
            color: "#202124"
        }

        Label {
            id: labelsupply1
            text: qsTr("BitCash supply")
            font.pixelSize: 12
            font.family: "Montserrat Light"
            font.weight: Font.Light
            anchors.left: label2.left
            anchors.leftMargin: 0
            anchors.top: labelvalue1.bottom
            anchors.topMargin: 0
            color: "#202124"
        }

        Label {
            id: labelsupply2
            text: qsTr("Dollar supply")
            font.pixelSize: 12
            font.family: "Montserrat Light"
            font.weight: Font.Light
            anchors.left: label2.left
            anchors.leftMargin: 0
            anchors.top: labelsupply1.bottom
            anchors.topMargin: 0
            color: "#202124"
        }

        Label {
            id: labelblockheight
            text: qsTr("Blockheight")
            font.pixelSize: 12
            font.family: "Montserrat Light"
            font.weight: Font.Light
            anchors.left: label2.left
            anchors.leftMargin: 0
            anchors.top: labelsupply2.bottom
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
            id: valueicon
            anchors.right: valueLabel.left
            anchors.verticalCenter: valueLabel.verticalCenter
            font.pixelSize: 14
            font.family: "Montserrat SemiBold"
            font.weight: Font.DemiBold
            color: "#202124"
            text: qsTr("$")
        }

        Label {
            id: valueLabel
            x: 285
            y: 33
            text: qsTr("32.950000000")
            font.pixelSize: 14
            font.family: "Montserrat SemiBold"
            font.weight: Font.DemiBold
            leftPadding: 0
            anchors.bottom: availLabel.top
            anchors.bottomMargin: 65
            anchors.right: parent.right
            anchors.rightMargin: 36
            color: "#202124"
        }

        Label {
            id: supplyicon
            anchors.right: supplyLabel.left
            anchors.verticalCenter: supplyLabel.verticalCenter
            font.pixelSize: 12
            font.family: "Montserrat Light"
            font.weight: Font.Light
            color: "#202124"
            text: qsTr("₡")
        }

        Label {
            id: supplyLabel
            x: 285
            y: 33
            text: qsTr("-")
            font.pixelSize: 12
            font.family: "Montserrat Light"
            font.weight: Font.Light
            leftPadding: 0
            anchors.top: labelsupply1.top
            anchors.right: parent.right
            anchors.rightMargin: 36
            color: "#202124"
        }

        Label {
            id: supplyusdicon
            anchors.right: supplyusdLabel.left
            anchors.verticalCenter: supplyusdLabel.verticalCenter
            font.pixelSize: 12
            font.family: "Montserrat Light"
            font.weight: Font.Light
            color: "#202124"
            text: qsTr("$")
        }

        Label {
            id: supplyusdLabel
            x: 285
            y: 33
            text: qsTr("-")
            font.pixelSize: 12
            font.family: "Montserrat Light"
            font.weight: Font.Light
            leftPadding: 0
            anchors.top: labelsupply2.top
            anchors.right: parent.right
            anchors.rightMargin: 36
            color: "#202124"
        }

        Label {
            id: blockheightLabel
            x: 285
            y: 33
            text: qsTr("-")
            font.pixelSize: 12
            font.family: "Montserrat Light"
            font.weight: Font.Light
            leftPadding: 0
            anchors.top: labelblockheight.top
            anchors.right: parent.right
            anchors.rightMargin: 36
            color: "#202124"
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
            anchors.bottomMargin: 45
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
            text: qsTr("₡")
        }

        Label {
            id: availLabelDo
            x: 285
            y: 33
            text: qsTr("32.950000000")
            font.pixelSize: 14
            font.family: "Montserrat SemiBold"
            font.weight: Font.DemiBold
            leftPadding: 0
            anchors.top: availLabel.bottom
            anchors.topMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 36
            color: "#202124"
        }

        Label {
            id: availbitcashiconDo
            anchors.right: availLabelDo.left
            anchors.verticalCenter: availLabelDo.verticalCenter
            font.pixelSize: 14
            font.family: "Montserrat SemiBold"
            font.weight: Font.DemiBold
            color: "#202124"
            text: qsTr("$")
        }

        Label {
            id: pendingLabel
            x: 282
            y: 104
            text: qsTr("8764332,956544566")
            anchors.verticalCenterOffset: -1
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
                text: qsTr("₡")
            }
        }

        Label {
            id: pendingLabelDo
            x: 282
            text: qsTr("8764332,956544566")
            font.pixelSize: 14
            font.family: "Montserrat SemiBold"
            font.weight: Font.DemiBold
            leftPadding: 0
            anchors.top: pendingLabel.bottom
            anchors.topMargin: 5
            horizontalAlignment: Text.AlignRight
            anchors.right: parent.right
            anchors.rightMargin: 36
            color: "#202124"
            Label {
                id: pendingbitcashiconDo
                anchors.right: pendingLabelDo.left
                anchors.verticalCenter: pendingLabelDo.verticalCenter

                font.pixelSize: 14
                font.family: "Montserrat SemiBold"
                font.weight: Font.DemiBold
                color: "#202124"
                text: qsTr("$")
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

               totalLabelDo.font.pixelSize = totalLabel.font.pixelSize
               totalLabelDo.font.letterSpacing = totalLabel.font.letterSpacing
               totalLabelDo.font.letterSpacing = totalLabel.font.letterSpacing
               totalbitcashiconDo.font.pixelSize = totalbitcashicon.font.pixelSize

               priceLabelDo.font.pixelSize = totalLabel.font.pixelSize * 2/3
               priceLabelDo.font.letterSpacing = totalLabel.font.letterSpacing * 2/3
               priceLabelDo.font.letterSpacing = totalLabel.font.letterSpacing * 2/3
               price2LabelDo.font.pixelSize = totalLabel.font.pixelSize * 2/3
               price2LabelDo.font.letterSpacing = totalLabel.font.letterSpacing * 2/3
               price2LabelDo.font.letterSpacing = totalLabel.font.letterSpacing * 2/3
               pricebitcashiconDo.font.pixelSize = totalbitcashicon.font.pixelSize * 2/3
               price2bitcashiconDo.font.pixelSize = totalbitcashicon.font.pixelSize * 2/3
            }
            y: 25
            radius: 1
            anchors.bottomMargin: 8
            clip: true
            height: 200
            color: "#00000000"
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            anchors.left: parent.left
            anchors.right: label2.left
            anchors.rightMargin: 10

            Label {
                id: label3
                text: qsTr("Total BitCash balance")
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
            text: qsTr("₡")
        }

        Label {
            id: label3Do
            text: qsTr("Total Dollar balance")
            anchors.top: totalLabel.bottom
            anchors.topMargin: 20
            font.pixelSize: 18
            font.family: "Montserrat SemiBold"
            font.weight: Font.DemiBold
            anchors.left: parent.left
            anchors.leftMargin: 36
            color: "#212225"
        }

        Label {
            id: totalLabelDo
            text: qsTr("3345154,000000000")
            font.pixelSize: 42
            font.family: "Montserrat Light"
            font.weight: Font.Light
            leftPadding: 0
            anchors.left: totalbitcashiconDo.right
            anchors.leftMargin: 0
            anchors.top: label3Do.bottom
            anchors.topMargin: 10
            color: "#3e45ac"
        }
        Label {
            id: totalbitcashiconDo
            anchors.left: parent.left
            anchors.leftMargin: 36
            anchors.verticalCenter: totalLabelDo.verticalCenter

            font.pixelSize: 42
            font.family: "Montserrat Light"
            font.weight: Font.Light
            color: "#3e45ac"
            text: qsTr("$")
        }

        Label {
            id: pricecaption
            text: qsTr("Price of one BitCash in USD")
            anchors.top: totalbitcashiconDo.bottom
            anchors.topMargin: 20
            font.pixelSize: 18
            font.family: "Montserrat SemiBold"
            font.weight: Font.DemiBold
            anchors.left: parent.left
            anchors.leftMargin: 36
            color: "#212225"
        }

        Label {
            id: priceLabelDo
            text: qsTr("-")
            font.pixelSize: 30
            font.family: "Montserrat Light"
            font.weight: Font.Light
            leftPadding: 0
            anchors.left: pricebitcashiconDo.right
            anchors.leftMargin: 0
            anchors.top: pricecaption.bottom
            anchors.topMargin: 10
            color: "#3e45ac"
        }
        Label {
            id: price2LabelDo
            text: qsTr("-")
            font.pixelSize: 30
            font.family: "Montserrat Light"
            font.weight: Font.Light
            leftPadding: 0
            anchors.left: price2bitcashiconDo.right
            anchors.leftMargin: 0
            anchors.top: priceLabelDo.bottom
            anchors.topMargin: 10
            color: "#3e45ac"
        }
        Label {
            id: pricebitcashiconDo
            anchors.left: convertinfonextprice.right
            anchors.leftMargin: 10
            anchors.verticalCenter: priceLabelDo.verticalCenter

            font.pixelSize: 30
            font.family: "Montserrat Light"
            font.weight: Font.Light
            color: "#3e45ac"
            text: qsTr(": $")
        }

        Image {
            id: convertinfonextprice
            anchors.left: parent.left
            anchors.leftMargin: 36
            anchors.verticalCenter: priceLabelDo.verticalCenter
            fillMode: Image.PreserveAspectFit
            source: "../res/assets/Miscellaneous/converttobitcashblack.png"
            property string toolTipText: qsTr("Convert BitCash Dollars into BitCash (d->c).")
            ToolTip.text: toolTipText
            ToolTip.visible: toolTipText ? ma7.containsMouse : false
            ToolTip.delay: 100
            ToolTip.timeout: 5000
            MouseArea {
                id: ma7
                anchors.fill: parent
                hoverEnabled: true
                onClicked: sendtobitcashsignalintern()
            }
        }

        Label {
            id: price2bitcashiconDo
            anchors.left: convertinfonextprice2.right
            anchors.leftMargin: 10
            anchors.verticalCenter: price2LabelDo.verticalCenter

            font.pixelSize: 30
            font.family: "Montserrat Light"
            font.weight: Font.Light
            color: "#3e45ac"
            text: qsTr(": $")
        }

        Image {
            id: convertinfonextprice2
            anchors.left: parent.left
            anchors.leftMargin: 36
            anchors.verticalCenter: price2LabelDo.verticalCenter
            fillMode: Image.PreserveAspectFit
            source: "../res/assets/Miscellaneous/converttodollarblack.png"
            property string toolTipText: qsTr("Convert BitCash into BitCash Dollars (c->d).")
            ToolTip.text: toolTipText
            ToolTip.visible: toolTipText ? ma8.containsMouse : false
            ToolTip.delay: 100
            ToolTip.timeout: 5000
            MouseArea {
                id: ma8
                anchors.fill: parent
                hoverEnabled: true
                onClicked: sendtodollarsignalintern()
            }
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
            ToolTip.visible: toolTipText ? ma5.containsMouse : false
            ToolTip.delay: 100
            ToolTip.timeout: 5000
            MouseArea {
                id: ma5
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
            text: qsTr("₡")
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
            anchors.topMargin: 50
            horizontalAlignment: Text.AlignRight            
            anchors.right: parent.right
            anchors.rightMargin: 36
            color: "#202124"
        }

        Label {
            id: immaturebitcashiconDo
            anchors.right: immatureLabelDo.left
            anchors.verticalCenter: immatureLabelDo.verticalCenter

            font.pixelSize: 14
            font.family: "Montserrat SemiBold"
            font.weight: Font.DemiBold
            color: "#202124"
            text: qsTr("$")
        }


        Label {
            id: immatureLabelDo
            x: 282
            text: qsTr("2,453000")
            font.pixelSize: 14
            font.weight: Font.DemiBold
            font.family: "Montserrat SemiBold"
            leftPadding: 0
            anchors.top: immatureLabel.bottom
            anchors.topMargin: 5
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
            anchors.topMargin: 35
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
            anchors.bottomMargin: 15
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
    property int  amountusdwidth : 220
    Label{
        id: lasttranslabel
        anchors.top: balancerect.bottom
        anchors.topMargin: 40
        width: 223
        height: 19
        color: "#202124"
        text: qsTr("Last transactions")
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
                            text: qsTr("Date")
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
                            text: qsTr("Type")
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
                            width: overviewForm.width-datewidth-typewidth-amountwidth-amountusdwidth-30-30
                            height: 44
                            text: qsTr("Address")
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
                            text: qsTr("BITC")
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
                        Label {
                            width: amountusdwidth
                            height: 44
                            text: qsTr("USD")
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
                            width: overviewForm.width-datewidth-typewidth-amountwidth-amountusdwidth-30-30
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
                                text: transactionamountbitc
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
                        ItemDelegate {
                            property int column: 4
                            width: amountusdwidth
                            text: ""
                            clip: true
                            Label {
                                text: transactionamountusd
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
        height: 120
        anchors.right: parent.right
        anchors.rightMargin: 24
        radius: 1
        anchors.bottom: balancerect.bottom
        anchors.bottomMargin: 0
        border.width: 0

        Image {
            id: backupimage
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
    property alias fullysynced: fullysynced
    property alias fullysyncedimage: fullysyncedimage

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
            anchors.right: parent.right
            anchors.rightMargin: 100
            anchors.verticalCenter: parent.verticalCenter
            value: 0.5
            visible: false
        }

        Label {
            id: percentlabel
            x: 1176
            y: 14
            color: "#3e45ac"
            text: qsTr("")
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 13
            font.family: "Montserrat"
            visible: false
        }

        Label {
            id: fullysynced
            x: 1176
            y: 14
            color: "#1bb846"
            text: qsTr("Fully synced.")
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 13
            font.family: "Montserrat"
            visible: true
        }

        Image {
            id: fullysyncedimage
            fillMode: Image.PreserveAspectFit
            anchors.right: fullysynced.left
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            source: "../res/assets/Notification Alerts/success-icon.png"
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

    ShadowBox {
        id: trading
        x: 824
        width: 432
        radius: 3
        anchors.top: image.bottom
        anchors.topMargin: 10
        anchors.bottom: backup.top
        anchors.bottomMargin: 10

        Label {
            id: label12
            color: "#202124"
            text: qsTr("Automatic trading")
            anchors.topMargin: 20
            font.family: "Montserrat SemiBold"
            font.weight: Font.DemiBold
            font.pixelSize: 18
            anchors.left: parent.left
            anchors.leftMargin: 30
            anchors.top: parent.top
        }

        Text {
            id: label43
            x: -4
            y: 5
            height: 54
            color: "#4f515a"
            text: qsTr("Place a stop loss or take profit order")
            anchors.topMargin: 5
            font.family: "Montserrat"
            wrapMode: Text.WordWrap
            font.pixelSize: 13
            anchors.left: parent.left
            anchors.rightMargin: 20
            anchors.leftMargin: 30
            anchors.top: label12.bottom
            anchors.right: tradebutton.left
        }

        Mybutton {
            id: tradebutton
            x: 244
            y: 208
            height: 44
            text: qsTr("Place orders")
            font.bold: false
            rightPadding: 20
            leftPadding: 20
            font.family: "Montserrat SemiBold"
            font.capitalization: Font.MixedCase
            font.weight: Font.DemiBold
            font.pixelSize: 14
            anchors.rightMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            onClicked: startTradingSignalInternoverview()
        }
        anchors.rightMargin: 24
        border.width: 0
        anchors.right: parent.right
    }


}
