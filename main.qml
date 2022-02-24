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

            window: window

            contentLeft: AdwRoundButton {
                id: menuBtn
                anchors.verticalCenter: parent.verticalCenter
                icon.name: "open-menu-symbolic"
                onPressed: {
                    popover.open()
                }

                AdwPopover {
                    id: popover
                    x: -(width*0.5 - menuBtn.width*0.5)
                    y: menuBtn.height
                    height: 200
                    width: 100
                }
            }

            //                        contentRight: Rectangle {
            //                            height: parent.height
            //                            width: 100
            //                            color: "red"
            //                        }
        }

        StackLayout {
            id: pageStack

            Layout.fillHeight: true
            Layout.fillWidth: true

            Rectangle {
                color: "#ffffff"
            }

            Rectangle {
                color: "#e01b24"
            }
        }
    }
}
