import QtQuick 2.9
import QtQuick.Controls 1.4

Rectangle {
    anchors.fill: parent
    color: "transparent"
    property string dateSel: ""
    property string monthSel: ""
    property string yearSel: ""

    signal calendarClicked()

    Calendar {
        anchors.fill: parent
        minimumDate: new Date(2000, 0, 1)
        maximumDate: new Date(2100, 0, 1)
        property date dateS

        onClicked: {
            dateS = selectedDate

            dateSel = dateS.getDate()
            monthSel = dateS.getMonth() + 1
            yearSel = dateS.getFullYear()

            calendarClicked()
        }
    }
}
