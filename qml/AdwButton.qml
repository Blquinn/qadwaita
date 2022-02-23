import QtQuick 2.0
import QtQuick.Controls 2.12

Button {
    id: btn
    hoverEnabled: true

    enum Style {
        Square,
        Pill,
        Round
    }

    property var style: AdwButton.Style.Square

    background: Rectangle {
        color: btn.hovered ? "#9a9996" : "#c0bfbc"

        height: btn.height
        radius: height * 0.5
        width: height
    }
}
