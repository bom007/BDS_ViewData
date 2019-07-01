import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
    height: 100 * dpiToPixelValue
    width: 300 * dpiToPixelValue
    property int textBoxRadius: 5 * dpiToPixelValue
    property string iconSource: ""
    property alias text: txtContent.text
    property alias placeholderText: txtContent.placeholderText
    property alias echoMode: txtContent.echoMode
    Image {
        id: imgIcon
        source: iconSource
        height: parent.height / 2
        y: parent.height / 2 - height / 2
        x: textBoxRadius
        visible: iconSource !== ""
    }
    Rectangle{
        color: "transparent"
        radius: textBoxRadius
        border.color: baseColor
        border.width: 1
        anchors.fill: parent
    }
    TextField {
        id:txtContent
        height: parent.height
        font.pixelSize: normalFontSize
        anchors.left: iconSource !== "" ? imgIcon.right : parent.left
        anchors.leftMargin: 5 * dpiToPixelValue
        anchors.right: parent.right
        anchors.rightMargin: 5 * dpiToPixelValue
        background: Rectangle{
            color: "transparent"
        }
    }
}
