import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4

RowLayout
{
    id: wrapper

    property real leftAreaWidth  : 20
    property real rightAreaWidth : 20

    Action
    {
        id: leftAreaItem
        Layout.fillHeight     : true
        Layout.preferredWidth : wrapper.leftAreaWidth
        Layout.minimumWidth   : wrapper.leftAreaWidth
        Layout.maximumWidth   : wrapper.leftAreaWidth
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
        Layout.fillHeight     : true
        Layout.preferredWidth : wrapper.rightAreaWidth
        Layout.minimumWidth   : wrapper.rightAreaWidth
        Layout.maximumWidth   : wrapper.rightAreaWidth
    }
}
