import QtQuick 2.6
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
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

            Layout.minimumHeight: 50
            Layout.preferredHeight: 50
            Layout.maximumHeight: 50

            Layout.fillWidth: true

            font.pixelSize: skins.title.fontPixelSize
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            clip: true
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
               width: parent.width - 10
               height: 50
               color: "lightgray"
            }

            ScrollBar.vertical: ScrollBar { }
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
