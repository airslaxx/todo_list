import QtQuick 2.5
import QtQuick.Layouts 1.1
import "qrc:/common" as Common

FocusScope
{
    id: wrapper

    property alias titleText : menuTitle.text

    visible: wrapper.enabled

    Image
    {
        anchors.fill: parent
        source: skins.colors.c50
    }

    ColumnLayout
    {
        id: menuContentLayout
        anchors.fill: parent

        Common.TextLabel
        {
            id: menuTitle

            Layout.leftMargin: 10
            Layout.minimumHeight: 50
            Layout.preferredHeight: 50
            Layout.maximumHeight: 50

            font.pixelSize: skins.title.fontPixelSize
            horizontalAlignment: Text.AlignLeft | Text.AlignVCenter
        }

        ListView
        {
            id: constentItem

            Layout.fillHeight: true
            Layout.fillWidth: true

            model: 20
            spacing: 10
            delegate:
            Rectangle
            {
               anchors.left: parent.left
               anchors.right: parent.right
               height: 40
               anchors.margins: 5
               color: "lightgray"
            }
        }
    }

    Image
    {
        id: shadowImage

        anchors
        {
            left: parent.right
            top: parent.top
            bottom: parent.bottom
        }

        source : skins.leftToRightShadowSource
    }
}
