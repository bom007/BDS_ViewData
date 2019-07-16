import QtQuick 2.0

Item {
    property string sourceIcon: ""
    property int heightRec: 10 * dpiToPixelValue
    property bool showLine: true

    Image {
        source: sourceIcon
        height: baseButtonHeight / 2
        width: height
        fillMode: Image.PreserveAspectFit
        x:parent.width / 2 + 5 * dpiToPixelValue
        y:parent.height / 2 - height / 2
        anchors.centerIn: parent
    }

    Rectangle{
        visible: showLine
        color: baseColor
        height: heightRec
        width: 1
        anchors.right: parent.right
    }
}
