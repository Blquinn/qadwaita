import QtQuick 2.0
import QtQuick.Controls 2.12

RoundButton {
    id: btn
    hoverEnabled: true
    implicitHeight: 25
    implicitWidth: 25

    background: Rectangle {
        color: btn.hovered ? "#c0bfbc" : "#deddda"
        height: btn.implicitHeight
        width: btn.implicitWidth
        radius: width*0.5
    }
}
