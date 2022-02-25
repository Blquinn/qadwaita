import QtQuick 2.12
import QtQuick.Window 2.3

//import "./private"
//import Qt5Compat.GraphicalEffects 1.0
import Qt5Compat.GraphicalEffects 6.0

// TODO: Move grabbable edges to _outside_ of the visible window when not maximized.
// TODO: Grab icon shows when not actually over grabbable border.

Window {
    id: window
    visible: true
    flags: Qt.FramelessWindowHint
    color: "transparent"
    property int bw: 5

    default property alias children: childContainer.children

    // If a headerbar is double tapped, window should maximize.
    function toggleMaximized() {
        if (window.visibility === Window.Maximized) {
            window.showNormal()
        } else {
            window.showMaximized()
        }
    }

    // The mouse area is just for setting the right cursor shape
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: {
            const p = Qt.point(mouseX, mouseY)
            const b = bw + 10
            // Increase the corner size slightly
            if (p.x < b && p.y < b)
                return Qt.SizeFDiagCursor
            if (p.x >= width - b && p.y >= height - b)
                return Qt.SizeFDiagCursor
            if (p.x >= width - b && p.y < b)
                return Qt.SizeBDiagCursor
            if (p.x < b && p.y >= height - b)
                return Qt.SizeBDiagCursor
            if (p.x < b || p.x >= width - b)
                return Qt.SizeHorCursor
            if (p.y < b || p.y >= height - b)
                return Qt.SizeVerCursor
        }
        acceptedButtons: Qt.NoButton // don't handle actual events
    }

    DragHandler {
        id: resizeHandler
        grabPermissions: TapHandler.TakeOverForbidden
        target: null
        onActiveChanged: {
            if (active) {
                const p = resizeHandler.centroid.position
                const b = bw + 10
                // Increase the corner size slightly
                let e = 0
                if (p.x < b) {
                    e |= Qt.LeftEdge
                }
                if (p.x >= width - b) {
                    e |= Qt.RightEdge
                }
                if (p.y < b) {
                    e |= Qt.TopEdge
                }
                if (p.y >= height - b) {
                    e |= Qt.BottomEdge
                }
                window.startSystemResize(e)
            }
        }
    }

    Rectangle {
      id: rect
      anchors.fill: parent
      anchors.margins: window.visibility === Window.Maximized ? 0 : 10
      radius: window.visibility === Window.Maximized ? 0 : 16
    antialiasing: true

        Rectangle {
            id: coloredRect
            anchors.fill: parent
            radius: rect.radius
            antialiasing: true
            color: "#ffffff"
        }

        Item {
            anchors.fill: coloredRect
            layer.enabled: true
            layer.effect: OpacityMask {
                cached: true
                maskSource: coloredRect
            }
            Item {
                anchors.fill: parent
                id: childContainer
            }
        }

    }

    // TODO: You can see the line around the border. Fix this.
     DropShadow {
       anchors.fill: rect
       radius: 3
       source: rect
       transparentBorder: true
       spread: 0.2
       color: "black"
     }
}
