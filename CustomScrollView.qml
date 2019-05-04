import QtQuick 2.0
import QtQuick.Controls 2.0

Flickable{
    id:flickableBDSList
    clip: true
    boundsBehavior: Flickable.StopAtBounds
    contentHeight: lvBDSList.contentHeight + baseButtonHeight * 2
    contentWidth: rowHeaderList.implicitWidth + 20 * dpiToPixelValue
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

    Row{
        id:rowHeaderList
        spacing: 0
        height: baseButtonHeight
        CustomListResizableHeader{
            id: txtChucnang
            width: recHomeScreen.widthChucNang
            clip: true
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
            height: isExpanding ? (baseButtonHeight > maxHeight ? baseButtonHeight : maxHeight) : baseButtonHeight
            property bool isExpanding: lvBDSList.selectedItem === index ? true : false
            property double maxHeight: txtTieude.height > txtNoiDung.height ? txtTieude.height : txtNoiDung.height
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    lvBDSList.selectedItem = index
                }
            }
            Row{
                id:itemRow
                spacing: 0
                height: baseButtonHeight
                Rectangle{
                    id:recChucNang
                    width: recHomeScreen.widthChucNang
                    height: recItem.height
                    color: "transparent"
                    Image {
                        source: "qrc:/resource/Website_Black.png"
                        height: baseButtonHeight / 2
                        width: height
                        fillMode: Image.PreserveAspectFit
                        x:parent.width / 2 + 5 * dpiToPixelValue
                        y:parent.height / 2 - height / 2
                        anchors.centerIn: parent
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                //                                Qt.openUrlExternally("http://www.stackoverflow.com/");
                                console.log(modelData.pageurl)
                                appManager.viewPage(index)
                                Qt.openUrlExternally(modelData.pageurl)
                            }
                        }
                    }

                    Rectangle{
                        color: baseColor
                        height: recItem.height
                        width: 1
                        anchors.right: parent.right
                    }
                }

                Rectangle{
                    id:rectieude
                    width: recHomeScreen.widthTieuDe
                    height: txtTieude.height
                    Text {
                        id: txtTieude
                        text: modelData.tieude
                        color: modelData.userviewed ? "gray" : "black"
                        font.pixelSize: normalFontSize
                        width: recHomeScreen.widthTieuDe
                        height: isExpanding ? implicitHeight : baseButtonHeight
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                        clip: true
                        wrapMode: isExpanding ? Text.WrapAtWordBoundaryOrAnywhere : Text.NoWrap
                        visible: recHomeScreen.displayTieuDe

                    }
                    Rectangle{
                        color: baseColor
                        height: recItem.height
                        width: 1
                        anchors.right: parent.right
                    }
                }

                Rectangle{
                    width: recHomeScreen.widthDiachi
                    height: parent.height
                    id:recdiachi
                    TextArea {
                        id: txtDiachi
                        text: modelData.diachi
                        color: modelData.userviewed ? "gray" : "black"
                        font.pixelSize: normalFontSize
                        width: recHomeScreen.widthDiachi
                        height: parent.height
                        verticalAlignment: Text.AlignVCenter
                        clip: true
                        visible: recHomeScreen.displayDiachi
                        selectByMouse: true
                        readOnly: true
                    }
                    Rectangle{
                        color: baseColor
                        height: recItem.height
                        width: 1
                        anchors.right: parent.right
                    }
                }

                Rectangle{
                    width: recHomeScreen.widthGia
                    height: parent.height
                    id:recgia
                    Text {
                        id: txtGia
                        text: modelData.gia
                        color: modelData.userviewed ? "gray" : "black"
                        font.pixelSize: normalFontSize
                        width: recHomeScreen.widthGia
                        height: parent.height
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        clip: true
                        visible: recHomeScreen.displayGia
                    }
                    Rectangle{
                        color: baseColor
                        height: recItem.height
                        width: 1
                        anchors.right: parent.right
                    }
                }

                Rectangle{
                    width: recHomeScreen.widthLoaibaiviet
                    height: parent.height
                    id:recloaibaidang
                    Text {
                        id: txtLoaibaiviet
                        text: modelData.loaibaidang
                        color: modelData.userviewed ? "gray" : "black"
                        font.pixelSize: normalFontSize
                        width: recHomeScreen.widthLoaibaiviet
                        horizontalAlignment: Text.AlignHCenter
                        height: parent.height
                        verticalAlignment: Text.AlignVCenter
                        visible: recHomeScreen.displayLoaibaiviet
                        clip: true
                    }
                    Rectangle{
                        color: baseColor
                        height: recItem.height
                        width: 1
                        anchors.right: parent.right
                    }
                }
                Rectangle{
                    width: recHomeScreen.widthNguoiDang
                    height: parent.height
                    id:recten
                    Text {
                        id: txtNguoiDang
                        text: modelData.ten
                        color: modelData.userviewed ? "gray" : "black"
                        font.pixelSize: normalFontSize
                        width: recHomeScreen.widthNguoiDang
                        height: parent.height
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        clip: true
                        visible: recHomeScreen.displayNguoiDang
                        elide: Text.ElideRight

                    }
                    Rectangle{
                        color: baseColor
                        height: recItem.height
                        width: 1
                        anchors.right: parent.right
                    }
                }
                Rectangle{
                    width: recHomeScreen.widthSoDienThoai
                    height: parent.height
                    id:recsodienthoai
                    TextArea {
                        id: txtSodienThoai
                        text: modelData.sodienthoai
                        color: modelData.userviewed ? "gray" : "black"
                        font.pixelSize: normalFontSize
                        width: recHomeScreen.widthSoDienThoai
                        horizontalAlignment: Text.AlignHCenter
                        height: parent.height
                        verticalAlignment: Text.AlignVCenter
                        visible: recHomeScreen.displaySoDienThoai
                        clip: true
                        selectByMouse: true
                        readOnly: true
                    }
                    Rectangle{
                        color: baseColor
                        height: recItem.height
                        width: 1
                        anchors.right: parent.right
                    }
                }
                Rectangle{
                    width: recHomeScreen.widthNgayDang
                    height: parent.height
                    id:recngaydang
                    Text {
                        id: txtNgayDang
                        text: modelData.ngaydang
                        color: modelData.userviewed ? "gray" : "black"
                        font.pixelSize: normalFontSize
                        width: recHomeScreen.widthNgayDang
                        horizontalAlignment: Text.AlignHCenter
                        height: parent.height
                        verticalAlignment: Text.AlignVCenter
                        visible: recHomeScreen.displayNgayDang
                        clip: true

                    }
                    Rectangle{
                        color: baseColor
                        height: recItem.height
                        width: 1
                        anchors.right: parent.right
                    }
                }
                Rectangle{
                    width: recHomeScreen.widthNoiDung
                    height: txtNoiDung.height
                    id:recnoidung
                    TextArea {
                        id: txtNoiDung
                        text: modelData.noidung
                        color: modelData.userviewed ? "gray" : "black"
                        font.pixelSize: normalFontSize
                        width: recHomeScreen.widthNoiDung
                        horizontalAlignment: Text.AlignLeft
                        height: isExpanding ? implicitHeight : baseButtonHeight
                        verticalAlignment: Text.AlignTop
                        visible: recHomeScreen.displayNoiDung
                        clip: true
                        wrapMode: isExpanding ? Text.WrapAtWordBoundaryOrAnywhere : Text.NoWrap
                        selectByMouse: true
                        readOnly: true

                    }
                    Rectangle{
                        color: baseColor
                        height: recItem.height
                        width: 1
                        anchors.right: parent.right
                    }
                }
                Rectangle{
                    width: recHomeScreen.widthQuanHuyen
                    height: txtNoiDung.height
                    id:recquanhuyen
                    Text {
                        id: txtQuanHuyen
                        text: modelData.quanhuyen
                        color: modelData.userviewed ? "gray" : "black"
                        font.pixelSize: normalFontSize
                        width: recHomeScreen.widthQuanHuyen
                        horizontalAlignment: Text.AlignHCenter
                        height: parent.height
                        verticalAlignment: Text.AlignVCenter
                        visible: recHomeScreen.displayQuanHuyen
                        clip: true

                    }
                    Rectangle{
                        color: baseColor
                        height: recItem.height
                        width: 1
                        anchors.right: parent.right
                    }
                }
                Rectangle{
                    width: recHomeScreen.widthPhuongXa
                    height: txtNoiDung.height
                    id:recphuongxa
                    Text {
                        id: txtPhuongXa
                        text: modelData.phuongxa
                        color: modelData.userviewed ? "gray" : "black"
                        font.pixelSize: normalFontSize
                        width: recHomeScreen.widthPhuongXa
                        horizontalAlignment: Text.AlignHCenter
                        height: parent.height
                        verticalAlignment: Text.AlignVCenter
                        visible: recHomeScreen.displayPhuongXa
                        clip: true

                    }
                    Rectangle{
                        color: baseColor
                        height: recItem.height
                        width: 1
                        anchors.right: parent.right
                    }
                }
                Rectangle{
                    width: recHomeScreen.widthDienTichDat
                    height: txtNoiDung.height
                    id:recdientichdat
                    Text {
                        id: txtDienTichDat
                        text: modelData.dientichdat
                        color: modelData.userviewed ? "gray" : "black"
                        font.pixelSize: normalFontSize
                        width: recHomeScreen.widthDienTichDat
                        horizontalAlignment: Text.AlignHCenter
                        height: parent.height
                        verticalAlignment: Text.AlignVCenter
                        visible: recHomeScreen.displayDienTichDat
                        clip: true

                    }
                    Rectangle{
                        color: baseColor
                        height: recItem.height
                        width: 1
                        anchors.right: parent.right
                    }
                }
                Rectangle{
                    width: recHomeScreen.widthMatTien
                    height: txtNoiDung.height
                    id:recmattien
                    Text {
                        id: txtMatTien
                        text: modelData.mattien
                        color: modelData.userviewed ? "gray" : "black"
                        font.pixelSize: normalFontSize
                        width: recHomeScreen.widthMatTien
                        horizontalAlignment: Text.AlignHCenter
                        height: parent.height
                        verticalAlignment: Text.AlignVCenter
                        visible: recHomeScreen.displayMatTien
                        clip: true

                    }
                    Rectangle{
                        color: baseColor
                        height: recItem.height
                        width: 1
                        anchors.right: parent.right
                    }
                }
                Rectangle{
                    width: recHomeScreen.widthDuongVao
                    height: txtNoiDung.height
                    id:recduongvao
                    Text {
                        id: txtDuongVao
                        text: modelData.duongvao
                        color: modelData.userviewed ? "gray" : "black"
                        font.pixelSize: normalFontSize
                        width: recHomeScreen.widthDuongVao
                        horizontalAlignment: Text.AlignHCenter
                        height: parent.height
                        verticalAlignment: Text.AlignVCenter
                        visible: recHomeScreen.displayDuongVao
                        clip: true

                    }
                    Rectangle{
                        color: baseColor
                        height: recItem.height
                        width: 1
                        anchors.right: parent.right
                    }
                }
                Rectangle{
                    width: recHomeScreen.widthPhapLy
                    height: txtNoiDung.height
                    id:recphaply
                    Text {
                        id: txtPhapLy
                        text: modelData.phaply
                        color: modelData.userviewed ? "gray" : "black"
                        font.pixelSize: normalFontSize
                        width: recHomeScreen.widthPhapLy
                        horizontalAlignment: Text.AlignHCenter
                        height: parent.height
                        verticalAlignment: Text.AlignVCenter
                        visible: recHomeScreen.displayPhapLy
                        clip: true

                    }
                    Rectangle{
                        color: baseColor
                        height: recItem.height
                        width: 1
                        anchors.right: parent.right
                    }
                }
            }
            Rectangle{
                anchors.bottom: parent.bottom
                width: recItem.width
                height: 1
                color: baseColor
            }
        }
    }
}
