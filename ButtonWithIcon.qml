import QtQuick 2.0

Rectangle {
    id:buttonWithIcon
    width: 100
    height: 100
    clip: true
    radius: height / 2
    border.color: "white"
    border.width: 2 * dpiToPixelValue
    color: "transparent"
    property string iconSource: ""
    signal clicked()
    Image {
        source: iconSource
        height: parent.height / 2
        fillMode: Image.PreserveAspectFit
        anchors.centerIn: parent
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {
            buttonWithIcon.clicked()
        }
    }
}
