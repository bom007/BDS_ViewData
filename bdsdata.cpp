#include "bdsdata.h"
#include <QDebug>
BDSData::BDSData(QObject *parent) : QObject(parent)
{

}
QString BDSData::getId()
{
    return m_id;
}
QString BDSData::getHinhanh()
{
    return m_hinhanh;
}
QString BDSData::getTieude()
{
    return m_tieude;
}
QString BDSData::getNoidung()
{
    return m_noidung;
}
QString BDSData::getPhuongxa()
{
    return m_phuongxa;
}
QString BDSData::getQuanhuyen()
{
    return m_quanhuyen;
}
QString BDSData::getTinhthanh()
{
    return m_tinhthanh;
}
QString BDSData::getGia()
{
    long long tempGia = m_gia.toLongLong();
    QString newGia;
    int nTy = tempGia / 1000000000;
    if(nTy >= 1){
        int nTrieu = (tempGia - (long long)nTy * 1000000000) / 1000000;
        if(nTrieu == 0){
            newGia = QString::number(nTy) + " tỷ ";
        }else{
            newGia = QString::number(nTy) + " tỷ " + QString::number(nTrieu) + " triệu";
        }

    }else{
        int nTrieu = tempGia / 1000000;
        if(nTrieu == 0){
            newGia = QString::fromUtf8("Thỏa thuận");
        }else{
            newGia = QString::number(nTrieu) + " triệu";
        }

    }
    return newGia;
}
QString BDSData::getDientichdat()
{
    return m_dientichdat;
}
QString BDSData::getDientichsudung()
{
    return m_dientichsudung;
}
QString BDSData::getDientichxaydung()
{
    return m_dientichxaydung;
}
QString BDSData::getDiachi()
{
    return m_diachi;
}
QString BDSData::getTen()
{
    return m_ten;
}
QString BDSData::getSodienthoai()
{
    return m_sodienthoai;
}
QString BDSData::getEmail()
{
    return m_email;
}
QString BDSData::getNgaydang()
{
    return m_ngaydang;
}
QString BDSData::getHuongnha()
{
    return m_huongnha;
}
QString BDSData::getHuongbancong()
{
    return m_huongbancong;
}
QString BDSData::getSotang()
{
    return m_sotang;
}
QString BDSData::getSophongngu()
{
    return m_sophongngu;
}
QString BDSData::getSotoilet()
{
    return m_sotoilet;
}
QString BDSData::getNoithat()
{
    return m_noithat;
}
QString BDSData::getMattien()
{
    return m_mattien;
}
QString BDSData::getDuongvao()
{
    return m_duongvao;
}
QString BDSData::getTongsophong()
{
    return m_tongsophong;
}
QString BDSData::getPhaply()
{
    return m_phaply;
}
QString BDSData::getTenduan()
{
    return m_tenduan;
}
QString BDSData::getTenduong()
{
    return m_tenduong;
}
QString BDSData::getPageurl()
{
    return m_pageurl;
}
QString BDSData::getLoaibaidang()
{
    if(m_loaibaidang == "moigioi"){
        return "môi giới";
    }else if(m_loaibaidang == "chinhchu"){
        return "Chính chủ";
    }else if(m_loaibaidang == "nhadautu"){
        return "Nhà đầu tư";
    }
    return m_loaibaidang;
}
QString BDSData::getCreate_At()
{
    return m_create_at;
}
QString BDSData::getUpdated_At()
{
    return m_updated_at;
}

bool BDSData::getViewed()
{
    return m_viewed;
}

void BDSData::setId(QString newValue)
{
    m_id= newValue;
}
void BDSData::setHinhanh(QString newValue)
{
    m_hinhanh= newValue;
}
void BDSData::setTieude(QString newValue)
{
    m_tieude= newValue;
}
void BDSData::setNoidung(QString newValue)
{
    if(m_noidung != newValue){
        m_noidung= newValue;
        emit noidungChanged();
    }

}
void BDSData::setPhuongxa(QString newValue)
{
    m_phuongxa= newValue;
}
void BDSData::setQuanhuyen(QString newValue)
{
    m_quanhuyen= newValue;
}
void BDSData::setTinhthanh(QString newValue)
{
    m_tinhthanh= newValue;
}
void BDSData::setGia(QString newValue)
{
    m_gia= newValue;
}
void BDSData::setDientichdat(QString newValue)
{
    m_dientichdat= newValue;
}
void BDSData::setDientichsudung(QString newValue)
{
    m_dientichsudung= newValue;
}
void BDSData::setDientichxaydung(QString newValue)
{
    m_dientichxaydung= newValue;
}
void BDSData::setDiachi(QString newValue)
{
    m_diachi= newValue;
}
void BDSData::setTen(QString newValue)
{
    m_ten= newValue;
}
void BDSData::setSodienthoai(QString newValue)
{
    m_sodienthoai= newValue;
}
void BDSData::setEmail(QString newValue)
{
    m_email= newValue;
}
void BDSData::setNgaydang(QString newValue)
{
    m_ngaydang= newValue;
}
void BDSData::setHuongnha(QString newValue)
{
    m_huongnha= newValue;
}
void BDSData::setHuongbancong(QString newValue)
{
    m_huongbancong= newValue;
}
void BDSData::setSotang(QString newValue)
{
    m_sotang= newValue;
}
void BDSData::setSophongngu(QString newValue)
{
    m_sophongngu= newValue;
}
void BDSData::setSotoilet(QString newValue)
{
    m_sotoilet= newValue;
}
void BDSData::setNoithat(QString newValue)
{
    m_noithat= newValue;
}
void BDSData::setMattien(QString newValue)
{
    m_mattien= newValue;
}
void BDSData::setDuongvao(QString newValue)
{
    m_duongvao= newValue;
}
void BDSData::setTongsophong(QString newValue)
{
    m_tongsophong= newValue;
}
void BDSData::setPhaply(QString newValue)
{
    m_phaply= newValue;
}
void BDSData::setTenduan(QString newValue)
{
    m_tenduan= newValue;
}
void BDSData::setTenduong(QString newValue)
{
    m_tenduong= newValue;
}
void BDSData::setPageurl(QString newValue)
{
    m_pageurl= newValue;
}
void BDSData::setLoaibaidang(QString newValue)
{
    m_loaibaidang= newValue;
}
void BDSData::setCreate_At(QString newValue)
{
    m_create_at= newValue;
}
void BDSData::setUpdated_At(QString newValue)
{
    m_updated_at= newValue;
}

void BDSData::setViewed(bool newValue)
{
    m_viewed = newValue;
    emit viewedChanged();
}
