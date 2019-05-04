#ifndef APPMANAGER_H
#define APPMANAGER_H

#include <QObject>
#include <QTimer>
#include <QDebug>
#include <QVariant>
#include <QFile>
#include <QXmlStreamReader>
#include <QXmlStreamWriter>
#include <QStandardPaths>
#include <QEventLoop>

#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QNetworkInterface>

#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>

#include <QEventLoop>

#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlRecord>
#include <QSqlError>
#include <QSqlResult>


#include "bdsdata.h"

class AppManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariant listBDS READ getlistBDS NOTIFY listBDSChanged)
    Q_PROPERTY(int pageCount READ getPagecount WRITE setPagecount NOTIFY pageCountChanged)
    Q_PROPERTY(int currentPage READ getCurrent_Page WRITE setCurrent_Page NOTIFY current_pageChanged)

    QSqlDatabase m_dbBDS;

public:
    explicit AppManager(QObject *parent);
    AppManager();
    int m_pageCount = 0;
    int m_current_page = 0;
    QString m_loaibaidang = "";
    QString m_quanhuyen = "";
    QString m_phuongxa = "";
    QString m_ngaybatdau = QDateTime::currentDateTime().toString("dd-MM-yyyy");
    QString m_ngayketthuc = QDateTime::currentDateTime().toString("dd-MM-yyyy");
    QString m_tenduong = "";
    QString m_nguon = "";
    QString m_loaibds = "";
    QString m_user = "";
    QString m_pwd = "";
    int m_giamin = 0;
    int m_giamax = 999;

    Q_INVOKABLE bool autoLogin();
    Q_INVOKABLE bool loginUser(QString strNumber, QString strPwd);
    Q_INVOKABLE bool logout();
    Q_INVOKABLE bool forgotPassword(QString strPhoneNumber);
    Q_INVOKABLE bool changePassword(QString strOldPassword, QString strNewPassword, QString strConfirmPassword);
    Q_INVOKABLE bool startupApplication();

    Q_INVOKABLE bool refreshDanhSach();
    Q_INVOKABLE bool filterDanhSachNguon(QString strNguon);
    Q_INVOKABLE bool filterDanhSachTheoQuan(QString strQuanHuyen);
    Q_INVOKABLE bool filterDanhSachTheoPhuong(QString strPhuongXa);
    Q_INVOKABLE bool filterDanhSachTheoDuong(QString strTenDuong);
    Q_INVOKABLE bool filterDanhSachTheoNgay(QString strNgayBatDau, QString strNgayKetThuc);
    Q_INVOKABLE bool filterDanhSachTheoLoaiBaiDang(QString strLoaiBaiDang);
    Q_INVOKABLE bool filterDanhSachTheoGia(int nGiaMin, int nGiaMax);
    Q_INVOKABLE void goToPage(int nSelectedPage);
    Q_INVOKABLE void viewPage(int nSelectedPage);


    void getBDSData();
    QList<QObject*> m_listBDS;
    QVariant getlistBDS();
    int getPagecount();
    int getCurrent_Page();
    void setPagecount(int newValue);
    void setCurrent_Page(int newValue);
    void updatePageViewed(int nSelectedPage);
    bool checkPageViewed(QString pageUrl);
    void saveLoginInfo(QString strPhoneNumber, QString strPassword);
    void getLoginInfo(QString &strPhoneNumber, QString &strPassword);
signals:
    void listBDSChanged();
    void pageCountChanged();
    void current_pageChanged();

public slots:
};

#endif // APPMANAGER_H
