import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

import "./private"

// TODO: Prevent window narrow size from squashing content elements and title.

Rectangle {
    enum Icons {
        Minimize,
        Maximize,
        Close
    }

    function iconName(enumVal) {
        switch (enumVal) {
        case AdwHeaderBar.Icons.Minimize:
            return "window-minimize"
        case AdwHeaderBar.Icons.Maximize:
            return "window-maximize"
        case AdwHeaderBar.Icons.Close:
//            return "window-close-symbolic"
            return "window-close"
        }
    }

    property var window: null
    property string title: ""
    property alias contentLeft: contentLeftItem.children
    property alias contentRight: contentRightItem.children
    property var decorations: [
        AdwHeaderBar.Icons.Minimize,
        AdwHeaderBar.Icons.Maximize,
        AdwHeaderBar.Icons.Close
    ]

    color: "#f6f5f4"
    height: 50

    Rectangle {
        // Margin
        color: "#c0bfbc"
        height: 1

        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
    }

    Item {
        anchors.fill: parent

        TapHandler {
            onDoubleTapped: window.toggleMaximized();
            gesturePolicy: TapHandler.DragThreshold
        }

        DragHandler {
            grabPermissions: TapHandler.CanTakeOverFromAnything
            onActiveChanged: if (active) {  window.startSystemMove(); }
        }

        Item {
            id: innerRow

            anchors {
                fill: parent
                leftMargin: 8
                rightMargin: 8
            }

            Item {
                id: contentLeftItem
                height: parent.height
                anchors {
                    left: parent.left
                    right: titleItem.left
                }
            }

            Text {
                id: titleItem
                text: title
                font.pointSize: 15
                anchors.centerIn: parent
            }

            Item {
                id: contentRightItem
                height: parent.height
                anchors {
                    left: titleItem.right
                    right: buttonsRow.left
                }
            }

            Row {
                id: buttonsRow
                anchors {
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }

                spacing: 6

                Repeater {
                    model: decorations
                    delegate: AdwRoundButton {
                        icon.name: iconName(modelData)
                        onPressed: {
                            switch (modelData) {
                            case AdwHeaderBar.Icons.Minimize:
                                window.showMinimized()
                                break;
                            case AdwHeaderBar.Icons.Maximize:
                                window.toggleMaximized()
                                break;
                            case AdwHeaderBar.Icons.Close:
                                window.close()
                                break;
                            }
                        }
                        Component.onCompleted: console.info(iconName(modelData))
                    }
                }
            }
        }
    }
}
