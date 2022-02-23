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
            Layout.preferredHeight: 50

            window: window

            contentLeft: AdwRoundButton {
                anchors.verticalCenter: parent.verticalCenter
                icon.name: "open-menu-symbolic"
            }

//            contentLeft: Rectangle {
//                anchors.fill: parent
//                color: "blue"
//            }
//            contentRight: Rectangle {
//                anchors.fill: parent
//                color: "red"
//            }
        }

        Rectangle {
            color: "#2ec27e"
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
