import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2

ApplicationWindow {
    id:mainWindow
    visible: true
    width: Screen.desktopAvailableWidth > 1600 ? 1600 : Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight > 900 ? 900 : Screen.desktopAvailableHeight
    property int baseButtonHeight: 40 * dpiToPixelValue
    property int normalFontSize: 14 * dpiToPixelValue
    property int bigFontSize: 20 * dpiToPixelValue
    property int extraFontSize: 24 * dpiToPixelValue
    property int smallFontSize: 12 * dpiToPixelValue
    property color baseColor: "#0078D7"
    property bool isLoggedIn: false
    property bool isAutoLogin: true

    StackView {
        id: mainStackView
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        visible: false
    }
    Rectangle{
        id:recSplash
        anchors.fill: parent
        color: "white"
        Image {
            source: "qrc:/resource/logo.png"
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
        }
    }
    Timer{
        id: tmSplashTimer
        interval: 1000
        running: false
        repeat: false
        onTriggered: {
            waitingDialog.show("Khởi động ứng dụng")
//            if(appManager.autoLogin() === false){
//                if(appManager.startupApplication() === true){
//                    mainStackView.visible = true
//                    mainStackView.push("qrc:/ScreenLogin.qml",
//                                       {backgroundSource: "qrc:/resource/login_background.jpeg",
//                                       logoSource: "qrc:/resource/logo.png"})
//                }
//            }else{
//                if(appManager.startupApplication() === true){
                    mainStackView.visible = true
                    mainStackView.push("qrc:/ScreenHome.qml")
//                    isLoggedIn = true
//                }
//            }
            recSplash.visible = false
            waitingDialog.close()
        }
    }

    Component.onCompleted: {
        tmSplashTimer.start()
        console.log(width)
        console.log(height)
    }
    Rectangle{
        id: bgMessageDialog
        anchors.fill: parent
        visible: waitingDialog.visible || messageDialog.visible
        color: "black"
        opacity: 0.5
        MouseArea{
            enabled: parent.visible
            anchors.fill: parent
            onClicked: {
                console.log("Screen Locked")
            }
        }
    }

    Rectangle{
        id:waitingDialog
        function show(string){
            txtWaitingMessage.text=string
            visible = true
        }

        function close(){
            waitingDialog.visible = false
        }
        anchors.centerIn: parent
        radius: 2
        width: Math.max(txtWaitingMessage.width + 20 * dpiToPixelValue, 100 * dpiToPixelValue)
        color: "white"
        visible: false

        Text {
            id: txtWaitingMessage
            padding: 6
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            x:parent.width / 2 - width / 2
            anchors.top :imgWaitingIndicator.bottom
            font.pixelSize: normalFontSize
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }
        Image {
            id: imgWaitingIndicator
            source: "qrc:/resource/spinner.png"
            width: 40 * dpiToPixelValue
            height: width
            fillMode: Image.PreserveAspectFit
            x:parent.width / 2 - width / 2
            anchors.centerIn: parent
        }
        RotationAnimator {
            target: imgWaitingIndicator;
            from: 0;
            to: 360;
            duration: 1000
            running: waitingDialog.visible
            direction: RotationAnimator.Clockwise
            loops: Animation.Infinite
        }
        height: txtWaitingMessage.height + 20 * dpiToPixelValue + imgWaitingIndicator.height
    }

    MsgDialog_iOS{
        id: messageDialog
    }

}
