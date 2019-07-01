import QtQuick 2.9
import QtQuick.Controls 2.2

Item {
    property double minimumWidth: 120 * dpiToPixelValue
    property int sorted: 0 //0: unsorted
    property int buttonIndex: 0
    property bool resizable: true
    signal seperatorMoved(real movement)
    property color splitterColor: "lightgray"
    property string text: ""
    width: minimumWidth
    height: baseButtonHeight
    Text {
        id:headerLabel
        height: parent.height
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        color: baseColor
        font.pixelSize: normalFontSize
        elide: Text.ElideRight
        text: parent.text
        anchors.centerIn: parent
    }
    Rectangle{
        width: 1 * dpiToPixelValue
        height: parent.height / 2
        anchors.right: parent.right
        y: parent.height / 2 - height / 2
        color: splitterColor
        visible: resizable
    }
    Image{
        anchors.left: headerLabel.right
        anchors.leftMargin: 5 * dpiToPixelValue
        width: 10 * dpiToPixelValue
        source: "qrc:/resource/control_toggle.png"
        fillMode: Image.PreserveAspectFit
        y:parent.height / 2 - height / 2
    }
    MouseArea{
        width: 5 * dpiToPixelValue
        height: parent.height
        anchors.right: parent.right
        y: parent.height / 2 - height / 2
        cursorShape: Qt.SizeHorCursor
        property point lastMousePos: Qt.point(0, 0)
        onPressed: { lastMousePos = Qt.point(mouseX, mouseY); }
        onMouseXChanged: {
            seperatorMoved(mouseX - lastMousePos.x)
        }
    }
}
