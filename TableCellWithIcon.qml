import QtQuick 2.0

Item {
    property bool expanded: false
    property bool viewed: false

    property alias text: txtNoiDung.text
    property alias fontPixelSize: txtNoiDung.font.pixelSize
    property alias horizontalAlignment: txtNoiDung.horizontalAlignment
    property alias verticalAlignment: txtNoiDung.verticalAlignment
    property alias elide: txtNoiDung.elide
    property alias wrapMode: txtNoiDung.wrapMode
    property int textHeight: txtNoiDung.height
    property int padding: 10 * dpiToPixelValue
    Text {
        id: txtNoiDung
        text: parent.text
        color: viewed ? "gray" : "black"
        font.pixelSize: 15
        width: parent.width - padding
        x: padding
        horizontalAlignment: Text.AlignHCenter
        height: expanded ? (implicitHeight + padding * 2) : parent.height
        verticalAlignment: Text.AlignTop
        y: 10 * dpiToPixelValue
        elide: Text.ElideRight
        wrapMode: expanded ? Text.WrapAtWordBoundaryOrAnywhere : Text.NoWrap
    }

}
