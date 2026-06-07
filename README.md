# StickyTrackerAI v0.0.4 — Patch Notes

## Overview

StickyTrackerAI **v0.0.4** introduces improvements focused on the visual interface, PID controller behavior, prediction system, capture performance, capture card compatibility, controller stability, and overall usability.

## Visual Interface Changes

The GUI has been visually redesigned to make the application more attractive, cleaner, and easier to configure.

### Changes

- Updated the overall visual style of the interface.
- Improved the layout of configuration panels.
- Made settings easier to identify and adjust.
- Improved the visual organization of the main sections.
- Improved readability across the interface.
- Made the configuration experience more intuitive and user-friendly.
- 
## Profile Visual Improvements

The profile area and background behavior when switching profiles have been visually improved.

### Changes

- Improved the visual background when changing profiles.
- Improved the readability of the profile selector text.
- Improved the appearance of profile-related UI elements.
- Reduced visual clutter around the active profile area.
- Made profile switching feel cleaner and more polished.

---

## PID Controller Improvements

The PID Controller has been improved to provide better control, stability, and smoother tracking behavior.

### Changes

- Improved PID correction behavior.
- Improved stability near the target.
- Reduced unwanted micro-movements.
- Added better control over PID strength.
- Added output limiting to reduce unstable or excessive corrections.
- Improved PID behavior across different capture FPS values.
- Added additional PID tuning values for more precise control.

### Added PID Values

- **PID Kp**
- **PID Kd**
- **PID Multiplier**
- **PID Output Limit**
- **PID Deadzone PX**
- **PID Windup Guard**

### Hidden PID Value

- **PID Ki** is kept hidden and fixed at `0.0`.

This keeps the PID system cleaner and avoids instability caused by integral accumulation.

## Prediction System Improvements

The prediction system has been updated with multiple prediction filters and simpler tuning controls.

### Changes

- Added multiple prediction filter modes.
- Improved prediction behavior for moving targets.
- Added prediction strength control.
- Added prediction smoothing control.
- Added prediction maximum lead control.
- Improved safety limits to reduce excessive prediction jumps.
- Simplified prediction tuning to make it easier to configure.

### Added Prediction Filters

- **Smooth Lead**
- **Linear Lead**
- **Acceleration Lead**
- **Kalman Lite**
- **Spring Damper**

### Added Prediction Settings

- **Prediction Strength**
- **Prediction Smoothing**
- **Prediction Max Lead**

## Target FPS Changes

More values have been added to the **Target FPS** selector.

### Changes

- Added more FPS options for better performance control.
- Added lower FPS values for users who want reduced system load.
- Improved flexibility when configuring capture performance.

### Added / Available Target FPS Values

- **30 FPS**
- **45 FPS**
- **60 FPS**
- **120 FPS**
- **144 FPS**
- **240 FPS**
- **280 FPS**
- **Unlimited**

## Capture Card Improvements

Capture card support has been improved, especially when using the **Media Foundation** backend.

### Changes

- Optimized frame time behavior with the Media Foundation backend.
- Improved capture card compatibility.
- Improved capture stability with more video capture devices.
- Improved handling of capture card FPS configuration.
- Improved capture behavior when matching GUI FPS with capture card output FPS.

## Media Foundation Backend Improvements

The **Media Foundation** backend has received frame time optimizations.

### Changes

- Improved frame time in Media Foundation mode.
- Improved stability with capture cards.
- Improved compatibility with different capture devices.
- Improved handling of video input formats.
- Improved capture performance consistency.

## Video Format Options

More **Video Format** options have been added for capture cards.

### Changes

- Added additional video format options.
- Improved compatibility with different capture card formats.
- Improved flexibility when selecting capture card input formats.
- Improved support for different capture device configurations.

## FOV Setting Relocation

The **FOV** setting has been moved next to **ROI Size**.

### Changes

- Moved FOV closer to ROI Size in the interface.
- Improved control over detection area settings.
- Made FOV and ROI tuning easier to manage together.
- Improved the organization of tracking-related configuration.

## PlayStation Controller Fixes

PlayStation controller support has been improved.

### Changes

- Fixed repeated disconnection issues with PS4 controllers.
- Fixed repeated disconnection issues with PS5 controllers.
- Improved PlayStation controller stability.
- Improved compatibility with PS4/PS5 controllers.
- Improved controller input handling.
- Improved reliability when using PlayStation controllers with virtual controller output.

## General Controller Compatibility Improvements

General controller compatibility has been improved across the application.

### Changes

- Improved physical controller handling.
- Improved virtual controller output stability.
- Improved controller state synchronization.
- Improved reliability during longer sessions.
- Improved compatibility between physical and virtual controller behavior.

## Version Summary

StickyTrackerAI **v0.0.4** includes:

- Visual GUI redesign.
- Improved profile visual behavior.
- Improved PID Controller.
- New PID tuning values.
- Hidden fixed PID Ki value.
- Improved prediction system.
- New prediction filters.
- New Target FPS values.
- Media Foundation frame time optimization.
- Improved capture card compatibility.
- Added video format options.
- FOV moved next to ROI Size.
- Improved PS4/PS5 controller stability.
- Improved general controller compatibility.

