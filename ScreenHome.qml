import QtQuick 2.5
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4

Rectangle{
    id:recMainScreen
    color: "white"
    property bool isFinish: false
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
            displayText: "Loại Bài Viết"
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
            displayActive: false
        }
        ListElement{
            displayText: "Quận Huyện"
            displayActive: true
        }
        ListElement{
            displayText: "Phường Xã"
            displayActive: true
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

    Button{
        id: btnRefresh
        height: baseButtonHeight * 2
        width: height
        anchors.left: parent.left
        anchors.leftMargin: 10 * dpiToPixelValue
        y: (baseButtonHeight * 2.5 + 10 * dpiToPixelValue) / 2 - height / 2
        background: Rectangle{
            anchors.fill: parent
            color: baseColor
            radius: 10 * dpiToPixelValue
        }
        Text {
            text: qsTr("Tải lại")
            font.pixelSize: normalFontSize
            color:"white"
            anchors.centerIn: parent
        }
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
    Rectangle{
        id:recHeader
        height: baseButtonHeight * 1.5
        width: parent.width - baseButtonHeight * 2 - 20 * dpiToPixelValue
        anchors.left:btnRefresh.right
        anchors.leftMargin: 10 * dpiToPixelValue
        anchors.top: parent.top
        visible: mainStackView.visible
        color: "white"
        Row{
            x:10 * dpiToPixelValue
            width:parent.width - 20 * dpiToPixelValue
            height: parent.height
            spacing: 15 * dpiToPixelValue
            Rectangle{
                height: parent.height
                width: 140 * dpiToPixelValue
                Text{
                    id:txtLabelNguon
                    text:"Nguồn"
                    anchors.top:parent.top
                    anchors.left: parent.left
                    font.pixelSize: normalFontSize
                }
                CustomCombobox{
                    id:cbbNguon
                    width: parent.width
                    anchors.bottom: parent.bottom
                    height: baseButtonHeight
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
                width: 120 * dpiToPixelValue
                Text{
                    id:txtLabelQuanHuyen
                    text:"Quận / Huyện"
                    anchors.top:parent.top
                    anchors.left: parent.left
                    font.pixelSize: normalFontSize
                }
                CustomCombobox{
                    id:cbbQuanHuyen
                    width: parent.width
                    anchors.bottom: parent.bottom
                    height: baseButtonHeight
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
                width: 150 * dpiToPixelValue
                property string currentPhuongXa: ""
                Text{
                    id:txtLabelPhuongXa
                    text:"Phường / Xã"
                    anchors.top:parent.top
                    anchors.left: parent.left
                    font.pixelSize: normalFontSize
                }
                CustomCombobox{
                    id:cbbPhuongXa
                    width: parent.width
                    anchors.bottom: parent.bottom
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
            Rectangle{
                id: recTenDuong
                property string currentTenDuong: ""
                height: parent.height
                width: 120 * dpiToPixelValue
                Text{
                    id:txtLabelTenDuong
                    text:"Tên đường"
                    anchors.top:parent.top
                    anchors.left: parent.left
                    font.pixelSize: normalFontSize
                }
                CustomTextBox{
                    id:cbbTenDuong
                    width: parent.width
                    anchors.bottom: parent.bottom
                    height: baseButtonHeight
                    onFocusChanged: {
                        if(!focus){
                            enabled = false
                            waitingDialog.show("Please wait...")
                            if(text !== "Tất cả"){
                                recTenDuong.currentTenDuong = text
                                if(appManager.filterDanhSachTheoDuong(text)){
                                    console.log("success")
                                }
                            }else{
                                if(appManager.filterDanhSachTheoDuong("")){
                                    console.log("success")
                                }
                            }
                            waitingDialog.close()
                            enabled = true
                        }
                    }

                    onAccepted: {
                        enabled = false
                        waitingDialog.show("Please wait...")
                        if(text !== "Tất cả"){
                            recTenDuong.currentTenDuong = text
                            if(appManager.filterDanhSachTheoDuong(text)){
                                console.log("success")
                            }
                        }else{
                            if(appManager.filterDanhSachTheoDuong("")){
                                console.log("success")
                            }
                        }
                        waitingDialog.close()
                        enabled = true
                    }
                }
            }
            Rectangle{
                height: parent.height
                width: recNgayBatDau.width + recNgayKetThuc.width + 10 * dpiToPixelValue
                Text{
                    id:txtLabelNgayDang
                    text:"Ngày Đăng"
                    anchors.top:parent.top
                    anchors.left: parent.left
                    font.pixelSize: normalFontSize
                }
                Menu {
                    id: menuCalendarStarDate
                    height: 200 * dpiToPixelValue
                    width: 200 * dpiToPixelValue
                    y: recNgayBatDau.height

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
                Rectangle{
                    id:recNgayBatDau
                    color: "transparent"
                    radius: 5 * dpiToPixelValue
                    border.color: baseColor
                    border.width: 1
                    height: baseButtonHeight
                    width: 90 * dpiToPixelValue
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    Text {
                        id:txtNgayBatDau
                        text: new Date().getDate() + "-" + (new Date().getMonth() + 1) + "-" + new Date().getFullYear()
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            menuCalendarStarDate.open()
                        }
                    }
                }
                Menu {
                    id: menuCalendarNgayKetThuc
                    height: 200 * dpiToPixelValue
                    width: 200 * dpiToPixelValue
                    y: recNgayKetThuc.height

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
                Rectangle{
                    id:recNgayKetThuc
                    color: "transparent"
                    radius: 5 * dpiToPixelValue
                    border.color: baseColor
                    border.width: 1
                    height: baseButtonHeight
                    width: 90 * dpiToPixelValue
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    Text {
                        id:txtNgayKetThuc
                        text: new Date().getDate() + "-" + (new Date().getMonth() + 1) + "-" + new Date().getFullYear()
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            menuCalendarNgayKetThuc.open()
                        }
                    }
                }
            }
            Rectangle{
                height: parent.height
                width: recGiaMin.width + recGiaMax.width + 10 * dpiToPixelValue
                Text{
                    id:txtGia
                    text:"Giá (tỷ đồng)"
                    anchors.top:parent.top
                    anchors.left: parent.left
                    font.pixelSize: normalFontSize
                }
                Rectangle{
                    id:recGiaMin
                    color: "transparent"
                    radius: 5 * dpiToPixelValue
                    border.color: baseColor
                    border.width: 1
                    height: baseButtonHeight
                    width: 40 * dpiToPixelValue
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    clip: true
                    TextInput {
                        id:txtGiaMin
                        text: "0"
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        validator: RegExpValidator{regExp:/^([0-9]+)$/}
                        onAccepted: {
                            console.log("gia min")
                            waitingDialog.show("Please wait...")
                            updateGia()
                            waitingDialog.close()
                        }
                    }
                }
                Rectangle{
                    id:recGiaMax
                    color: "transparent"
                    radius: 5 * dpiToPixelValue
                    border.color: baseColor
                    border.width: 1
                    height: baseButtonHeight
                    width: 40 * dpiToPixelValue
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    clip: true
                    TextInput {
                        id:txtGiaMax
                        text: "999"
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        validator: RegExpValidator{regExp:/^([0-9]+)$/}
                        onAccepted: {
                            console.log("gia max")
                            waitingDialog.show("Please wait...")
                            updateGia()
                            waitingDialog.close()
                        }
                    }
                }
            }
        }

    }
    Rectangle{
        id:recFilter
        width: parent.width / 2
        anchors.left:btnRefresh.right
        anchors.leftMargin: 10 * dpiToPixelValue
        height: baseButtonHeight
        anchors.top: recHeader.bottom
        anchors.topMargin: 5 * dpiToPixelValue
        property int currentIndex: 0
        Row{
            x: 10 * dpiToPixelValue
            width:parent.width
            height: parent.height
            spacing: 10 * dpiToPixelValue
            Text {
                text: qsTr("Phân loại: ")
                font.pixelSize: normalFontSize
                height: parent.height
                verticalAlignment: Text.AlignVCenter
            }
            CustomButton{
                buttonText: "Tất cả"
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
                buttonText: "Chính chủ"
                buttonColor: recFilter.currentIndex === 1 ? baseColor : "gray"
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
                buttonText: "Nhà đầu tư"
                buttonColor: recFilter.currentIndex === 2 ? baseColor : "gray"
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
                buttonText: "Môi giới"
                buttonColor: recFilter.currentIndex === 3 ? baseColor : "gray"
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
    Rectangle{
        id:recColumnDisplay
        width: cbbColumnDisplay.width
        anchors.right: parent.right
        anchors.rightMargin: 10 * dpiToPixelValue
        height: baseButtonHeight
        anchors.top: recHeader.bottom
        anchors.topMargin: 5 * dpiToPixelValue
        CustomComboboxWithCheckbox{
            id:cbbColumnDisplay
            width: 120 * dpiToPixelValue
            anchors.right: parent.right
            height: baseButtonHeight
            model: lmDisplayModel
        }
    }

    Rectangle{
        id:recHomeScreen
        width: parent.width
        height: parent.height - recHeader.height - recFilter.height
        anchors.top:recFilter.bottom
        anchors.topMargin: 5 * dpiToPixelValue
        property double widthChucNang: 60 * dpiToPixelValue
        property double widthTieuDe: 200 * dpiToPixelValue
        property double widthDiachi: 200 * dpiToPixelValue
        property double widthGia: 150 * dpiToPixelValue
        property double widthLoaibaiviet: 100 * dpiToPixelValue
        property double widthNguoiDang: 100 * dpiToPixelValue
        property double widthSoDienThoai: 100 * dpiToPixelValue
        property double widthNgayDang: 100 * dpiToPixelValue
        property double widthNoiDung: 500 * dpiToPixelValue
        property double widthQuanHuyen: 100 * dpiToPixelValue
        property double widthPhuongXa: 100 * dpiToPixelValue
        property double widthDienTichDat: 100 * dpiToPixelValue
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
            anchors.top: parent.top
            width: parent.width
            height: 1
            color: baseColor
        }
        CustomScrollView{
            id:sclviewBDSList
            width: parent.width
            height: parent.height - rowPaging.height - 20 * dpiToPixelValue
        }
        CustomScrollBarVertical {
            id: verticalScrollBar
            width: 12; height: sclviewBDSList.height-12
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

        Row{
            id:rowPaging
            spacing: 10 * dpiToPixelValue
            height: baseButtonHeight * 80 / 100
            x : parent.width / 2 - implicitWidth / 2
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10 * dpiToPixelValue
            property int pageIndex: 0
            Rectangle{
                height: parent.height
                width: height
                Image {
                    source: "qrc:/resource/PrevPrev_Blue.png"
                    anchors.fill: parent
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        var newPage = appManager.currentPage - 5
                        if(newPage < 0){
                            newPage = 0
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
            Rectangle{
                height: parent.height
                width: height
                Image {
                    source: "qrc:/resource/Prev_Blue.png"
                    anchors.fill: parent
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        var newPage = appManager.currentPage - 1
                        if(newPage < 0){
                            newPage = 0
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

            CustomTextBox{
                height: parent.height
                width: height
                text: appManager.currentPage
                validator: RegExpValidator{regExp: /[0-9]+/}
                onEditingFinished: {
                    var newPage = text * 1
                    if(newPage > appManager.pageCount){
                        newPage = appManager.pageCount
                    }
                    if(newPage < 0){
                        newPage = 0
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
            Rectangle{
                height: parent.height
                width: height
                Image {
                    source: "qrc:/resource/Next_Blue.png"
                    anchors.fill: parent
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        var newPage = appManager.currentPage + 1
                        if(newPage > appManager.pageCount){
                            newPage = appManager.pageCount
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
            Rectangle{
                height: parent.height
                width: height
                Image {
                    source: "qrc:/resource/NextNext_Blue.png"
                    anchors.fill: parent
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        var newPage = appManager.currentPage + 5
                        if(newPage > appManager.pageCount){
                            newPage = appManager.pageCount
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
    }
}

