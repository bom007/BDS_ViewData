#include "appmanager.h"
#define DEBUG_MODE
static QString CLOUD_HOST = "http://lamappdidong.com/api/mobie";
static QString GOOGLE_CLOUD_HOST = "https://us-central1-schedulerapp-8ed52.cloudfunctions.net";
static QString LOCAL_HOST = "http://localhost:8000";
static QString DBTYPE = "QSQLITE";
static QString DBNAME_DATA_MANAGEMENT = "ViewedData";
static QString DBCON_DATA_MANAGEMENT = DBNAME_DATA_MANAGEMENT;
static QString DBFILENAME_EXTENSION = ".db";
static QString DBFILENAME_DATA_MANAGEMENT = DBNAME_DATA_MANAGEMENT + DBFILENAME_EXTENSION;
static QString DBTBL_MSG_PAGE_VIEW = "tblPageView";
#ifdef Q_OS_WIN
static QString STORAGE_PATH = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
static QString LOGIN_INFO = STORAGE_PATH + "/Storage.xml";
#else
static QString STORAGE_PATH = QStandardPaths::AppDataLocation + "\\resource\\xml\\";
static QString LOGIN_INFO = STORAGE_PATH + "Storage.xml";
#endif

AppManager::AppManager(QObject *parent) : QObject(parent)
{

}

AppManager::AppManager(){

}

bool AppManager::autoLogin()
{
    QString tempNumber = "";
    QString tempPwd = "";
    getLoginInfo(tempNumber, tempPwd);
    return loginUser(tempNumber, tempPwd);
}

bool AppManager::loginUser(QString strNumber, QString strPwd)
{
#ifdef DEBUG_MODE
    qDebug() << Q_FUNC_INFO;
#endif
    QUrl url = QUrl(CLOUD_HOST + "/login");
    QNetworkRequest request;
    QString tempMacAddress = QNetworkInterface::allInterfaces()[0].hardwareAddress();
    QString body = "phone=" + strNumber;
    body += "&password=" + strPwd;
    body += "&macaddress=" + tempMacAddress.replace(":","-");
    qDebug() << "tempMacAddress: " << tempMacAddress.replace(":","-");
    request.setUrl(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");
    QNetworkAccessManager tempManager;
    QEventLoop tempLoop;
    connect(&tempManager, SIGNAL(finished(QNetworkReply*)),&tempLoop, SLOT(quit()));
    QNetworkReply* response = tempManager.post(request,body.toUtf8());
    tempLoop.exec();

    if(!response->isFinished()){
        response->abort();
    }

    QString tempNetworkResponse;
    if(response->error() == QNetworkReply::NoError)
    {
        QByteArray arrayResponse = response->readAll();
        tempNetworkResponse = (QString)arrayResponse;
#ifdef DEBUG_MODE
        qDebug() << "tempNetworkResponse: " << tempNetworkResponse;
#endif
        QJsonDocument jsDoc = QJsonDocument::fromJson(arrayResponse);
        int result = 0;
        result = jsDoc.object().value("code").toInt();
        if(result == 200){
            m_user = strNumber;
            m_pwd = strPwd;
            saveLoginInfo(strNumber,strPwd);
            return true;
        }
    }
    else
    {
        tempNetworkResponse = response->errorString() + " | " + response->readAll();
        qDebug() << "tempNetworkResponse: " << tempNetworkResponse;
    }
    return false;
}

bool AppManager::logout()
{
    return true;
}

bool AppManager::forgotPassword(QString strPhoneNumber)
{
    return true;
}

bool AppManager::changePassword(QString strOldPassword, QString strNewPassword, QString strConfirmPassword)
{
    return true;
}

bool AppManager::startupApplication()
{
    qDebug() << Q_FUNC_INFO;
    //Initialize target page database
    QSqlDatabase::database(DBCON_DATA_MANAGEMENT, false).close();
    QSqlDatabase::removeDatabase(DBCON_DATA_MANAGEMENT);
    m_dbBDS = QSqlDatabase::addDatabase(DBTYPE, DBCON_DATA_MANAGEMENT);
    m_dbBDS.setDatabaseName(DBFILENAME_DATA_MANAGEMENT);
    qDebug() << "1";
    if(m_dbBDS.isOpen() || m_dbBDS.open()){
        qDebug() << "2";
        if(!m_dbBDS.tables().contains(DBTBL_MSG_PAGE_VIEW)){
            qDebug() << "3";
            QSqlQuery query("", m_dbBDS);
            query.exec("create table " + DBTBL_MSG_PAGE_VIEW + " (pageurl varchar)");
        }
    }else{
        qDebug() << "1a";
        qDebug() << "Can not create database";
    }
    qDebug() << "4";
    getBDSData();
    return true;
}

bool AppManager::refreshDanhSach()
{
    getBDSData();
    return true;
}

bool AppManager::filterDanhSachTheoDuong(QString strTenDuong)
{
    m_tenduong = strTenDuong;
    getBDSData();
    return true;
}

bool AppManager::filterDanhSachNguon(QString strNguon)
{
    m_nguon = strNguon;
    getBDSData();
    return true;
}

bool AppManager::filterDanhSachTheoQuan(QString strQuanHuyen)
{
    m_quanhuyen = strQuanHuyen;
    getBDSData();
    return true;
}

bool AppManager::filterDanhSachTheoPhuong(QString strPhuongXa)
{
    m_phuongxa = strPhuongXa;
    getBDSData();
    return true;
}

bool AppManager::filterDanhSachTheoNgay(QString strNgayBatDau, QString strNgayKetThuc)
{
    m_ngaybatdau = strNgayBatDau;
    m_ngayketthuc = strNgayKetThuc;
    getBDSData();
    return true;
}

bool AppManager::filterDanhSachTheoLoaiBaiDang(QString strLoaiBaiDang)
{
    m_loaibaidang = strLoaiBaiDang;
    getBDSData();
    return true;
}

bool AppManager::filterDanhSachTheoGia(int nGiaMin, int nGiaMax)
{
    m_giamin = nGiaMin;
    m_giamax = nGiaMax;
    getBDSData();
    return true;
}

void AppManager::goToPage(int nSelectedPage)
{
    setCurrent_Page(nSelectedPage);
    getBDSData();
}

void AppManager::viewPage(int nSelectedPage)
{
    updatePageViewed(nSelectedPage);
}

void AppManager::getBDSData()
{
#ifdef DEBUG_MODE
    qDebug() << Q_FUNC_INFO;
#endif
    QString strUrl;
    strUrl = CLOUD_HOST + "/getdata";
#ifdef DEBUG_MODE
    qDebug() << "strUrl: " << strUrl;
#endif
    QUrl url = QUrl(strUrl);
    QNetworkRequest request(url);
    QString body = "";
    body += "pagination=" + QString::number(m_current_page);
    body += "&loaibaidang=" + m_loaibaidang;
    body += "&quanhuyen=" + m_quanhuyen;
    body += "&phuongxa=" + m_phuongxa;
    body += "&ngaybatdau=" + m_ngaybatdau;
    body += "&ngayketthuc=" + m_ngayketthuc;
    body += "&tenduong=" + m_tenduong;
    body += "&nguon=" + m_nguon;
    body += "&loaibds=" + m_loaibds;
    body += "&giamin=" + QString::number(m_giamin);
    body += "&giamax=" + QString::number(m_giamax);

#ifdef DEBUG_MODE
    qDebug() << "body: " << body.toUtf8();
#endif
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");
    QNetworkAccessManager tempReportManager;
    QEventLoop tempLoop;
    connect(&tempReportManager, SIGNAL(finished(QNetworkReply*)), &tempLoop, SLOT(quit()));
    QNetworkReply* response = tempReportManager.post(request,body.toUtf8());
    tempLoop.exec();
    if(!response->isFinished()){
        qDebug() << "isFinished";
        response->abort();
    }

    QString tempNetworkResponse;
    if(response->error() == QNetworkReply::NoError)
    {
        QByteArray arrayResponse = response->readAll();
        tempNetworkResponse = (QString)arrayResponse;
#ifdef DEBUG_MODE
        qDebug() << "networkResponse: " << tempNetworkResponse;
#endif
        QJsonDocument JSdoc = QJsonDocument::fromJson(arrayResponse);
        QJsonObject JSObj = JSdoc.object();
#ifdef DEBUG_MODE
        qDebug() << "report result: " << JSObj.value("code").toInt();
#endif
        QJsonArray JSArr = JSObj.value("data").toObject().value("data").toArray();
        setPagecount(JSObj.value("pagecount").toInt());
        setCurrent_Page(JSObj.value("data").toObject().value("current_page").toInt());
#ifdef DEBUG_MODE
        qDebug() << JSArr.count();
#endif
        m_listBDS.clear();
        if(JSArr.count() > 0){
            for (int i = 0; i < JSArr.count(); ++i) {
                QJsonObject JSObjBDS = JSArr[i].toObject();
                BDSData* newData = new BDSData();
                newData->setId(JSObjBDS.value("id").toString());
                newData->setHinhanh(JSObjBDS.value("hinhanh").toString());
                newData->setTieude(JSObjBDS.value("tieude").toString());
                QString newNoidung = QByteArray::fromHex(JSObjBDS.value("noidung").toString().toUtf8());
                newData->setNoidung(newNoidung);
                newData->setPhuongxa(JSObjBDS.value("phuongxa").toString());
                newData->setQuanhuyen(JSObjBDS.value("quanhuyen").toString());
                newData->setTinhthanh(JSObjBDS.value("tinhthanh").toString());
                newData->setGia(JSObjBDS.value("gia").toString());
                newData->setDientichdat(JSObjBDS.value("dientichdat").toString());
                newData->setDientichsudung(JSObjBDS.value("dientichsudung").toString());
                newData->setDientichxaydung(JSObjBDS.value("dientichxaydung").toString());
                newData->setDiachi(JSObjBDS.value("diachi").toString());
                newData->setTen(JSObjBDS.value("ten").toString());
                newData->setSodienthoai(JSObjBDS.value("sodienthoai").toString());
                newData->setEmail(JSObjBDS.value("email").toString());
                newData->setNgaydang(JSObjBDS.value("ngaydang").toString());
                newData->setHuongnha(JSObjBDS.value("huongnha").toString());
                newData->setHuongbancong(JSObjBDS.value("huongbancong").toString());
                newData->setSotang(JSObjBDS.value("sotang").toString());
                newData->setSophongngu(JSObjBDS.value("sophongngu").toString());
                newData->setSotoilet(JSObjBDS.value("sotoilet").toString());
                newData->setNoithat(JSObjBDS.value("noithat").toString());
                newData->setMattien(JSObjBDS.value("mattien").toString());
                newData->setDuongvao(JSObjBDS.value("duongvao").toString());
                newData->setTongsophong(JSObjBDS.value("tongsophong").toString());
                newData->setPhaply(JSObjBDS.value("phaply").toString());
                newData->setTenduan(JSObjBDS.value("tenduan").toString());
                newData->setTenduong(JSObjBDS.value("tenduong").toString());
                newData->setPageurl(JSObjBDS.value("pageurl").toString());
                newData->setLoaibaidang(JSObjBDS.value("loaibaidang").toString());
                newData->setCreate_At(JSObjBDS.value("create_at").toString());
                newData->setUpdated_At(JSObjBDS.value("updated_at").toString());
                m_listBDS.append(newData);
            }
        }
        emit listBDSChanged();

    }
    else
    {
        tempNetworkResponse = response->errorString() + response->readAll();
#ifdef DEBUG_MODE
        qDebug() << "error: networkResponse: " << tempNetworkResponse;
#endif
    }
}

QVariant AppManager::getlistBDS()
{
    for (int i = 0; i < m_listBDS.count(); ++i) {
        BDSData* tempBDS = (BDSData*)m_listBDS[i];
        if(checkPageViewed(tempBDS->getPageurl()) == true){
            tempBDS->setViewed(true);
        }else{
            tempBDS->setViewed(false);
        }
    }

    return QVariant::fromValue(m_listBDS);
}

void AppManager::setPagecount(int newValue)
{
    m_pageCount = newValue;
    emit pageCountChanged();
}

int AppManager::getPagecount()
{
    return m_pageCount;
}

void AppManager::setCurrent_Page(int newValue)
{
    if(m_current_page != newValue){
        m_current_page = newValue;
        emit current_pageChanged();
    }
}


void AppManager::updatePageViewed(int nSelectedPage)
{
    if(m_dbBDS.isOpen() || m_dbBDS.open()){
        if(m_dbBDS.tables().contains(DBTBL_MSG_PAGE_VIEW)){
            BDSData* tempBDS = (BDSData*)m_listBDS[nSelectedPage];
            tempBDS->setViewed(true);
            if(checkPageViewed(tempBDS->getPageurl()) == false){
                QSqlQuery query(m_dbBDS);
                query.prepare("INSERT INTO " + DBTBL_MSG_PAGE_VIEW + " (pageurl) VALUES (:pageurl) ");
                query.bindValue(":pageurl", tempBDS->getPageurl());
                query.exec();
                if(query.next()){
#ifdef DEBUG_MODE
                    qDebug() << "updatePageViewed success: " << tempBDS->getPageurl();
#endif
                }else{
#ifdef DEBUG_MODE
                    qDebug() << "updatePageViewed failed: " << tempBDS->getPageurl();
                    qDebug() << query.lastError().text();
#endif
                }
            }

        }
//        m_dbBDS.close();
    }
}

bool AppManager::checkPageViewed(QString pageUrl)
{
    if(m_dbBDS.isOpen() || m_dbBDS.open()){
        if(m_dbBDS.tables().contains(DBTBL_MSG_PAGE_VIEW)){
            QSqlQuery query("SELECT * FROM " + DBTBL_MSG_PAGE_VIEW + " WHERE pageurl LIKE '%" + pageUrl + "%'", m_dbBDS);
            query.exec();
            if(query.next()){
//                m_dbBDS.close();
                return true;
            }else{
//                m_dbBDS.close();
                return false;
            }
        }
    }
    return false;
}

int AppManager::getCurrent_Page()
{
    return m_current_page;
}

void AppManager::saveLoginInfo(QString strPhoneNumber, QString strPassword)
{
    QFile file(LOGIN_INFO);

    if(!file.open(QIODevice::WriteOnly)){
        qDebug() << "saveLoginInfo fail";
        return;
    }

    QXmlStreamWriter xmlWriter(&file);
    xmlWriter.setAutoFormatting(true);
    xmlWriter.writeStartDocument();
    xmlWriter.writeStartElement("LoginInfo");
    xmlWriter.writeTextElement("PhoneNumber", strPhoneNumber);
    xmlWriter.writeTextElement("Password", strPassword);
    xmlWriter.writeEndElement();
    xmlWriter.writeEndDocument();

    file.close();
}

void AppManager::getLoginInfo(QString &strPhoneNumber, QString &strPassword)
{
    QFile file(LOGIN_INFO);

#ifdef DEBUG_MODE
    qDebug() << Q_FUNC_INFO;
#endif
    if( !file.open( QFile::ReadOnly | QFile::Text ) ) {
        qDebug() << file.fileName();
        return;
    }
    QXmlStreamReader xmlStream(&file);
    while(!xmlStream.atEnd())
    {
        xmlStream.readNext();
        if(xmlStream.isStartElement() && xmlStream.name() == "LoginInfo") {

            while(!xmlStream.atEnd())
            {
                xmlStream.readNext();
                QString keyValue = xmlStream.name().toString();
                if(xmlStream.isStartElement() == true){
                    if(keyValue == "PhoneNumber"){
                        strPhoneNumber = xmlStream.readElementText();
                    }
                    else if(keyValue == "Password"){
                        strPassword = xmlStream.readElementText();
                    }
                }
            }
        }
    }

    file.close();
}
