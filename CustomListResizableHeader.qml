import QtQuick 2.9
import QtQuick.Controls 2.2

Text {
    property double minimumWidth: 100 * dpiToPixelValue
    property int sorted: 0 //0: unsorted
    property int buttonIndex: 0
    property bool resizable: true
    signal seperatorMoved(real movement)

    height: parent.height
    width: parent.width
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter
    color: baseColor
    font.pixelSize: normalFontSize
    Rectangle{
        width: 1 * dpiToPixelValue
        height: parent.height
        anchors.right: parent.right
        y: parent.height / 2 - height / 2
        color: baseColor
        visible: resizable
    }
    Rectangle{
        width: parent.width
        height: 1 * dpiToPixelValue
        anchors.bottom: parent.bottom
        color: baseColor
        visible: resizable
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

//    MouseArea {
//        width: parent.width - 5
//        height: parent.height
//        anchors.left: parent.left

//        onClicked: {
//            if(buttonIndex != -1) {
//                if(sorted === 2){
//                    sorted = 1
////                    if(typeChannel == 0) {
////                        appController.sortChannelOfDeviceList(idDevice, buttonIndex, true)
////                    } else {
////                        appController.sortChannelOfUnmatchedDeviceDetected(idDevice, buttonIndex, true)
////                    }
//                }else{
//                    sorted = 2
////                    if(typeChannel == 0) {
////                        appController.sortChannelOfDeviceList(idDevice, buttonIndex, false)
////                    } else {
////                        appController.sortChannelOfUnmatchedDeviceDetected(idDevice, buttonIndex, false)
////                    }
//                }
//            }
//        }
//    }
}
