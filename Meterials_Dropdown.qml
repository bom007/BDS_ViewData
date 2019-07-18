import QtQuick 2.9
import QtQuick.Controls 2.2


Item{
    id: cbbMain
    property var model
    property string currentTextValue: ""
    property string placeHolderText: "Abc"
    // Option
    property int itemHeight: baseButtonHeight

    property int fontSize: normalFontSize
    property int marginCbbItem: 5 * dpiToPixelValue
    property bool lvAreaMoving: false
    property alias lvMultiPoint: lvComboboxPopup
    Rectangle {
        id:bgText
        color: "transparent"
        radius: 5 * dpiToPixelValue
        anchors.fill: parent
        border.color: baseColor
        border.width: 1
        Text{
            id: txtDisplay
            text: currentTextValue === "" ? placeHolderText : currentTextValue
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            anchors.left: parent.left
            anchors.leftMargin: 10 * dpiToPixelValue
            height: parent.height
            width: parent.width - imgIcon.width
            color: currentTextValue === "" ? "#b1b1b2" : baseColor
            font.pixelSize: fontSize
            elide: Text.ElideRight
        }
        Rectangle {
            width: txtHeaderText.width + 10 * dpiToPixelValue
            height: txtHeaderText.height + 6 * dpiToPixelValue
            color: bgText.border.color
            y: bgText.y - height / 2
            x: 5 * dpiToPixelValue
            visible: currentTextValue !== ""
            radius: height / 2
            Text {
                id:txtHeaderText
                text: cbbMain.placeHolderText
                font.pixelSize: 9 * dpiToPixelValue
                visible: currentTextValue !== ""
                color: currentTextValue !== "" ? "#FFFFFF" : baseColor
                anchors.centerIn: parent
            }
        }

        Image {
            id: imgIcon
            width: 10 * dpiToPixelValue
            height: width
            source: "qrc:/resource/control_dropdown.png"
            anchors.right: parent.right
            anchors.rightMargin: 5 * dpiToPixelValue
            y: parent.height / 2 - height / 2
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                menuCombobox.open()
            }
        }
    }

    Menu {
        id: menuCombobox
        y: cbbMain.height + 2 * dpiToPixelValue
        height: recComboboxPopup.height
        width: recComboboxPopup.width
        background: Rectangle{
            color: "transparent"
        }

        onVisibleChanged: {
            if(visible) {
                lvComboboxPopup.model = cbbMain.model
            }
        }

        contentItem: Item {
            id: recComboboxPopup
            width: lvComboboxPopup.width
            height: lvComboboxPopup.height + (recBackGround.radius * 2)

            Rectangle {
                id: recBackGround
                border.color: baseColor
                radius: 5 * dpiToPixelValue
                anchors.fill: parent
            }

            ListView {
                id: lvComboboxPopup
                width: cbbMain.width
                height: lvComboboxPopup.count > 10 ? itemHeight * 10 : itemHeight * lvComboboxPopup.count
                x: 1 * dpiToPixelValue
                snapMode: ListView.SnapToItem
                boundsBehavior: Flickable.StopAtBounds
                clip: true
                delegate: Item {
                    width: cbbMain.width - 2 * dpiToPixelValue
                    height: itemHeight
                    Text{
                        id: txtComboboxNameItem
                        text: modelData
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignLeft
                        x: 5 * dpiToPixelValue
                        height: parent.height
                        width: parent.width - 10 * dpiToPixelValue
                        color: "#DCDCDC"
                        font.pixelSize: fontSize
                        elide: Text.ElideRight
                    }
                    Rectangle{
                        anchors.bottom: parent.bottom
                        width: parent.width
                        height: 1
                        color: "#DCDCDC"
                        visible: index < lvComboboxPopup.count -1
                    }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true

                        property bool isAreaMoving: cbbMain.lvAreaMoving
                        onIsAreaMovingChanged: {
                            cbbMain.currentTextValue = txtComboboxNameItem.text
                            menuCombobox.close()
                        }

                        onClicked: {
                            console.log("onclicked")
                            cbbMain.currentTextValue = txtComboboxNameItem.text
                            console.log(cbbMain.currentTextValue)
                            menuCombobox.close()
                        }
                        onEntered: {
                            txtComboboxNameItem.color = baseColor
                        }
                        onExited: {
                            txtComboboxNameItem.color = "#DCDCDC"
                        }
                    }
                }
            }
        }
    }
}

