import QtQuick 2.5
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4

Rectangle{
    id:recMainScreen
    color: "white"
    property bool isFinish: false
    property int controlWidth: 160 * dpiToPixelValue
    Component.onCompleted: {
        isFinish = true
    }
    function updateGia(){
        var minGia = 0
        if(txtGiaMin.text.trim() !== ""){
            minGia = txtGiaMin.text * 1
        }
        var maxGia = 0
        if(txtGiaMax.text.trim() !== ""){
            maxGia = txtGiaMax.text * 1
        }
        if(minGia > maxGia){
            txtGiaMax.text = txtGiaMin.text
            maxGia = minGia;
        }

        appManager.filterDanhSachTheoGia(minGia, maxGia)
    }

    ListModel{
        id:lmDisplayModel
        ListElement{
            displayText: "Loại Bài Viết"
            displayActive: true
        }
        ListElement{
            displayText: "Tiêu đề"
            displayActive: true
        }
        ListElement{
            displayText: "Địa chỉ"
            displayActive: true
        }
        ListElement{
            displayText: "Giá"
            displayActive: true
        }
        ListElement{
            displayText: "Người Đăng"
            displayActive: true
        }
        ListElement{
            displayText: "SDT"
            displayActive: true
        }
        ListElement{
            displayText: "Ngày Đăng"
            displayActive: true
        }
        ListElement{
            displayText: "Nội dung"
            displayActive: true
        }
        ListElement{
            displayText: "Quận Huyện"
            displayActive: false
        }
        ListElement{
            displayText: "Phường Xã"
            displayActive: false
        }
        ListElement{
            displayText: "Diện tích đất"
            displayActive: false
        }
        ListElement{
            displayText: "Mặt tiền"
            displayActive: false
        }
        ListElement{
            displayText: "Đường Vào"
            displayActive: false
        }
        ListElement{
            displayText: "Pháp Lý"
            displayActive: false
        }
    }

    Rectangle{
        id:recHeader
        height: colHeader.implicitHeight + 10 * dpiToPixelValue
        width: parent.width - 20 * dpiToPixelValue
        anchors.left:parent.left
        anchors.leftMargin: 10 * dpiToPixelValue
        visible: mainStackView.visible
        color: "white"
        border.color: "lightgray"
        border.width: 2 * dpiToPixelValue
        radius: 5 * dpiToPixelValue
        y: 10 * dpiToPixelValue
        Column{
            id:colHeader
            y: 5 * dpiToPixelValue
            spacing: 15 * dpiToPixelValue
            Row{
                x:10 * dpiToPixelValue
                width:parent.width - 20 * dpiToPixelValue
                height: baseButtonHeight
                spacing: 15 * dpiToPixelValue
                Rectangle{
                    id:recNguon
                    height: parent.height
                    width: controlWidth
                    Boostrap_DropDown{
                        id:cbbNguon
                        width: parent.width
                        anchors.bottom: parent.bottom
                        height: baseButtonHeight
                        placeHolderText: qsTr("Nguồn")
                        model: ["Tất cả","batdongsan.com.vn","chotot.com","muaban.net","dothi.net","nhabansg.vn","bannhasg.com"]
                        onCurrentTextValueChanged:{
                            enabled = false
                            waitingDialog.show("Please wait...")
                            if(currentTextValue !== "Tất cả"){
                                if(appManager.filterDanhSachNguon(currentTextValue)){
                                    console.log("success")
                                }
                            }else{
                                if(appManager.filterDanhSachNguon("")){
                                    console.log("success")
                                }
                            }
                            waitingDialog.close()
                            enabled = true
                        }
                    }

                }
                Rectangle{
                    id: recQuanHuyen
                    property string currentQuanHuyen: ""
                    height: parent.height
                    width: controlWidth
                    Boostrap_DropDown{
                        id:cbbQuanHuyen
                        width: parent.width
                        anchors.bottom: parent.bottom
                        height: baseButtonHeight
                        placeHolderText: qsTr("Quận / Huyện")
                        model: ["Tất cả","Quận 1","Quận 2","Quận 3","Quận 4","Quận 5","Quận 6","Quận 7","Quận 8","Quận 9","Quận 10","Quận 11","Quận 12",
                            "Quận Bình Chánh","Quận Bình Tân","Quận Bình Thạnh", "Quận Gò Vấp","Quận Phú Nhuận","Quận Tân Bình",
                            "Quận Tân Phú","Quận Thủ Đức","Huyện Cần Giờ","Huyện Củ Chi","Huyện Hóc Môn","Huyện Nhà Bè"]
                        onCurrentTextValueChanged: {
                            enabled = false
                            waitingDialog.show("Please wait...")
                            if(currentTextValue !== "Tất cả"){
                                recQuanHuyen.currentQuanHuyen = currentTextValue
                                if(appManager.filterDanhSachTheoQuan(currentTextValue)){
                                    console.log("success")
                                }
                            }else{
                                recPhuongXa.currentPhuongXa = ""
                                if(appManager.filterDanhSachTheoQuan("")){
                                    console.log("success")
                                }
                            }
                            waitingDialog.close()
                            enabled = true
                        }
                    }
                }
                Rectangle{
                    id:recPhuongXa
                    height: parent.height
                    property string currentPhuongXa: ""
                    width: controlWidth
                    Boostrap_DropDown{
                        id:cbbPhuongXa
                        width: parent.width
                        anchors.bottom: parent.bottom
                        placeHolderText: qsTr("Phường / Xã")
                        height: baseButtonHeight
                        property var listquan1: ["Tất cả","Phường Tân Định","Phường Đa Kao","Phường Bến Nghé","Phường Bến Thành","Phường Nguyễn Thái Bình","Phường Phạm Ngũ Lão","Phường Cầu Ông Lãnh","Phường Cô Giang","Phường Nguyễn Cư Trinh","Phường Cầu Kho"]
                        property var listquan2: ["Tất cả","Phường Thảo Điền","Phường An Phú","Phường Bình An","Phường Bình Trưng Đông","Phường Bình Trưng Tây","Phường Bình Khánh","Phường An Khánh","Phường Cát Lái","Phường Thạnh Mỹ Lợi","Phường An Lợi Đông","Phường Thủ Thiêm"]
                        property var listquan3: ["Tất cả","Phường 8","Phường 7","Phường 14","Phường 12","Phường 11","Phường 13","Phường 6","Phường 9","Phường 10","Phường 4","Phường 5","Phường 3","Phường 2","Phường 1"]
                        property var listquan4: ["Tất cả","Phường 12","Phường 13","Phường 9","Phường 6","Phường 8","Phường 10","Phường 5","Phường 18","Phường 14","Phường 4","Phường 3","Phường 16","Phường 2","Phường 15","Phường 1"]
                        property var listquan5: ["Tất cả","Phường 4","Phường 9","Phường 3","Phường 12","Phường 2","Phường 8",                       "Phường 15","Phường 7","Phường 1",                       "Phường 11","Phường 14","Phường 5","Phường 6","Phường 10","Phường 13"]
                        property var listquan6: ["Tất cả","Phường 14","Phường 13","Phường 9","Phường 6","Phường 12","Phường 5","Phường 11","Phường 2","Phường 1","Phường 4","Phường 8","Phường 3","Phường 7","Phường 10"]
                        property var listquan7: ["Tất cả","Phường Tân Thuận Đông","Phường Tân Thuận Tây","Phường Tân Kiểng","Phường Tân Hưng","Phường Bình Thuận","Phường Tân Quy","Phường Phú Thuận","Phường Tân Phú","Phường Tân Phong","Phường Phú Mỹ"]
                        property var listquan8: ["Tất cả","Phường 8","Phường 2","Phường 1","Phường 3","Phường 11","Phường 9","Phường 10","Phường 4","Phường 13","Phường 12","Phường 5","Phường 14","Phường 6","Phường 15","Phường 16","Phường 7"]
                        property var listquan9: ["Tất cả","Phường Long Bình","Phường Long Thạnh Mỹ","Phường Tân Phú","Phường Hiệp Phú","Phường Tăng Nhơn Phú A","Phường Tăng Nhơn Phú B","Phường Phước Long B","Phường Phước Long A","Phường Trường Thạnh","Phường Long Phước","Phường Long Trường","Phường Phước Bình","Phường Phú Hữu"]
                        property var listquan10: ["Tất cả","Phường 15","Phường 13","Phường 14","Phường 12","Phường 11","Phường 10","Phường 9","Phường 1","Phường 8","Phường 2","Phường 4","Phường 7","Phường 5","Phường 6","Phường 3"]
                        property var listquan11: ["Tất cả","Phường 15","Phường 5","Phường 14","Phường 11","Phường 3","Phường 10","Phường 13","Phường 8","Phường 9","Phường 12","Phường 7","Phường 6","Phường 4","Phường 1","Phường 2","Phường 16"]
                        property var listquan12: ["Tất cả","Phường Thạnh Xuân","Phường Thạnh Lộc","Phường Hiệp Thành","Phường Thới An","Phường Tân Chánh Hiệp","Phường An Phú Đông","Phường Tân Thới Hiệp","Phường Trung Mỹ Tây","Phường Tân Hưng Thuận","Phường Đông Hưng Thuận","Phường Tân Thới Nhất"]
                        property var listquanBinhChanh: ["Tất cả","Thị trấn Tân Túc","Xã Phạm Văn Hai","Xã Vĩnh Lộc A","Xã Vĩnh Lộc B","Xã Bình Lợi","Xã Lê Minh Xuân","Xã Tân Nhựt","Xã Tân Kiên","Xã Bình Hưng","Xã Phong Phú","Xã An Phú Tây","Xã Hưng Long","Xã Đa Phước","Xã Tân Quý Tây","Xã Bình Chánh","Xã Quy Đức"]
                        property var listquanBinhTan: ["Tất cả","Phường Bình Hưng Hòa","Phường Bình Hưng Hoà A","Phường Bình Hưng Hoà B","Phường Bình Trị Đông","Phường Bình Trị Đông A","Phường Bình Trị Đông B","Phường Tân Tạo","Phường Tân Tạo A","Phường An Lạc","Phường An Lạc A"]
                        property var listquanBinhThanh: ["Tất cả","Phường 13","Phường 11","Phường 27","Phường 26","Phường 12","Phường 25","Phường 5","Phường 7","Phường 24","Phường 6","Phường 14","Phường 15","Phường 2","Phường 1","Phường 3","Phường 17","Phường 21","Phường 22","Phường 19","Phường 28",]
                        property var listquanGoVap: ["Tất cả","Phường 15","Phường 13","Phường 17","Phường 6","Phường 16","Phường 12","Phường 14","Phường 10","Phường 5","Phường 7","Phường 4","Phường 1","Phường 9","Phường 8","Phường 11","Phường 3"]
                        property var listquanPhuNhuan: ["Tất cả","Phường 4","Phường 5","Phường 9","Phường 7","Phường 3","Phường 1","Phường 2","Phường 8","Phường 15","Phường 10","Phường 11","Phường 17","Phường 14","Phường 12","Phường 13"]
                        property var listquanTanBinh: ["Tất cả","Phường 2","Phường 4","Phường 12","Phường 13","Phường 1","Phường 3","Phường 11","Phường 7","Phường 5","Phường 10","Phường 6","Phường 8","Phường 9","Phường 14","Phường 15"]
                        property var listquanTanPhu: ["Tất cả","Phường Tân Sơn Nhì","Phường Tây Thạnh","Phường Sơn Kỳ","Phường Tân Qúy","Phường Tân Thành","Phường Phú Thọ Hoà","Phường Phú Thạnh","Phường Phú Trung","Phường Hoà Thạnh","Phường Hiệp Tân","Phường Tân Thới Hoà"]
                        property var listquanThuDuc: ["Tất cả","Phường Linh Xuân","Phường Bình Chiểu","Phường Linh Trung","Phường Tam Bình","Phường Tam Phú","Phường Hiệp Bình Phước","Phường Hiệp Bình Chánh","Phường Linh Chiểu","Phường Linh Tây","Phường Linh Đông","Phường Bình Thọ","Phường Trường Thọ"]
                        property var listhuyenCanGio: ["Tất cả","Thị trấn Cần Thạnh","Xã Bình Khánh","Xã Tam Thôn Hiệp","Xã An Thới Đông","Xã Thạnh An","Xã Long Hòa","Xã Lý Nhơn"]
                        property var listhuyenCuChi: ["Tất cả","Thị trấn Củ Chi","Xã Phú Mỹ Hưng","Xã An Phú","Xã Trung Lập Thượng","Xã An Nhơn Tây","Xã Nhuận Đức","Xã Phạm Văn Cội","Xã Phú Hòa Đông","Xã Trung Lập Hạ","Xã Trung An","Xã Phước Thạnh","Xã Phước Hiệp","Xã Tân An Hội","Xã Phước Vĩnh An","Xã Thái Mỹ","Xã Tân Thạnh Tây","Xã Hòa Phú","Xã Tân Thạnh Đông","Xã Bình Mỹ","Xã Tân Phú Trung","Xã Tân Thông Hội"]
                        property var listhuyenHocMon: ["Tất cả","Thị trấn Hóc Môn","Xã Tân Hiệp","Xã Nhị Bình","Xã Đông Thạnh","Xã Tân Thới Nhì","Xã Thới Tam Thôn","Xã Xuân Thới Sơn","Xã Tân Xuân","Xã Xuân Thới Đông","Xã Trung Chánh","Xã Xuân Thới Thượng","Xã Bà Điểm"]
                        property var listhuyenNhaBe: ["Tất cả","Thị trấn Nhà Bè","Xã Phước Kiển","Xã Phước Lộc","Xã Nhơn Đức","Xã Phú Xuân","Xã Long Thới","Xã Hiệp Phước"]
                        Connections{
                            target: recQuanHuyen
                            onCurrentQuanHuyenChanged:{
                                cbbPhuongXa.currentTextValue = ""
                                switch(recQuanHuyen.currentQuanHuyen){
                                case "Tất cả":cbbPhuongXa.model = "";break;
                                case "Quận 1":cbbPhuongXa.model = cbbPhuongXa.listquan1;break;
                                case "Quận 2":cbbPhuongXa.model = cbbPhuongXa.listquan2;break;
                                case "Quận 3":cbbPhuongXa.model = cbbPhuongXa.listquan3;break;
                                case "Quận 4":cbbPhuongXa.model = cbbPhuongXa.listquan4;break;
                                case "Quận 5":cbbPhuongXa.model = cbbPhuongXa.listquan5;break;
                                case "Quận 6":cbbPhuongXa.model = cbbPhuongXa.listquan6;break;
                                case "Quận 7":cbbPhuongXa.model = cbbPhuongXa.listquan7;break;
                                case "Quận 8":cbbPhuongXa.model = cbbPhuongXa.listquan8;break;
                                case "Quận 9":cbbPhuongXa.model = cbbPhuongXa.listquan9;break;
                                case "Quận 10":cbbPhuongXa.model = cbbPhuongXa.listquan10;break;
                                case "Quận 11":cbbPhuongXa.model = cbbPhuongXa.listquan11;break;
                                case "Quận 12":cbbPhuongXa.model = cbbPhuongXa.listquan12;break;
                                case "Quận Bình Chánh":cbbPhuongXa.model = cbbPhuongXa.listquanBinhChanh;break;
                                case "Quận Bình Tân":cbbPhuongXa.model = cbbPhuongXa.listquanBinhTan;break;
                                case "Quận Bình Thạnh":cbbPhuongXa.model = cbbPhuongXa.listquanBinhThanh;break;
                                case "Quận Gò Vấp":cbbPhuongXa.model = cbbPhuongXa.listquanGoVap;break;
                                case "Quận Phú Nhuận":cbbPhuongXa.model = cbbPhuongXa.listquanPhuNhuan;break;
                                case "Quận Tân Bình":cbbPhuongXa.model = cbbPhuongXa.listquanTanBinh;break;
                                case "Quận Tân Phú":cbbPhuongXa.model = cbbPhuongXa.listquanTanPhu;break;
                                case "Quận Thủ Đức":cbbPhuongXa.model = cbbPhuongXa.listquanThuDuc;break;
                                case "Huyện Cần Giờ":cbbPhuongXa.model = cbbPhuongXa.listhuyenCanGio;break;
                                case "Huyện Củ Chi":cbbPhuongXa.model = cbbPhuongXa.listhuyenCuChi;break;
                                case "Huyện Hóc Môn":cbbPhuongXa.model = cbbPhuongXa.listhuyenHocMon;break;
                                case "Huyện Nhà Bè":cbbPhuongXa.model = cbbPhuongXa.listhuyenNhaBe;break;
                                }
                            }
                        }

                        onCurrentTextValueChanged: {
                            enabled = false
                            waitingDialog.show("Please wait...")
                            if(currentTextValue !== "Tất cả"){
                                if(appManager.filterDanhSachTheoPhuong(currentTextValue)){
                                    console.log("success")
                                }
                            }else{
                                if(appManager.filterDanhSachTheoPhuong("")){
                                    console.log("success")
                                }
                            }
                            waitingDialog.close()
                            enabled = true
                        }
                    }
                }
            }
            Row{
                x:10 * dpiToPixelValue
                width:parent.width - 20 * dpiToPixelValue
                height: baseButtonHeight
                spacing: 15 * dpiToPixelValue
                Rectangle{
                    id: recTenDuong
                    height: parent.height
                    width: controlWidth * 1.5

                    Materials_TextBox {
                        id:txtTenDuong
                        placeholderText: qsTr("Tên đường")
                        width: parent.width
                        height: baseButtonHeight
                        anchors.bottom: parent.bottom
                        font.pixelSize: normalFontSize
                        onActiveFocusChanged: {
                            if (!activeFocus){
                                finishEditing()
                            }
                        }
                        Keys.onEnterPressed: {
                            finishEditing()
                        }

                        function finishEditing() {
                            if(!txtTenDuong.focus){
                                enabled = false
                                waitingDialog.show("Please wait...")
                                if(text !== ""){
                                    if(appManager.filterDanhSachTheoDuong(text)){
                                        console.log("success")
                                    }
                                }
                                waitingDialog.close()
                                enabled = true
                            }
                        }
                    }
                }
                Rectangle{
                    height: parent.height
                    width: txtNgayBatDau.width + txtNgayKetThuc.width + 10 * dpiToPixelValue
                    Menu {
                        id: menuCalendarStarDate
                        height: 200 * dpiToPixelValue
                        width: 200 * dpiToPixelValue
                        y: txtNgayBatDau.height

                        background: Rectangle{
                            color: "black"
                        }

                        contentItem: CustomCalendar {
                            onCalendarClicked: {
                                txtNgayBatDau.text = dateSel + qsTr("-") + monthSel + qsTr("-") + yearSel
                                menuCalendarStarDate.close()
                                recNgayBatDau.enabled = false
                                waitingDialog.show("Please wait...")
                                if(appManager.filterDanhSachTheoNgay(txtNgayBatDau.text.trim(),txtNgayKetThuc.text.trim())){
                                    console.log("success")
                                }
                                waitingDialog.close()
                                recNgayBatDau.enabled = true
                            }
                        }
                    }
                    Materials_TextBox {
                        id:txtNgayBatDau
                        placeholderText: qsTr("Ngày bắt đầu")
                        width: controlWidth
                        height: baseButtonHeight
                        anchors.bottom: parent.bottom
                        enabled: false
                        font.pixelSize: normalFontSize
                        text: new Date().getDate() + "-" + (new Date().getMonth() + 1) + "-" + new Date().getFullYear()
                    }
                    MouseArea{
                        anchors.fill: txtNgayBatDau
                        onClicked: {
                            menuCalendarStarDate.open()
                        }
                    }
                    Menu {
                        id: menuCalendarNgayKetThuc
                        height: 200 * dpiToPixelValue
                        width: 200 * dpiToPixelValue
                        y: txtNgayKetThuc.height

                        background: Rectangle{
                            color: "black"
                        }

                        contentItem: CustomCalendar {
                            onCalendarClicked: {
                                txtNgayKetThuc.text = dateSel + qsTr("-") + monthSel + qsTr("-") + yearSel
                                menuCalendarNgayKetThuc.close()
                                recNgayKetThuc.enabled = false
                                waitingDialog.show("Please wait...")
                                if(appManager.filterDanhSachTheoNgay(txtNgayBatDau.text.trim(),txtNgayKetThuc.text.trim())){
                                    console.log("success")
                                }
                                waitingDialog.close()
                                recNgayKetThuc.enabled = true
                            }
                        }
                    }
                    Materials_TextBox {
                        id:txtNgayKetThuc
                        placeholderText: qsTr("Ngày kết thúc")
                        width: controlWidth
                        height: baseButtonHeight
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        enabled: false
                        font.pixelSize: normalFontSize
                        text: new Date().getDate() + "-" + (new Date().getMonth() + 1) + "-" + new Date().getFullYear()
                    }
                    MouseArea{
                        anchors.fill: txtNgayKetThuc
                        onClicked: {
                            menuCalendarNgayKetThuc.open()
                        }
                    }
                }
                Rectangle{
                    height: parent.height
                    width: txtGiaMin.width + txtGiaMax.width + 10 * dpiToPixelValue
                    Materials_TextBox {
                        id:txtGiaMin
                        placeholderText: qsTr("Giá Min")
                        width: controlWidth / 2
                        height: baseButtonHeight
                        anchors.bottom: parent.bottom
                        text: "0"
                        validator: RegExpValidator{regExp:/^([0-9]+)$/}
                        font.pixelSize: normalFontSize
                        onAccepted: {
                            waitingDialog.show("Please wait...")
                            updateGia()
                            waitingDialog.close()
                        }
                    }
                    Materials_TextBox {
                        id:txtGiaMax
                        placeholderText: qsTr("Giá Max")
                        width: controlWidth / 2
                        height: baseButtonHeight
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        text: "100"
                        validator: RegExpValidator{regExp:/^([0-9]+)$/}
                        font.pixelSize: normalFontSize
                        onAccepted: {
                            waitingDialog.show("Please wait...")
                            updateGia()
                            waitingDialog.close()
                        }
                    }
                }
            }
            Rectangle{
                id:recFilter
                width: recHeader.width / 2
                height: baseButtonHeight
                property int currentIndex: 0
                color: "transparent"
                Row{
                    x: 10 * dpiToPixelValue
                    width:parent.width
                    height: parent.height
                    spacing: 10 * dpiToPixelValue
                    CustomButton{
                        buttonText: qsTr("Tất cả")
                        buttonColor: recFilter.currentIndex === 0 ? baseColor : "gray"
                        onClicked: {
                            recFilter.currentIndex = 0
                            enabled = false
                            waitingDialog.show("Please wait...")
                            if(appManager.filterDanhSachTheoLoaiBaiDang("")){
                                console.log("success")
                            }
                            waitingDialog.close()
                            enabled = true
                        }
                    }
                    CustomButton{
                        buttonText: qsTr("Chính chủ")
                        buttonColor: recFilter.currentIndex === 1 ? "#2ECC40" : "gray"
                        onClicked: {
                            recFilter.currentIndex = 1
                            enabled = false
                            waitingDialog.show("Please wait...")
                            if(appManager.filterDanhSachTheoLoaiBaiDang("chinhchu")){
                                console.log("success")
                            }
                            waitingDialog.close()
                            enabled = true
                        }

                    }
                    CustomButton{
                        buttonText: qsTr("Nhà đầu tư")
                        buttonColor: recFilter.currentIndex === 2 ? "#FF4136" : "gray"
                        onClicked: {
                            recFilter.currentIndex = 2
                            enabled = false
                            waitingDialog.show("Please wait...")
                            if(appManager.filterDanhSachTheoLoaiBaiDang("nhadautu")){
                                console.log("success")
                            }
                            waitingDialog.close()
                            enabled = true
                        }
                    }
                    CustomButton{
                        buttonText: qsTr("Môi giới")
                        buttonColor: recFilter.currentIndex === 3 ? "#001F3F" : "gray"
                        onClicked: {
                            recFilter.currentIndex = 3
                            enabled = false
                            waitingDialog.show("Please wait...")
                            if(appManager.filterDanhSachTheoLoaiBaiDang("moigioi")){
                                console.log("success")
                            }
                            waitingDialog.close()
                            enabled = true
                        }
                    }
                }
            }

        }
    }

    Rectangle{
        id:recHomeScreen
        width: parent.width - 20 * dpiToPixelValue
        height: parent.height - recHeader.height
        anchors.top:recHeader.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 10 * dpiToPixelValue
        anchors.topMargin: 10 * dpiToPixelValue + baseButtonHeight / 2
        color: "white"
        border.color: "lightgray"
        border.width: 2 * dpiToPixelValue
        radius: 5 * dpiToPixelValue
        property double widthChucNang: 60 * dpiToPixelValue
        property double widthTieuDe: 200 * dpiToPixelValue
        property double widthDiachi: 200 * dpiToPixelValue
        property double widthGia: 150 * dpiToPixelValue
        property double widthLoaibaiviet: 120 * dpiToPixelValue
        property double widthNguoiDang: 120 * dpiToPixelValue
        property double widthSoDienThoai: 100 * dpiToPixelValue
        property double widthNgayDang: 120 * dpiToPixelValue
        property double widthNoiDung: 350 * dpiToPixelValue
        property double widthQuanHuyen: 150 * dpiToPixelValue
        property double widthPhuongXa: 150 * dpiToPixelValue
        property double widthDienTichDat: 130 * dpiToPixelValue
        property double widthMatTien: 100 * dpiToPixelValue
        property double widthDuongVao: 100 * dpiToPixelValue
        property double widthPhapLy: 100 * dpiToPixelValue

        property bool displayTieuDe: true
        property bool displayDiachi: true
        property bool displayGia: true
        property bool displayLoaibaiviet: true
        property bool displayNguoiDang: true
        property bool displaySoDienThoai: true
        property bool displayNgayDang: true
        property bool displayNoiDung: true
        property bool displayQuanHuyen: false
        property bool displayPhuongXa: false
        property bool displayDienTichDat: false
        property bool displayMatTien: false
        property bool displayDuongVao: false
        property bool displayPhapLy: false

        Rectangle{
            id: recTableHeader
            width: parent.width - baseButtonHeight * 2
            height: baseButtonHeight
            radius: parent.radius
            color: "#7CCDFC"
            x: parent.width / 2 - width / 2
            y: baseButtonHeight * -0.5
                ButtonWithIcon{
                    iconSource: "qrc:/resource/Refresh_White.png"
                    height: parent.height * 4 / 5
                    width: height
                    y: parent.height / 2 - height / 2
                    anchors.left: parent.left
                    anchors.leftMargin: 10 * dpiToPixelValue
                    onClicked: {
                        enabled = false
                        waitingDialog.show("Please wait...")
                        if(appManager.refreshDanhSach()){
                            console.log("success")
                        }
                        waitingDialog.close()
                        enabled = true
                    }
                }
                ButtonWithIcon {
                    iconSource: "qrc:/resource/Setting_Icon_White.png"
                    height: parent.height * 4 / 5
                    width: height
                    y: parent.height / 2 - height / 2
                    anchors.right: parent.right
                    anchors.rightMargin: 10 * dpiToPixelValue
                    onClicked: {
                        if(menuSettingCombobox === true){
                            menuSettingCombobox.close()
                        }else{
                            menuSettingCombobox.open()
                        }
                    }
                }



            Menu {
                id: menuSettingCombobox
                y: parent.height + 2 * dpiToPixelValue
                x: parent.width - width
                height: recComboboxPopup.height
                width: recComboboxPopup.width
                modal: true
                background: Rectangle{
                    color: "transparent"
                }

                onVisibleChanged: {
                    if(visible) {
                        lvComboboxPopup.model = lmDisplayModel
                    }
                }

                contentItem: Rectangle {
                    id: recComboboxPopup
                    width: lvComboboxPopup.width
                    height: lvComboboxPopup.height + (recBackGround.radius * 2)
                    clip: true
                    color: "transparent"
                    Rectangle {
                        id: recBackGround
                        border.color: baseColor
                        radius: 5 * dpiToPixelValue
                        anchors.fill: parent
                    }

                    ListView {
                        id: lvComboboxPopup
                        width: 120 * dpiToPixelValue
                        height: lvComboboxPopup.count > 10 ? baseButtonHeight * 10 : baseButtonHeight * lvComboboxPopup.count
                        y: recBackGround.radius
                        snapMode: ListView.SnapToItem
                        delegate: Rectangle {
                            width: 120 * dpiToPixelValue
                            height: baseButtonHeight
                            color: "transparent"
                            Text{
                                id: txtComboboxNameItem
                                text: displayText
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                x: 5 * dpiToPixelValue
                                height: parent.height
                                width: parent.width - 10 * dpiToPixelValue
                                color: baseColor
                                font.pixelSize: normalFontSize
                                elide: Text.ElideRight
                            }
                            Rectangle{
                                height: parent.height / 2
                                width: height
                                y:parent.height / 2 - height / 2
                                anchors.right: parent.right
                                anchors.rightMargin: 5 * dpiToPixelValue
                                border.color: "lightgray"
                                border.width: 1
                                radius: 3 * dpiToPixelValue
                                Image {
                                    source: "qrc:/resource/Check_Green.png"
                                    anchors.fill: parent
                                    fillMode: Image.PreserveAspectFit
                                    visible: displayActive
                                }
                            }

                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                onClicked: {
                                    console.log("onclicked")
                                    displayActive = !displayActive
                                    switch(index){
                                        case 0: recHomeScreen.displayLoaibaiviet = !recHomeScreen.displayLoaibaiviet;break;
                                        case 1: recHomeScreen.displayTieuDe = !recHomeScreen.displayTieuDe;break;
                                        case 2: recHomeScreen.displayDiachi = !recHomeScreen.displayDiachi;break;
                                        case 3: recHomeScreen.displayGia = !recHomeScreen.displayGia;break;
                                        case 4: recHomeScreen.displayNguoiDang = !recHomeScreen.displayNguoiDang;break;
                                        case 5: recHomeScreen.displaySoDienThoai = !recHomeScreen.displaySoDienThoai;break;
                                        case 6: recHomeScreen.displayNgayDang = !recHomeScreen.displayNgayDang;break;
                                        case 7: recHomeScreen.displayNoiDung = !recHomeScreen.displayNoiDung;break;
                                        case 8: recHomeScreen.displayQuanHuyen = !recHomeScreen.displayQuanHuyen;break;
                                        case 9: recHomeScreen.displayPhuongXa = !recHomeScreen.displayPhuongXa;break;
                                        case 10: recHomeScreen.displayDienTichDat = !recHomeScreen.displayDienTichDat;break;
                                        case 11: recHomeScreen.displayMatTien = !recHomeScreen.displayMatTien;break;
                                        case 12: recHomeScreen.displayPhapLy = !recHomeScreen.displayPhapLy;break;
                                    }
                                }
                                onEntered: {
                                    parent.color = "#d3e0ee"
                                }
                                onExited: {
                                    parent.color = "transparent"
                                }
                            }
                        }
                    }
                }
            }



        }
        CustomScrollView{
            id:sclviewBDSList
            height: parent.height - pagingFooter.height - 20 * dpiToPixelValue
            anchors.top: recTableHeader.bottom
            anchors.topMargin: 5 * dpiToPixelValue
            anchors.bottom: pagingFooter.top
            anchors.bottomMargin: 10 * dpiToPixelValue
            anchors.left: recTableHeader.left
            anchors.right: recTableHeader.right
        }
        CustomScrollBarVertical {
            id: verticalScrollBar
            width: 12
            height: sclviewBDSList.height - 12 * dpiToPixelValue
            anchors.top: recTableHeader.bottom
            anchors.topMargin: 5 * dpiToPixelValue
            anchors.right: sclviewBDSList.right
            opacity: 0
            orientation: Qt.Vertical
            position: sclviewBDSList.visibleArea.yPosition
            pageSize: sclviewBDSList.visibleArea.heightRatio
        }

        CustomScrollBarHorizontal{
            flickable: sclviewBDSList
            handleSize: 20 * dpiToPixelValue
            colorBackScrollBar: "#ffffff"
        }
        PagingFooter{
            id:pagingFooter
            height: baseButtonHeight
            width: parent.width
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10 * dpiToPixelValue
            anchors.right: recTableHeader.right
            totalPage: appManager.pageCount
            Component.onCompleted: {
                pageIndex = appManager.currentPage
            }

            onPageIndexChanged: {
                var newPage = pageIndex + 1
                if(newPage > totalPage){
                    newPage = totalPage
                }
                if(newPage < 1){
                    newPage = 1
                }
                enabled = false
                waitingDialog.show("Please wait...")
                if(appManager.goToPage(newPage)){
                    console.log("success")
                }
                waitingDialog.close()
                enabled = true
            }
        }
    }
}

