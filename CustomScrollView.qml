import QtQuick 2.0
import QtQuick.Controls 2.0

Flickable{
    id:flickableBDSList
    clip: true
    boundsBehavior: Flickable.StopAtBounds
    contentHeight: lvBDSList.contentHeight + baseButtonHeight * 2
    contentWidth: rowHeaderList.implicitWidth + 50 * dpiToPixelValue
    states: State {
        name: "ShowBars"
        when: flickableBDSList.movingVertically || flickableBDSList.movingHorizontally
        PropertyChanges { target: verticalScrollBar; opacity: 1 }
//        PropertyChanges { target: horizontalScrollBar; opacity: 1 }
    }
    flickableDirection: Flickable.VerticalFlick
    transitions: Transition {
        NumberAnimation { properties: "opacity"; duration: 1000 }
    }
    property bool displayNoiDung: false
    property bool displayQuanHuyen: false
    property bool displayPhuongXa: false
    property bool displayDienTichDat: false
    property bool displayMatTien: false
    property bool displayDuongVao: false
    property bool displayPhapLy: false
    property string strOwner : "Chính chủ"
    property string strBroker : "môi giới"

    Row{
        id:rowHeaderList
        spacing: 0
        height: baseButtonHeight
        CustomListResizableHeader{
            id: txtLoaibaivietheader
            text: "Loại bài viết"
            width: recHomeScreen.widthLoaibaiviet
            clip: true
            visible: recHomeScreen.displayLoaibaiviet
            onSeperatorMoved: {
                if(movement > 0){
                    recHomeScreen.widthLoaibaiviet += movement
                }else{
                    if(recHomeScreen.widthLoaibaiviet > minimumWidth){
                        var newWidth = recHomeScreen.widthLoaibaiviet + movement
                        if(newWidth < minimumWidth){
                            recHomeScreen.widthLoaibaiviet = minimumWidth
                        }else{
                            recHomeScreen.widthLoaibaiviet += movement
                        }
                    }
                }
            }
        }

        CustomListResizableHeader{
            id: txtTieudeheader
            text: "Tiêu đề"
            width: recHomeScreen.widthTieuDe
            clip: true
            visible: recHomeScreen.displayTieuDe
            onSeperatorMoved: {
                if(movement > 0){
                    recHomeScreen.widthTieuDe += movement
                }else{
                    if(recHomeScreen.widthTieuDe > minimumWidth){
                        var newWidth = recHomeScreen.widthTieuDe + movement
                        if(newWidth < minimumWidth){
                            recHomeScreen.widthTieuDe = minimumWidth
                        }else{
                            recHomeScreen.widthTieuDe += movement
                        }
                    }
                }
            }
        }
        CustomListResizableHeader{
            id: txtDiachiheader
            text: "Địa chỉ"
            width: recHomeScreen.widthDiachi
            clip: true
            visible: recHomeScreen.displayDiachi
            onSeperatorMoved: {
                if(movement > 0){
                    recHomeScreen.widthDiachi += movement
                }else{
                    if(recHomeScreen.widthDiachi > minimumWidth){
                        var newWidth = recHomeScreen.widthDiachi + movement
                        if(newWidth < minimumWidth){
                            recHomeScreen.widthDiachi = minimumWidth
                        }else{
                            recHomeScreen.widthDiachi += movement
                        }
                    }
                }
            }
        }
        CustomListResizableHeader{
            id: txtGiaheader
            text: "Giá"
            width: recHomeScreen.widthGia
            clip: true
            visible: recHomeScreen.displayGia
            onSeperatorMoved: {
                if(movement > 0){
                    recHomeScreen.widthGia += movement
                }else{
                    if(recHomeScreen.widthGia > minimumWidth){
                        var newWidth = recHomeScreen.widthGia + movement
                        if(newWidth < minimumWidth){
                            recHomeScreen.widthGia = minimumWidth
                        }else{
                            recHomeScreen.widthGia += movement
                        }
                    }
                }
            }
        }
        CustomListResizableHeader{
            id: txtNguoiDangheader
            text: "Người đăng"
            width: recHomeScreen.widthNguoiDang
            clip: true
            visible: recHomeScreen.displayNguoiDang
            onSeperatorMoved: {
                if(movement > 0){
                    recHomeScreen.widthNguoiDang += movement
                }else{
                    if(recHomeScreen.widthNguoiDang > minimumWidth){
                        var newWidth = recHomeScreen.widthNguoiDang + movement
                        if(newWidth < minimumWidth){
                            recHomeScreen.widthNguoiDang = minimumWidth
                        }else{
                            recHomeScreen.widthNguoiDang += movement
                        }
                    }
                }
            }
        }
        CustomListResizableHeader{
            id: txtSodienThoaiheader
            text: "SDT"
            width: recHomeScreen.widthSoDienThoai
            clip: true
            visible: recHomeScreen.displaySoDienThoai
            onSeperatorMoved: {
                if(movement > 0){
                    recHomeScreen.widthSoDienThoai += movement
                }else{
                    if(recHomeScreen.widthSoDienThoai > minimumWidth){
                        var newWidth = recHomeScreen.widthSoDienThoai + movement
                        if(newWidth < minimumWidth){
                            recHomeScreen.widthSoDienThoai = minimumWidth
                        }else{
                            recHomeScreen.widthSoDienThoai += movement
                        }
                    }
                }
            }
        }
        CustomListResizableHeader{
            id: txtNgayDangheader
            text: "Ngày đăng"
            width: recHomeScreen.widthNgayDang
            clip: true
            visible: recHomeScreen.displayNgayDang
            onSeperatorMoved: {
                if(movement > 0){
                    recHomeScreen.widthNgayDang += movement
                }else{
                    if(recHomeScreen.widthNgayDang > minimumWidth){
                        var newWidth = recHomeScreen.widthNgayDang + movement
                        if(newWidth < minimumWidth){
                            recHomeScreen.widthNgayDang = minimumWidth
                        }else{
                            recHomeScreen.widthNgayDang += movement
                        }
                    }
                }
            }
        }
        CustomListResizableHeader{
            id: txtNoiDungheader
            text: "Nội dung"
            width: recHomeScreen.widthNoiDung
            clip: true
            visible: recHomeScreen.displayNoiDung
            onSeperatorMoved: {
                if(movement > 0){
                    recHomeScreen.widthNoiDung += movement
                }else{
                    if(recHomeScreen.widthNoiDung > minimumWidth){
                        var newWidth = recHomeScreen.widthNoiDung + movement
                        if(newWidth < minimumWidth){
                            recHomeScreen.widthNoiDung = minimumWidth
                        }else{
                            recHomeScreen.widthNoiDung += movement
                        }
                    }
                }
            }
        }
        CustomListResizableHeader{
            id: txtQuanHuyenheader
            text: "Quận / Huyện"
            width: recHomeScreen.widthQuanHuyen
            clip: true
            visible: recHomeScreen.displayQuanHuyen
            onSeperatorMoved: {
                if(movement > 0){
                    recHomeScreen.widthQuanHuyen += movement
                }else{
                    if(recHomeScreen.widthQuanHuyen > minimumWidth){
                        var newWidth = recHomeScreen.widthQuanHuyen + movement
                        if(newWidth < minimumWidth){
                            recHomeScreen.widthQuanHuyen = minimumWidth
                        }else{
                            recHomeScreen.widthQuanHuyen += movement
                        }
                    }
                }
            }
        }
        CustomListResizableHeader{
            id: txtPhuongXaheader
            text: "Phường / Xã"
            width: recHomeScreen.widthPhuongXa
            clip: true
            visible: recHomeScreen.displayPhuongXa
            onSeperatorMoved: {
                if(movement > 0){
                    recHomeScreen.widthPhuongXa += movement
                }else{
                    if(recHomeScreen.widthPhuongXa > minimumWidth){
                        var newWidth = recHomeScreen.widthPhuongXa + movement
                        if(newWidth < minimumWidth){
                            recHomeScreen.widthPhuongXa = minimumWidth
                        }else{
                            recHomeScreen.widthPhuongXa += movement
                        }
                    }
                }
            }
        }
        CustomListResizableHeader{
            id: txtDienTichDatheader
            text: "Diện tích đất"
            width: recHomeScreen.widthDienTichDat
            clip: true
            visible: recHomeScreen.displayDienTichDat
            onSeperatorMoved: {
                if(movement > 0){
                    recHomeScreen.widthDienTichDat += movement
                }else{
                    if(recHomeScreen.widthDienTichDat > minimumWidth){
                        var newWidth = recHomeScreen.widthDienTichDat + movement
                        if(newWidth < minimumWidth){
                            recHomeScreen.widthDienTichDat = minimumWidth
                        }else{
                            recHomeScreen.widthDienTichDat += movement
                        }
                    }
                }
            }
        }
        CustomListResizableHeader{
            id: txtMatTienheader
            text: "Mặt tiền"
            width: recHomeScreen.widthMatTien
            clip: true
            visible: recHomeScreen.displayMatTien
            onSeperatorMoved: {
                if(movement > 0){
                    recHomeScreen.widthMatTien += movement
                }else{
                    if(recHomeScreen.widthMatTien > minimumWidth){
                        var newWidth = recHomeScreen.widthMatTien + movement
                        if(newWidth < minimumWidth){
                            recHomeScreen.widthMatTien = minimumWidth
                        }else{
                            recHomeScreen.widthMatTien += movement
                        }
                    }
                }
            }
        }
        CustomListResizableHeader{
            id: txtDuongVaoheader
            text: "Đường Vào"
            width: recHomeScreen.widthDuongVao
            clip: true
            visible: recHomeScreen.displayDuongVao
            onSeperatorMoved: {
                if(movement > 0){
                    recHomeScreen.widthDuongVao += movement
                }else{
                    if(recHomeScreen.widthDuongVao > minimumWidth){
                        var newWidth = recHomeScreen.widthDuongVao + movement
                        if(newWidth < minimumWidth){
                            recHomeScreen.widthDuongVao = minimumWidth
                        }else{
                            recHomeScreen.widthDuongVao += movement
                        }
                    }
                }
            }
        }
        CustomListResizableHeader{
            id: txtPhapLyheader
            text: "Pháp Lý"
            width: recHomeScreen.widthPhapLy
            clip: true
            visible: recHomeScreen.displayPhapLy
            onSeperatorMoved: {
                if(movement > 0){
                    recHomeScreen.widthPhapLy += movement
                }else{
                    if(recHomeScreen.widthPhapLy > minimumWidth){
                        var newWidth = recHomeScreen.widthPhapLy + movement
                        if(newWidth < minimumWidth){
                            recHomeScreen.widthPhapLy = minimumWidth
                        }else{
                            recHomeScreen.widthPhapLy += movement
                        }
                    }
                }
            }
        }
    }
    Rectangle{
        anchors.bottom: rowHeaderList.bottom
        height: 2 * dpiToPixelValue
        width: flickableBDSList.contentWidth
        color: "lightgray"
    }
    ListView{
        id:lvBDSList
        clip: true
        width: parent.width
        height: parent.height - rowHeaderList.height
        y: rowHeaderList.height
        snapMode: ListView.SnapToItem
        interactive: false
        model: appManager.listBDS
        property int selectedItem: -1
        delegate: Rectangle{
            id:recItem
            width: itemRow.implicitWidth//parent.width
            height: activeFocus ? (baseButtonHeight > maxHeight ? baseButtonHeight : maxHeight) : baseButtonHeight
            property double maxHeight: cellTieuDe.height > cellNoiDung.height ? cellTieuDe.height : cellNoiDung.height

            Row{
                id:itemRow
                spacing: 0
                height: baseButtonHeight

                CustomViewIcon{
                    id: cellUserIcon
                    width: recHomeScreen.widthLoaibaiviet
                    height: recItem.height
                    sourceIcon: modelData.loaibaidang === strOwner ? "qrc:/resource/OwnerIcon.png" :
                                                                modelData.loaibaidang === strBroker ? "qrc:/resource/BrokerIcon.png" :
                                                                                                      "qrc:/resource/InvestorIcon.png"

                    showLine: true
                    heightRec: height
                }

                CustomTableCell{
                    id:cellTieuDe
                    width: recHomeScreen.widthTieuDe
                    height: !expanded ? parent.height : textHeight
                    text: modelData.tieude
                    viewed: modelData.userviewed
                    visible: recHomeScreen.displayTieuDe
                    expanded: recItem.activeFocus
                    horizontalAlignment: Text.AlignLeft
                }
                CustomTableCell{
                    width: recHomeScreen.widthDiachi
                    height: !expanded ? parent.height : textHeight
                    text: modelData.diachi
                    viewed: modelData.userviewed
                    visible: recHomeScreen.displayDiachi
                    expanded: recItem.activeFocus
                    horizontalAlignment: Text.AlignLeft
                }
                CustomTableCell{
                    width: recHomeScreen.widthGia
                    height: parent.height
                    text: modelData.gia
                    viewed: modelData.userviewed
                    visible: recHomeScreen.displayGia
                    horizontalAlignment: Text.AlignLeft
                }
                CustomTableCell{
                    width: recHomeScreen.widthNguoiDang
                    height: parent.height
                    text: modelData.ten
                    viewed: modelData.userviewed
                    visible: recHomeScreen.displayNguoiDang
                    horizontalAlignment: Text.AlignHCenter
                }

                CustomTableCell{
                    width: recHomeScreen.widthSoDienThoai
                    height: parent.height
                    text: modelData.sodienthoai
                    viewed: modelData.userviewed
                    visible: recHomeScreen.displaySoDienThoai
                    horizontalAlignment: Text.AlignHCenter
                }

                CustomTableCell{
                    width: recHomeScreen.widthNgayDang
                    height: parent.height
                    text: modelData.ngaydang
                    viewed: modelData.userviewed
                    visible: recHomeScreen.displayNgayDang
                    horizontalAlignment: Text.AlignHCenter
                }

                CustomTableCell{
                    id:cellNoiDung
                    width: recHomeScreen.widthNoiDung
                    height: !expanded ? parent.height : textHeight
                    text: modelData.noidung
                    viewed: modelData.userviewed
                    visible: recHomeScreen.displayNoiDung
                    horizontalAlignment: Text.AlignLeft
                    expanded: recItem.activeFocus
                }

                CustomTableCell{
                    width: recHomeScreen.widthQuanHuyen
                    height: parent.height
                    text: modelData.quanhuyen
                    viewed: modelData.userviewed
                    visible: recHomeScreen.displayQuanHuyen
                    horizontalAlignment: Text.AlignLeft
                }

                CustomTableCell{
                    width: recHomeScreen.widthPhuongXa
                    height: parent.height
                    text: modelData.phuongxa
                    viewed: modelData.userviewed
                    visible: recHomeScreen.displayPhuongXa
                    horizontalAlignment: Text.AlignLeft
                }

                CustomTableCell{
                    width: recHomeScreen.widthDienTichDat
                    height: parent.height
                    text: modelData.dientichdat
                    viewed: modelData.userviewed
                    visible: recHomeScreen.displayDienTichDat
                    horizontalAlignment: Text.AlignHCenter
                }

                CustomTableCell{
                    width: recHomeScreen.widthMatTien
                    height: parent.height
                    text: modelData.mattien
                    viewed: modelData.userviewed
                    visible: recHomeScreen.displayMatTien
                    horizontalAlignment: Text.AlignHCenter
                }

                CustomTableCell{
                    width: recHomeScreen.widthDuongVao
                    height: parent.height
                    text: modelData.duongvao
                    viewed: modelData.userviewed
                    visible: recHomeScreen.displayDuongVao
                    horizontalAlignment: Text.AlignHCenter
                }

                CustomTableCell{
                    width: recHomeScreen.widthPhapLy
                    height: parent.height
                    text: modelData.phaply
                    viewed: modelData.userviewed
                    visible: recHomeScreen.displayPhapLy
                    horizontalAlignment: Text.AlignLeft
                }

                Rectangle{
                    id:recWebIcon
                    width: recHomeScreen.widthChucNang
                    height: recItem.height
                    color: "transparent"
                    Rectangle{
                        color: baseColor
                        height: recItem.height
                        width: 1
                        anchors.left: parent.left
                    }

                    Image {
                        opacity: modelData.userviewed ? 0.5 : 1
                        source: modelData.userviewed ? "qrc:/resource/Website_Black.png" : "qrc:/resource/Website_blu.png"
                        height: baseButtonHeight / 2
                        width: height
                        fillMode: Image.PreserveAspectFit
                        x:parent.width / 2 + 5 * dpiToPixelValue
                        y:parent.height / 2 - height / 2
                        anchors.centerIn: parent
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            console.log(modelData.pageurl)
                            appManager.viewPage(index)
                            Qt.openUrlExternally(modelData.pageurl)
                        }
                    }
                }
            }
            Rectangle{
                anchors.bottom: recItem.bottom
                height: 2 * dpiToPixelValue
                width: flickableBDSList.contentWidth
                color: "lightgray"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    recItem.forceActiveFocus()
                }
            }
        }
    }
}
