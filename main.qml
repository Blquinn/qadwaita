import QtQuick 2.12
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

import "./qml"

AdwWindow {
    id: window
    width: 640
    height: 480
    minimumHeight: 300
    minimumWidth: 400
    title: qsTr("Adwaita Demo")

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        AdwHeaderBar {
            id: headerBar
            title: "QAdwaita Test"

            Layout.fillWidth: true
//            Layout.preferredHeight: 50

            window: window

            contentLeft: AdwRoundButton {
                anchors.verticalCenter: parent.verticalCenter
                icon.name: "open-menu-symbolic"
                onPressed: {
                    if (pageStack.currentIndex === pageStack.count - 1) {
                        pageStack.currentIndex = 0
                    } else {
                        pageStack.currentIndex++
                    }
                }
            }

            //            contentLeft: Rectangle {
            //                anchors.fill: parent
            //                color: "blue"
            //            }
                        contentRight: Rectangle {
                            height: parent.height
                            width: 100
//                            anchors.fill: parent
                            color: "red"
                        }
        }

        StackLayout {
            id: pageStack

            Layout.fillHeight: true
            Layout.fillWidth: true

            Rectangle {
                color: "#33d17a"
            }

            Rectangle {
                color: "#e01b24"
            }
        }
    }
}
