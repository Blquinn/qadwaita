#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtGui/QIcon>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QIcon::setThemeName("Adwaita");
//    auto icon = QIcon::fromTheme("window-close");
//    auto icon2 = QIcon::fromTheme("edit-undo");
//    auto icon3 = QIcon::fromTheme("window-maximize");
//    qInfo() << icon << icon2 << icon3
//    <<QIcon::themeName()
//    <<QIcon::themeSearchPaths();

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
