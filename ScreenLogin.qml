import QtQuick 2.0

Item {
    property string backgroundSource: ""
    property string logoSource: ""
    property string companyName: ""
    property int logoSize: 0
    Image {
        id: name
        source: backgroundSource
        anchors.centerIn: parent
    }
    Rectangle {
        anchors.centerIn: parent
        width: 250 * dpiToPixelValue > (parent.width - 20 * dpiToPixelValue) ? (parent.width - 20 * dpiToPixelValue) : 250 * dpiToPixelValue
        height: clItems.implicitHeight + 20 * dpiToPixelValue
        color: "#AFFFFFFF"
        radius: 5 * dpiToPixelValue
        Column{
            id:clItems
            width: parent.width - 20 * dpiToPixelValue
            x: 10 * dpiToPixelValue
            y: 10 * dpiToPixelValue
            spacing: 10 * dpiToPixelValue
            Image{
                source: logoSource
                width: logoSize > 0 ? logoSize : 150 * dpiToPixelValue
                height: logoSize > 0 ? logoSize : 150 * dpiToPixelValue
                fillMode: Image.PreserveAspectFit
                x: parent.width / 2 - width / 2
            }

            Text {
                text: companyName
                font.pixelSize: extraFontSize
                color:baseColor
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                visible: companyName !== ""
            }
            Bootstrap_TextboxWithIcon{
                id:txtPhoneNumber
                placeholderText: qsTr("Số điện thoại")
                width: parent.width
                height: baseButtonHeight
                textBoxRadius:height / 2
                onTextChanged:{
                    if(txtPhoneNumber.text.trim() === "" || txtPassword.text.trim() === ""){
                        btnSignIn.enabled = false
                    }else{
                        btnSignIn.enabled = true
                    }
                }
            }
            Bootstrap_TextboxWithIcon{
                id:txtPassword
                placeholderText: qsTr("Mật khẩu")
                width: parent.width
                height: baseButtonHeight
                textBoxRadius:height / 2
                echoMode: TextInput.Password
                onTextChanged:{
                    if(txtPhoneNumber.text.trim() === "" || txtPassword.text.trim() === ""){
                        btnSignIn.enabled = false
                    }else{
                        btnSignIn.enabled = true
                    }
                }
            }
            CustomButton{
                id:btnSignIn
                buttonText: qsTr("Đăng nhập")
                buttonColor: enabled ? baseColor : "gray"
                enabled: false
                width: parent.width
                onClicked: {
                    forceActiveFocus()
                    if(txtPhoneNumber.text.trim() === ""){
                        messageDialog.show("Vui lòng nhập số điện thoại")
                    }else if(txtPassword.text.trim() === ""){
                        messageDialog.show("Vui lòng nhập mật khẩu")
                    }else{
                        enabled = false
                        waitingDialog.show("Please wait")
                        if(appManager.loginUser(txtPhoneNumber.text, txtPassword.text)){
                            if(appManager.startupApplication() === true){
                                mainStackView.push("qrc:/ScreenHome.qml")
                                isLoggedIn = true
                            }
                        }else{
                            messageDialog.show("Sai SĐT hoặc mật khẩu")
                        }
                        waitingDialog.close()
                        enabled = true
                    }
                }
            }
//            Text {
//                text: qsTr("Or")
//                font.pixelSize: normalFontSize
//                color:baseColor
//                width: parent.width
//                horizontalAlignment: Text.AlignHCenter
//                verticalAlignment: Text.AlignVCenter
//            }

//            CustomButton{
//                buttonText: qsTr("Quên mật khẩu")
//                width: parent.width
//                onClicked: {
//                    enabled = false
//                    mainStackView.push("qrc:/ScreenForgotPassword.qml")
//                    enabled = true
//                }
//            }
        }
    }
}
