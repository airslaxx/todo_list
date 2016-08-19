#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QQmlContext>

void add_qml_skin_to_context(QQmlApplicationEngine & engine)
{
  QQmlComponent skin_component(&engine, QUrl( QStringLiteral("qrc:/common/Skins.qml") ));

  QObject *skin = skin_component.create();
  Q_ASSERT(skin != nullptr);

  engine.rootContext()->setContextProperty("skins", skin);
}

int main(int argc, char *argv[])
{
	QGuiApplication app(argc, argv);

	QQmlApplicationEngine engine;
  add_qml_skin_to_context( engine );
  engine.load( QUrl( QStringLiteral("qrc:/main/main.qml") ) );

  return app.exec();
}
