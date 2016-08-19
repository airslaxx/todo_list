import QtQuick 2.5
import QtQuick.Window 2.2
import QtQml.StateMachine 1.0 as DSM
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import "qrc:/common" as Common

Window
{
    id: wrapper
    visible : true
    
    width:  800
    height: 600

    signal clickedOpenMenu
    signal clickedCloseMenu

    property bool permissedWidthForAlwaysShowMenu : wrapper.width >= Screen.width * 0.6

    DSM.StateMachine
    {
        id : navigationMenuStateMachine

        running: true
        initialState: closedNavigationMenuState

        DSM.State
        {
            id : oppenedNavigationMenuState

            onEntered:
            {
                navigationMenu.show()
                grayImage.show()
            }

            DSM.SignalTransition
            {
                targetState: closedNavigationMenuState
                signal: wrapper.clickedCloseMenu
            }

            DSM.SignalTransition
            {
                targetState: alwaysVisibleMenuState
                signal: wrapper.onWidthChanged
                guard: wrapper.permissedWidthForAlwaysShowMenu
            }
        }

        DSM.State
        {
            id : closedNavigationMenuState

            onEntered:
            {
                navigationMenu.hide()
                grayImage.hide()
                bottopPaneItem.anchors.left = bottopPaneItem.parent.left
            }

            DSM.SignalTransition
            {
                targetState: oppenedNavigationMenuState
                signal: wrapper.clickedOpenMenu
            }

            DSM.SignalTransition
            {
                targetState: alwaysVisibleMenuState
                signal: wrapper.onWidthChanged
                guard: wrapper.permissedWidthForAlwaysShowMenu
                onTriggered:
                {
                    navigationMenu.show()
                }
            }
        }

        DSM.State
        {
            id : alwaysVisibleMenuState

            onEntered:
            {
                bottopPaneItem.anchors.left = navigationMenu.right
                grayImage.hide()
                bottopPaneItem.anchors.left = navigationMenu.right
                bottopPaneItem.menuItemVisible = false
            }

            onExited:
            {
                bottopPaneItem.menuItemVisible = true
            }

            DSM.SignalTransition
            {
                targetState: closedNavigationMenuState
                signal: wrapper.onWidthChanged
                guard: !wrapper.permissedWidthForAlwaysShowMenu
            }
        }
    }

    NavigationMenu
    {
        id : navigationMenu

        z : 2
        anchors
        {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }
        width: 0

        titleText: "Categories"

        function show()
        {
            navigationMenu.enabled = true
        }

        function hide()
        {
            navigationMenu.enabled = false
        }

        NumberAnimation on width
        {
            from: 0
            to: skins.navigationMenu.width
            running: navigationMenu.enabled
            duration: 200
        }

        NumberAnimation on width
        {
            from: skins.navigationMenu.width
            to: 0
            running: !navigationMenu.enabled
            duration: 200
        }

        NumberAnimation on opacity
        {
            from: 0
            to: 1.0
            running: navigationMenu.enabled
            duration: 200
        }

        NumberAnimation on opacity
        {
            from: 1.0
            to: 0
            running: !navigationMenu.enabled
            duration: 200
        }
    }

    Image
    {
        id : grayImage

        z : 2
        anchors
        {
            right  : parent.right
            top    : parent.top
            bottom : parent.bottom
            left   : navigationMenu.right
        }
        source: skins.colors.c800
        opacity: 0
        visible: false
        enabled: false

        function show()
        {
            grayImage.enabled = true
            grayImage.visible = true
            grayImage.opacity = 0.5
        }

        function hide()
        {
            grayImage.opacity = 0
            grayImage.enabled = false
            grayImage.visible = false
        }

        NumberAnimation on opacity
        {
            from: 0
            to: 0.5
            duration: 1000
        }

        NumberAnimation on opacity
        {
            from: 0.5
            to: 0
            duration: 1000
        }

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                wrapper.clickedCloseMenu()
            }
        }
    }

    Common.ListItem
    {
        id : bottopPaneItem
        z : 1
        anchors.left: parent.left
        anchors.right: parent.right
        backroundSource: skins.colors.c600

        property bool menuItemVisible : true

        height: 55

        leftAreaData: Image
        {
            id : menuItem

            anchors.centerIn : parent
            antialiasing: true
            source: skins.menuIconSource
            width: skins.menuWidth
            height: skins.menuHeight
            visible: bottopPaneItem.menuItemVisible

            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    wrapper.clickedOpenMenu()
                }
            }
        }
        centralAreaData:
        Common.TextLabel
        {
            anchors.fill: parent
            font.pixelSize: skins.title.fontPixelSize
            horizontalAlignment: Text.AlignLeft
            color: "white"
            text: "Test"
        }
    }

    Image
    {
        id: shadowImage

        anchors
        {
            left: bottopPaneItem.left
            right: bottopPaneItem.right
            top: bottopPaneItem.bottom
        }
        height: 5
        source : skins.topToBottomShadowSource
    }
}
