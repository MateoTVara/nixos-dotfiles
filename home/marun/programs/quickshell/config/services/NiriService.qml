pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    property var workspaces: []
    property int activeWorkspace: -1
    property var switchToWorkspace: idx => {
        focusWorkspace.command = ["niri", "msg", "action", "focus-workspace", idx];
        focusWorkspace.running = true;
    }
    property var workspaceMap: ({})

    Process {
        id: niri

        running: true
        command: ["niri", "msg", "--json", "event-stream"]

        stdout: SplitParser {
            splitMarker: "\n"

            onRead: data => {
                if (!data.trim())
                    return;

                const event = JSON.parse(data);

                if (event.WorkspacesChanged) {
                    const workspaces = [...event.WorkspacesChanged.workspaces].sort((a, b) => a.idx - b.idx);

                    root.workspaces = workspaces;

                    const map = {};

                    for (const ws of workspaces) {
                        map[ws.id] = ws.idx;

                        if (ws.is_focused)
                            root.activeWorkspace = ws.idx;
                    }

                    root.workspaceMap = map;
                }

                if (event.WorkspaceActivated?.focused) {
                    const idx = root.workspaceMap[event.WorkspaceActivated.id];

                    if (idx !== undefined)
                        root.activeWorkspace = idx;
                }
            }
        }

        onExited: {
            console.log("Niri event stream died, restarting...");
            running = true;
        }
    }

    Process {
        id: focusWorkspace
    }
}
