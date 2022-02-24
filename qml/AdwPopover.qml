import QtQuick 2.0
import QtQuick.Shapes 1.12
import QtQuick.Controls 2.0

Popup {
    id: item
    default property alias children: childContainer.children

    padding: 0
    modal: true
    dim: false

    property int borderWidth: 1
    property string borderColor: "#c0bfbc"
    property string color: "#ffffff"

    background: Item {
        anchors.fill: parent

    Shape {
        id: arrow
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }
        width: 15
        height: 15

        ShapePath {
            strokeWidth: item.borderWidth
            strokeColor: item.borderColor
            fillColor: item.color
            startX: 0; startY: arrow.height
            PathLine { x: 0; y: arrow.height }
            PathLine { x: arrow.width/2; y: 0 }
            PathLine { x: arrow.width; y: arrow.height }
        }
    }

    // Content Rect
    Rectangle {
        id: childContainer

        z: -1 // Triangle overlaps the top border of the rect.

        width: parent.width
        radius: 16

        border {
            width: item.borderWidth
            color: item.borderColor
        }

        anchors {
            top: arrow.bottom
            bottom: parent.bottom
            topMargin: -item.borderWidth
        }

        color: item.color
    }
    }
}
