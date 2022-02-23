import QtQuick 2.0
import QtQuick.Controls 2.12

RoundButton {
    id: btn
    hoverEnabled: true
    palette.button: hovered ? "#c0bfbc" : "#deddda"
    implicitHeight: 30
    implicitWidth: 30
}
