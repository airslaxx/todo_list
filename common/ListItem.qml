import QtQuick 2.5
import QtQuick.Layouts 1.1

Image
{
    id: wrapper

    property real leftItemAreaWidth  : 40
    property real rightItemAreaWidth : 40

    property alias leftAreaData    : leftAreaItem.data
    property alias centralAreaData : centralAreaItem.data
    property alias rightAreaData   : rightAreaItem.data
    property alias backroundSource : wrapper.source

    RowLayout
    {
        anchors.fill: parent
        Item
        {
            id: leftAreaItem

            Layout.fillHeight     : true
            Layout.preferredWidth : wrapper.leftItemAreaWidth
            Layout.minimumWidth   : wrapper.leftItemAreaWidth
            Layout.maximumWidth   : wrapper.leftItemAreaWidth
        }

        Item
        {
            id: centralAreaItem

            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        Item
        {
            id: rightAreaItem

            Layout.preferredWidth : wrapper.rightItemAreaWidth
            Layout.minimumWidth   : wrapper.rightItemAreaWidth
            Layout.maximumWidth   : wrapper.rightItemAreaWidth
        }
    }
}
