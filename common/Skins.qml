import QtQuick 2.5

QtObject
{
    property alias common : commonStyle
    property alias colors : colorsStyle
    property alias title  : titleStyle

    property alias navigationMenu : navigationMenuStyle

    property var __commonStyle:
    QtObject
    {
        id: commonStyle
        readonly property string fontFamily    : "Roboto Mono"
        readonly property int    fontPixelSize : 18
    }

    property var __colorsStyle:
    QtObject
    {
        id: colorsStyle
        readonly property string c600 : "qrc:/colors/c600.png"
        readonly property string c800 : "qrc:/colors/c800.png"
        readonly property string c50  : "qrc:/colors/c50.png"
    }

    property var __titleStyle:
    QtObject
    {
        id: titleStyle
        readonly property int fontPixelSize : 20
    }

    property var __navigationMenuStyle:
    QtObject
    {
        id: navigationMenuStyle
        readonly property int width : 350
    }

    readonly property string menuIconSource : "qrc:/icons/menu_48_48.png"
    readonly property int    menuWidth      : 24
    readonly property int    menuHeight     : 24

    readonly property string leftToRightShadowSource : "qrc:/common_skins/left_to_right_shadow_5.png"
    readonly property string bottomToTopShadowSource : "qrc:/common_skins/bottom_to_top_shadow_5.png"
    readonly property string topToBottomShadowSource : "qrc:/common_skins/top_to_bottom_shadow_10.png"
}
