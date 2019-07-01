import QtQuick 2.0
import QtQuick.Controls 2.0

Rectangle{
    id: recMsgDialog

    color: "white"
    visible: false
    anchors.centerIn: parent
    radius: 10 * dpiToPixelValue
    height: txtLoginMessageContent.height + btnOK.height + rectLoginMessageRow.height
    width: {
        var newWidth = parent.width - 20 * dpiToPixelValue
        if(newWidth > 250 * dpiToPixelValue){
            return 250 * dpiToPixelValue
        }else{
            return newWidth
        }
    }

    signal closed

    function show(string){
        txtLoginMessageContent.text=string
        visible = true
    }

    function close(){
        recMsgDialog.visible = false
        closed()
    }

    Text {
        id: txtLoginMessageContent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        x:parent.width / 2 - width / 2
        anchors.top :parent.top
        font.pixelSize: normalFontSize
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        width: parent.width
        height: baseButtonHeight
    }
    Rectangle{
        id:rectLoginMessageRow
        anchors.top:txtLoginMessageContent.bottom
        anchors.topMargin: 5
        color: "lightgray"
        width: parent.width
        height: 1
    }
    Button{
        id:btnOK
        text:qsTr("OK")
        font.pixelSize: normalFontSize
        width: parent.width / 2
        height: baseButtonHeight
        padding: 0
        x: parent.width / 2 - width / 2
        anchors.top:rectLoginMessageRow.bottom
        background: Rectangle{
            anchors.fill: parent
            color: "transparent"
        }
        onClicked: {
            recMsgDialog.close()
        }
    }
}
