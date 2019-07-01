import QtQuick 2.0

Item {
    id: itemFooter
    height: baseButtonHeight
    property int pageIndex: 1
    property int totalPage: 1
    property color activeTextColor: "white"
    property color activeBgColor: "#0078D7"
    property color textColor: "#0078D7"
    property color bgColor: "transparent"
    Component.onCompleted: {
        console.log("pageIndex: " + pageIndex)
        console.log("totalPage: " + totalPage)
    }

    Row{
        id:rowPaging
        spacing: 10 * dpiToPixelValue
        height: parent.height
        anchors.right: parent.right
        Text {
            text: qsTr("Trang đầu")
            height: parent.height
            verticalAlignment: Text.AlignVCenter
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    pageIndex = 1
                }
            }
        }
        Repeater{
            model: 5
            Rectangle{
                color: currentPage === pageIndex ? activeBgColor : bgColor
                height: parent.height
                width: height
                radius: height / 2
                property int currentPage: pageIndex + index - 2
                visible: currentPage > 0 && currentPage <= totalPage
                Text {
                    text: currentPage
                    font.pixelSize: normalFontSize
                    anchors.centerIn: parent
                    color: currentPage === pageIndex ? activeTextColor : textColor
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        pageIndex = currentPage
                    }
                }
            }
        }
        Text {
            text: qsTr("Trang cuối")
            height: parent.height
            verticalAlignment: Text.AlignVCenter
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    pageIndex = totalPage
                }
            }
        }
    }
}
