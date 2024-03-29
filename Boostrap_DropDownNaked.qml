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
    property color backgroundColor: "transparent"
    Rectangle {
        id: recDisplay
        width: parent.width
        height: parent.height
        radius: 5 * dpiToPixelValue
        y: parent.height / 2 - height / 2
        color: backgroundColor
        Text{
            id: txtDisplay
            text: currentTextValue === "" ? placeHolderText : currentTextValue
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            height: parent.height
            width: parent.width - imgIcon.width
            color: baseColor
            font.pixelSize: fontSize
            elide: Text.ElideRight
        }
        Image {
            id: imgIcon
            width: 10 * dpiToPixelValue
            height: width
            source: "qrc:/resource/control_dropdown.png"
            anchors.right: parent.right
            anchors.rightMargin: 5 * dpiToPixelValue
            y:parent.height / 2 - height / 2
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
        y: cbbMain.height
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

        contentItem: Rectangle {
            id: recComboboxPopup
            width: lvComboboxPopup.width
            height: lvComboboxPopup.height + (recBackGround.radius * 2)
            clip: true

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
                y: recBackGround.radius
                snapMode: ListView.SnapToItem
                delegate: Rectangle {
                    width: cbbMain.width
                    height: itemHeight
                    color: "transparent"
                    Text{
                        id: txtComboboxNameItem
                        text: displayText
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        x: 5 * dpiToPixelValue
                        height: parent.height
                        width: parent.width - 10 * dpiToPixelValue
                        color: baseColor
                        font.pixelSize: fontSize
                        elide: Text.ElideRight
                    }
                    Rectangle{
                        height: parent.height / 2
                        width: height
                        y:parent.height / 2 - height / 2
                        anchors.right: parent.right
                        anchors.rightMargin: 5 * dpiToPixelValue
                        border.color: "lightgray"
                        border.width: 1
                        radius: 3 * dpiToPixelValue
                        Image {
                            source: "qrc:/resource/Check_Green.png"
                            anchors.fill: parent
                            fillMode: Image.PreserveAspectFit
                            visible: displayActive
                        }
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
                            displayActive = !displayActive
                            switch(index){
                                case 0: recHomeScreen.displayTieuDe = !recHomeScreen.displayTieuDe;break;
                                case 1: recHomeScreen.displayDiachi = !recHomeScreen.displayDiachi;break;
                                case 2: recHomeScreen.displayGia = !recHomeScreen.displayGia;break;
                                case 3: recHomeScreen.displayLoaibaiviet = !recHomeScreen.displayLoaibaiviet;break;
                                case 4: recHomeScreen.displayNguoiDang = !recHomeScreen.displayNguoiDang;break;
                                case 5: recHomeScreen.displaySoDienThoai = !recHomeScreen.displaySoDienThoai;break;
                                case 6: recHomeScreen.displayNgayDang = !recHomeScreen.displayNgayDang;break;
                                case 7: recHomeScreen.displayNoiDung = !recHomeScreen.displayNoiDung;break;
                                case 8: recHomeScreen.displayQuanHuyen = !recHomeScreen.displayQuanHuyen;break;
                                case 9: recHomeScreen.displayPhuongXa = !recHomeScreen.displayPhuongXa;break;
                                case 10: recHomeScreen.displayDienTichDat = !recHomeScreen.displayDienTichDat;break;
                                case 11: recHomeScreen.displayMatTien = !recHomeScreen.displayMatTien;break;
                                case 12: recHomeScreen.displayPhapLy = !recHomeScreen.displayPhapLy;break;
                            }
                        }
                        onEntered: {
                            parent.color = "#d3e0ee"
                        }
                        onExited: {
                            parent.color = "transparent"
                        }
                    }
                }
            }
        }
    }

}

