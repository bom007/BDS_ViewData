import QtQuick 2.9

Item {
    id: scrollbar;
    height:  (handleSize + 2 * (backScrollbar.border.width + (1 * dpiToPixelValue))) * dpiToPixelValue;
    visible: (flickable.visibleArea.widthRatio < 1.0);

    property bool isActive: false
    property color colorBackScrollBar: "#192126"
    anchors {
        left: flickable.left;
        right: flickable.right;
        bottom: flickable.bottom;
    }

    property Flickable flickable               : null;
    property int       handleSize              : 20 * dpiToPixelValue;

    function scrollRight () {
        flickable.contentX = Math.min (flickable.contentX + (flickable.width / 4), flickable.contentWidth - flickable.width);
    }
    function scrollLeft () {
        flickable.contentX = Math.max (flickable.contentX - (flickable.width / 4), 0);
    }

    Binding {
        target: handle;
        property: "x";
        value: (flickable.contentX * clicker.drag.maximumX / (flickable.contentWidth - flickable.width));
        when: (!clicker.drag.active);
    }

    Binding {
        target: flickable;
        property: "contentX";
        value: (handle.x * (flickable.contentWidth - flickable.width) / clicker.drag.maximumX);
        when: (clicker.drag.active || clicker.pressed);
    }

    Rectangle {
        id: backScrollbar;
        radius: 2 * dpiToPixelValue;
        antialiasing: true;
        color: colorBackScrollBar
        anchors { fill: parent; }

        MouseArea {
            anchors.fill: parent;
            onClicked: { }
        }
    }

    MouseArea {
        id: btnLeft;
        width: height;
        anchors {
            top:parent.top ;
            left: parent.left;
            bottom: parent.bottom;
            margins: (backScrollbar.border.width +1);
        }
        onClicked: { scrollLeft (); }

        Image {
            source: isActive ? "qrc:/resource/ScrollButton_Selected.png" : "qrc:/resource/ScrollButton_Unselected.png"
            rotation: -90
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
        }
        hoverEnabled: true
        onEntered: {
            isActive = true
        }
        onExited: {
            isActive = false
        }
    }

    MouseArea {
        id: btnRight;
        width: height;
        anchors {
            top:parent.top ;
            right: parent.right;
            bottom: parent.bottom;
            margins: (backScrollbar.border.width +1);
        }
        onClicked: { scrollRight (); }

        Image {
            source: isActive ? "qrc:/resource/ScrollButton_Selected.png" : "qrc:/resource/ScrollButton_Unselected.png"
            anchors.fill: parent
            rotation: 90;
            fillMode: Image.PreserveAspectFit
        }
        hoverEnabled: true
        onEntered: {
            isActive = true
        }
        onExited: {
            isActive = false
        }
    }

    Item {
        id: groove;
        clip: true;
        anchors {
            fill: parent;
            topMargin: (backScrollbar.border.width + (1 * dpiToPixelValue));
            leftMargin: (backScrollbar.border.width + (1 * dpiToPixelValue) + btnLeft.width +1);
            rightMargin: (backScrollbar.border.width + (1 * dpiToPixelValue) + btnRight.width + (1 * dpiToPixelValue));
            bottomMargin: (backScrollbar.border.width + (1 * dpiToPixelValue));
        }

        MouseArea {
            id: clicker;
            drag {
                target: handle;
                minimumX: 0 * dpiToPixelValue;
                maximumX: (groove.width - handle.width);
                axis: Drag.XAxis;
            }
            anchors { fill: parent; }
            onClicked: { flickable.contentX = (mouse.x / groove.width * (flickable.contentWidth - flickable.width)); }
            onPressed: {
                isActive = true
            }
            onReleased: {
                isActive = false
            }
        }
        Item {
            id: handle;
            width:  Math.max (20 * dpiToPixelValue, (flickable.visibleArea.widthRatio * groove.width));
            anchors {
                top:parent.top;
                bottom: parent.bottom;
            }

            Rectangle {
                id: backHandle;
                color: (isActive ? "#68757D" : "#485459");
                radius: width / 2
                anchors { fill: parent; }

                Behavior on opacity { NumberAnimation { duration: 150; } }
            }
        }
    }

}
