import QtQuick 2.0

Rectangle {
    color: "white"
    Rectangle {
        anchors.centerIn: parent
        width: parent.width - 20 * dpiToPixelValue
        height: clItems.implicitHeight
        color: "transparent"
        Column{
            id:clItems
            width: parent.width
            spacing: 10 * dpiToPixelValue
            Text {
                text: qsTr("Sign In")
                font.pixelSize: extraFontSize
                color:baseColor
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            CustomTextBox{
                id:txtPhoneNumber
                placeholderText: "Phone Number"
                width: parent.width
                textBoxRadius:height / 2
                onTextChanged:{
                    if(txtPhoneNumber.text.trim() === "" || txtPassword.text.trim() === ""){
                        btnSignIn.enabled = false
                    }else{
                        btnSignIn.enabled = true
                    }
                }
            }
            CustomTextBox{
                id:txtPassword
                placeholderText: "Password"
                width: parent.width
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
                buttonText: qsTr("SIGN IN")
                buttonColor: enabled ? baseColor : "gray"
                enabled: false
                width: parent.width
                onClicked: {
                    forceActiveFocus()
                    if(txtPhoneNumber.text.trim() === ""){
                        messageDialog.show("Please input phone number")
                    }else if(txtPassword.text.trim() === ""){
                        messageDialog.show("Please input password")
                    }else{
                        enabled = false
                        waitingDialog.show("Please wait")
                        if(appManager.loginUser(txtPhoneNumber.text, txtPassword.text)){
                            if(appManager.startupApplication() === true){
                                mainStackView.push("qrc:/ScreenHome.qml")
                                isLoggedIn = true
                            }
                        }else{
                            messageDialog.show("Wrong phone number or password")
                        }
                        waitingDialog.close()
                        enabled = true
                    }
                }
            }
            Text {
                text: qsTr("Or")
                font.pixelSize: normalFontSize
                color:baseColor
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            CustomButton{
                buttonText: qsTr("Forgot password")
                width: parent.width
                onClicked: {
                    enabled = false
                    mainStackView.push("qrc:/ScreenForgotPassword.qml")
                    enabled = true
                }
            }
        }
    }
}
