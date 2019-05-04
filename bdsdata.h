#ifndef BDSDATA_H
#define BDSDATA_H

#include <QObject>

class BDSData : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString id READ getId WRITE setId NOTIFY idChanged)
    Q_PROPERTY(QString hinhanh READ getHinhanh WRITE setHinhanh NOTIFY hinhanhChanged)
    Q_PROPERTY(QString tieude READ getTieude WRITE setTieude NOTIFY tieudeChanged)
    Q_PROPERTY(QString noidung READ getNoidung WRITE setNoidung NOTIFY noidungChanged)
    Q_PROPERTY(QString phuongxa READ getPhuongxa WRITE setPhuongxa NOTIFY phuongxaChanged)
    Q_PROPERTY(QString quanhuyen READ getQuanhuyen WRITE setQuanhuyen NOTIFY quanhuyenChanged)
    Q_PROPERTY(QString tinhthanh READ getTinhthanh WRITE setTinhthanh NOTIFY tinhthanhChanged)
    Q_PROPERTY(QString gia READ getGia WRITE setGia NOTIFY giaChanged)
    Q_PROPERTY(QString dientichdat READ getDientichdat WRITE setDientichdat NOTIFY dientichdatChanged)
    Q_PROPERTY(QString dientichsudung READ getDientichsudung WRITE setDientichsudung NOTIFY dientichsudungChanged)
    Q_PROPERTY(QString dientichxaydung READ getDientichxaydung WRITE setDientichxaydung NOTIFY dientichxaydungChanged)
    Q_PROPERTY(QString diachi READ getDiachi WRITE setDiachi NOTIFY diachiChanged)
    Q_PROPERTY(QString ten READ getTen WRITE setTen NOTIFY tenChanged)
    Q_PROPERTY(QString sodienthoai READ getSodienthoai WRITE setSodienthoai NOTIFY sodienthoaiChanged)
    Q_PROPERTY(QString email READ getEmail WRITE setEmail NOTIFY emailChanged)
    Q_PROPERTY(QString ngaydang READ getNgaydang WRITE setNgaydang NOTIFY ngaydangChanged)
    Q_PROPERTY(QString huongnha READ getHuongnha WRITE setHuongnha NOTIFY huongnhaChanged)
    Q_PROPERTY(QString huongbancong READ getHuongbancong WRITE setHuongbancong NOTIFY huongbancongChanged)
    Q_PROPERTY(QString sotang READ getSotang WRITE setSotang NOTIFY sotangChanged)
    Q_PROPERTY(QString sophongngu READ getSophongngu WRITE setSophongngu NOTIFY sophongnguChanged)
    Q_PROPERTY(QString sotoilet READ getSotoilet WRITE setSotoilet NOTIFY sotoiletChanged)
    Q_PROPERTY(QString noithat READ getNoithat WRITE setNoithat NOTIFY noithatChanged)
    Q_PROPERTY(QString mattien READ getMattien WRITE setMattien NOTIFY mattienChanged)
    Q_PROPERTY(QString duongvao READ getDuongvao WRITE setDuongvao NOTIFY duongvaoChanged)
    Q_PROPERTY(QString tongsophong READ getTongsophong WRITE setTongsophong NOTIFY tongsophongChanged)
    Q_PROPERTY(QString phaply READ getPhaply WRITE setPhaply NOTIFY phaplyChanged)
    Q_PROPERTY(QString tenduan READ getTenduan WRITE setTenduan NOTIFY tenduanChanged)
    Q_PROPERTY(QString tenduong READ getTenduong WRITE setTenduong NOTIFY tenduongChanged)
    Q_PROPERTY(QString pageurl READ getPageurl WRITE setPageurl NOTIFY pageurlChanged)
    Q_PROPERTY(QString loaibaidang READ getLoaibaidang WRITE setLoaibaidang NOTIFY loaibaidangChanged)
    Q_PROPERTY(QString create_at READ getCreate_At WRITE setCreate_At NOTIFY create_atChanged)
    Q_PROPERTY(QString updated_at READ getUpdated_At WRITE setUpdated_At NOTIFY updated_atChanged)
    Q_PROPERTY(bool userviewed READ getViewed WRITE setViewed NOTIFY viewedChanged)
    QString m_id = "chưa cập nhật";
    QString m_hinhanh = "chưa cập nhật";
    QString m_tieude = "chưa cập nhật";
    QString m_noidung = "chưa cập nhật";
    QString m_phuongxa = "chưa cập nhật";
    QString m_quanhuyen = "chưa cập nhật";
    QString m_tinhthanh = "chưa cập nhật";
    QString m_gia = "chưa cập nhật";
    QString m_dientichdat = "chưa cập nhật";
    QString m_dientichsudung = "chưa cập nhật";
    QString m_dientichxaydung = "chưa cập nhật";
    QString m_diachi = "chưa cập nhật";
    QString m_ten = "chưa cập nhật";
    QString m_sodienthoai = "chưa cập nhật";
    QString m_email = "chưa cập nhật";
    QString m_ngaydang = "chưa cập nhật";
    QString m_huongnha = "chưa cập nhật";
    QString m_huongbancong = "chưa cập nhật";
    QString m_sotang = "chưa cập nhật";
    QString m_sophongngu = "chưa cập nhật";
    QString m_sotoilet = "chưa cập nhật";
    QString m_noithat = "chưa cập nhật";
    QString m_mattien = "chưa cập nhật";
    QString m_duongvao = "chưa cập nhật";
    QString m_tongsophong = "chưa cập nhật";
    QString m_phaply = "chưa cập nhật";
    QString m_tenduan = "chưa cập nhật";
    QString m_tenduong = "chưa cập nhật";
    QString m_pageurl = "chưa cập nhật";
    QString m_loaibaidang = "chưa cập nhật";
    QString m_create_at = "chưa cập nhật";
    QString m_updated_at = "chưa cập nhật";
    bool    m_viewed = false;
public:
    explicit BDSData(QObject *parent = nullptr);
    QString getId();
    QString getHinhanh();
    QString getTieude();
    QString getNoidung();
    QString getPhuongxa();
    QString getQuanhuyen();
    QString getTinhthanh();
    QString getGia();
    QString getDientichdat();
    QString getDientichsudung();
    QString getDientichxaydung();
    QString getDiachi();
    QString getTen();
    QString getSodienthoai();
    QString getEmail();
    QString getNgaydang();
    QString getHuongnha();
    QString getHuongbancong();
    QString getSotang();
    QString getSophongngu();
    QString getSotoilet();
    QString getNoithat();
    QString getMattien();
    QString getDuongvao();
    QString getTongsophong();
    QString getPhaply();
    QString getTenduan();
    QString getTenduong();
    QString getPageurl();
    QString getLoaibaidang();
    QString getCreate_At();
    QString getUpdated_At();
    bool getViewed();

    void setId(QString newValue);
    void setHinhanh(QString newValue);
    void setTieude(QString newValue);
    void setNoidung(QString newValue);
    void setPhuongxa(QString newValue);
    void setQuanhuyen(QString newValue);
    void setTinhthanh(QString newValue);
    void setGia(QString newValue);
    void setDientichdat(QString newValue);
    void setDientichsudung(QString newValue);
    void setDientichxaydung(QString newValue);
    void setDiachi(QString newValue);
    void setTen(QString newValue);
    void setSodienthoai(QString newValue);
    void setEmail(QString newValue);
    void setNgaydang(QString newValue);
    void setHuongnha(QString newValue);
    void setHuongbancong(QString newValue);
    void setSotang(QString newValue);
    void setSophongngu(QString newValue);
    void setSotoilet(QString newValue);
    void setNoithat(QString newValue);
    void setMattien(QString newValue);
    void setDuongvao(QString newValue);
    void setTongsophong(QString newValue);
    void setPhaply(QString newValue);
    void setTenduan(QString newValue);
    void setTenduong(QString newValue);
    void setPageurl(QString newValue);
    void setLoaibaidang(QString newValue);
    void setCreate_At(QString newValue);
    void setUpdated_At(QString newValue);
    void setViewed(bool newValue);
signals:
    void idChanged();
    void hinhanhChanged();
    void tieudeChanged();
    void noidungChanged();
    void phuongxaChanged();
    void quanhuyenChanged();
    void tinhthanhChanged();
    void giaChanged();
    void dientichdatChanged();
    void dientichsudungChanged();
    void dientichxaydungChanged();
    void diachiChanged();
    void tenChanged();
    void sodienthoaiChanged();
    void emailChanged();
    void ngaydangChanged();
    void huongnhaChanged();
    void huongbancongChanged();
    void sotangChanged();
    void sophongnguChanged();
    void sotoiletChanged();
    void noithatChanged();
    void mattienChanged();
    void duongvaoChanged();
    void tongsophongChanged();
    void phaplyChanged();
    void tenduanChanged();
    void tenduongChanged();
    void pageurlChanged();
    void loaibaidangChanged();
    void create_atChanged();
    void updated_atChanged();
    void viewedChanged();

public slots:
};

#endif // BDSDATA_H
