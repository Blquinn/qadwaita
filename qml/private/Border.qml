import QtQuick 2.0

Rectangle {
    property int lBorderWidth: 1
    property int rBorderWidth: 1
    property int tBorderWidth: 1
    property int bBorderWidth: 1
    property int commonBorderWidth: 0

    z: -1

    anchors {
        left: parent.left
        right: parent.right
        top: parent.top
        bottom: parent.bottom

        topMargin: commonBorderWidth > 0 ? -commonBorderWidth : -tBorderWidth
        bottomMargin: commonBorderWidth > 0 ? -commonBorderWidth : -bBorderWidth
        leftMargin: commonBorderWidth > 0 ? -commonBorderWidth : -lBorderWidth
        rightMargin: commonBorderWidth > 0 ? -commonBorderWidth : -rBorderWidth
    }

    Component.onCompleted: {
        console.info(
                    height,
                    width,
                    anchors.topMargin,
                    anchors.leftMargin,
                    anchors.bottomMargin,
                    anchors.rightMargin,
                     )
    }
}
