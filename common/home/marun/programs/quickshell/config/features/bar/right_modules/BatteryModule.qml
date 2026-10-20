pragma ComponentBehavior: Bound

import QtQuick
import Quickshell.Services.UPower
import qs.components
import qs.services
import qs.config

ModuleShell {
    id: root
    readonly property int percentage: BatteryService.percentage
    readonly property bool lowBattery: percentage <= 30

    background: Rectangle {
        radius: 8
        color: root.lowBattery ? ColorsConfig.red_500 : ColorsConfig.blue_700
    }

    StyledText {
        text: {
            const currentBatteryLevel = root.percentage;
            const state = BatteryService.state;
            let prefix = "";
            if (state === UPowerDeviceState.FullyCharged) {
                prefix = "󱈑";
            } else if (state === UPowerDeviceState.Charging) {
                prefix = "󰂄";
            } else if (state === UPowerDeviceState.Empty) {
                prefix = "󱊡";
            } else if (state === UPowerDeviceState.Discharging) {
                const batteryLevelIndex = Math.floor(currentBatteryLevel / 10);
                const batteryIcons = ["󰂎" // 0%
                    , "󰁺" // 10%
                    , "󰁻" // 20%
                    , "󰁼" // 30%
                    , "󰁽" // 40%
                    , "󰁾" // 50%
                    , "󰁿" // 60%
                    , "󰂀" // 70%
                    , "󰂁" // 80%
                    , "󰂂" // 90%
                    , "󰁹", // 100%
                ];
                prefix = batteryIcons[batteryLevelIndex];
            } else {
                prefix = "󰂑";
            }
            return `${prefix} ${currentBatteryLevel}%`;
        }
        color: root.lowBattery ? ColorsConfig.blue_900 : ColorsConfig.foreground
    }
}
