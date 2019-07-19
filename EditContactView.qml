import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.4

Rectangle {
    property var dataObject: {
        "name": '1',
        "id": '2',
        "phoneNumber": '3',
        "type": 'Môi giới'
    }

    function getFormData() {
        var object = {
            "name": txtName.text,
            "id": txtId.text,
            "phoneNumber": txtPhoneNumber.text,
            "type": cbType.currentTextValue
        }

        return object;
    }

    anchors.fill: parent
    anchors.margins: 20 * dpiToPixelValue
    RowLayout {
        anchors.fill: parent
        spacing: 30 * dpiToPixelValue
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            border.color: "lightgrey"
            border.width: 2 * dpiToPixelValue
            radius: 5 * dpiToPixelValue
            color: baseColor
            clip: true

            Text {
                id: title
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.leftMargin: 10 * dpiToPixelValue
                width: parent.width
                height: 40 * dpiToPixelValue
                font.pointSize: normalFontSize
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                color: "#ffffff"
                text: qsTr("Thông tin cơ bản")
            }

            // body
            Rectangle {
                width: parent.width - 4 * dpiToPixelValue
                anchors.horizontalCenter: parent.horizontalCenter
                height: parent.height - title.height - 2 * dpiToPixelValue
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2 * dpiToPixelValue

                Rectangle {
                    anchors.fill: parent
                    anchors.topMargin: 30 * dpiToPixelValue
                    anchors.leftMargin: 20 * dpiToPixelValue
                    anchors.rightMargin: 20 * dpiToPixelValue
                    anchors.bottomMargin: 10 * dpiToPixelValue

                    Materials_TextBox {
                        id: txtName
                        anchors.top: parent.top
                        placeholderText: qsTr("Họ và tên")
                        width: parent.width
                        height: baseButtonHeight
                        font.pixelSize: normalFontSize
                        text: dataObject.name
                    }

                    Materials_TextBox {
                        id: txtId
                        anchors.top: txtName.bottom
                        anchors.topMargin: 20 * dpiToPixelValue
                        placeholderText: qsTr("CMND / Hộ chiếu / ID")
                        width: parent.width
                        height: baseButtonHeight
                        font.pixelSize: normalFontSize
                        text: dataObject.id
                    }

                    Materials_TextBox {
                        id: txtPhoneNumber
                        anchors.top: txtId.bottom
                        anchors.topMargin: 20 * dpiToPixelValue
                        placeholderText: qsTr("Số điện thoại (*)")
                        width: parent.width
                        height: baseButtonHeight
                        font.pixelSize: normalFontSize
                        text: dataObject.phoneNumber
                    }

                    Meterials_Dropdown {
                        id: cbType
                        anchors.top: txtPhoneNumber.bottom
                        anchors.topMargin: 20 * dpiToPixelValue
                        placeHolderText: qsTr("Phân loại")
                        width: 160 * dpiToPixelValue
                        height: baseButtonHeight
                        model: ['Môi giới', 'Chính chủ', 'Nhà đầu tư']
                        currentTextValue: dataObject.type
                    }

                    // footer
                    Rectangle {
                        id: footer
                        width: parent.width
                        height: baseButtonHeight
                        anchors.bottom: parent.bottom

                        CustomButton {
                            id: btnDelete
                            buttonText: qsTr("Xóa")
                            buttonColor: "gray"
                            anchors.right: btnSave.left
                            anchors.rightMargin: 10 * dpiToPixelValue
                            onClicked: {

                            }
                        }

                        CustomButton {
                            id: btnSave
                            buttonText: qsTr("Lưu")
                            buttonColor: baseColor
                            anchors.right: parent.right
                        }
                    }
                }
            }
        }

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Image {
                id: name
                anchors.centerIn: parent
                source: "qrc:/resource/SettingContact.png"
            }
        }
    }
}
