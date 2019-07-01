import QtQuick 2.0
import QtQuick.Controls 2.0

TextField {
    id:txtInputTextField
    height: 40 * dpiToPixelValue
    property double textBoxRadius: 5 * dpiToPixelValue
    property string previousText: ""
    property int dataPoint: 0

    background: Rectangle{
        id:bgText
        color: "transparent"
        radius: textBoxRadius
        anchors.fill: parent
        border.color: baseColor
        border.width: 1
        Rectangle{
            width: txtHeaderText.width + 10 * dpiToPixelValue
            height: txtHeaderText.height + 6 * dpiToPixelValue
            color: bgText.border.color
            y: bgText.y - height / 2
            x: textBoxRadius
            visible: txtInputTextField.text !== ""
            radius: height / 2
            Text {
                id:txtHeaderText
                text: txtInputTextField.placeholderText
                visible: txtInputTextField.text !== ""
                font.pixelSize: 9 * dpiToPixelValue
                color: txtInputTextField.text !== "" ? "#FFFFFF" : baseColor
                anchors.centerIn: parent
            }
        }
    }
    font.pixelSize: 15 * dpiToPixelValue
}
