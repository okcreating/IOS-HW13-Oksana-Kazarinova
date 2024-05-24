//
//  Model.swift
//  IOS-HW13 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 20/05/2024.
//

import UIKit

enum SettingsName: String {
    case airPlaneMode = "Airplane Mode"
    case wiFi = "Wi-Fi"
    case blueTooth = "Bluetooth"
    case mobileData = "Mobile Data"
    case personalHotspot = "Personal Hotspot"
    case notifications = "Notifications"
    case soundAndHaptics = "Sounds & Haptics"
    case focus = "Focus"
    case screenTime = "Screen Time"
    case general = "General"
    case controlCentre = "ControlCentre"
    case displayAndBrightness = "Display & Brightness"
    case homeScreen = "Home Screen"
    case accessibility = "Accessibility"
    case siriAndSearch = "Siri & Search"
    case faceIDAndPasscode = "Face ID & Passcode"
    case emergencySOS = "Emergency SOS"
    case explosureNotification = "Explosure Notification"
    case battery = "Battery"
    case privacyAndSecurity = "Privacy & Security"
}

enum CellType {
    case defaultType
    case value1Type
    case customType
}

struct Setting: Hashable {
    var cellType: CellType
    var name: SettingsName
    var icon: UIImage
    var imageView: UIImageView
    var rightLabelText: String?
}

private func editIcon(imageName: String) -> UIImage {
    let icon = UIImage(systemName: imageName, withConfiguration: UIImage.SymbolConfiguration(pointSize: 45, weight: .medium, scale: .medium))?.withTintColor(.white, renderingMode: .automatic)
    return icon ?? UIImage()
}

private func setBGColor(color: UIColor) -> UIImageView{
    let imageView = UIImageView()
    imageView.backgroundColor = color
    return imageView
}

extension Setting {
    static var settings: [[Setting]] = [

        [Setting(cellType: .customType, name: .airPlaneMode, icon: editIcon(imageName: "plane"), imageView: setBGColor(color: .systemOrange)),
         Setting(cellType: .value1Type, name: .wiFi, icon: editIcon(imageName: "wifi"), imageView: setBGColor(color: .systemBlue), rightLabelText: "VM349678"),
         Setting(cellType: .value1Type, name: .blueTooth, icon: UIImage(named: "icons8-bluetooth-30") ?? UIImage(), imageView: setBGColor(color: .clear), rightLabelText: "On"),
         Setting(cellType: .defaultType, name: .mobileData, icon: editIcon(imageName: "antenna.radiowaves.left.and.right"), imageView: setBGColor(color: .systemGreen)),
         Setting(cellType: .value1Type, name: .personalHotspot, icon: editIcon(imageName: "personalhotspot"), imageView: setBGColor(color: .systemGreen), rightLabelText: "Off")],

        [Setting(cellType: .defaultType, name: .notifications, icon: editIcon(imageName: "bell.badge.fill"), imageView: setBGColor(color: .systemRed)),
         Setting(cellType: .defaultType, name: .soundAndHaptics, icon: editIcon(imageName: "speaker.wave.3.fill"), imageView: setBGColor(color: .systemRed)),
         Setting(cellType: .defaultType, name: .focus, icon: editIcon(imageName: "moon.fill"), imageView: setBGColor(color: .systemPurple)),
         Setting(cellType: .defaultType, name: .screenTime, icon: editIcon(imageName: "hourglass"), imageView: setBGColor(color: .systemPurple))],

        [Setting(cellType: .defaultType, name: .general, icon: editIcon(imageName: "gear"), imageView: setBGColor(color: .systemGray5)),
         Setting(cellType: .defaultType, name: .controlCentre, icon: editIcon(imageName: "switch.2"), imageView: setBGColor(color: .systemGray5)),
         Setting(cellType: .defaultType, name: .displayAndBrightness, icon: editIcon(imageName: "textformat.size"), imageView: setBGColor(color: .systemBlue)),
         Setting(cellType: .defaultType, name: .homeScreen, icon: UIImage(named: "Icona_Launchpad") ?? UIImage(), imageView: setBGColor(color: .clear)),
         Setting(cellType: .defaultType, name: .accessibility, icon: editIcon(imageName: "accessibility"), imageView: setBGColor(color: .systemBlue)),
         Setting(cellType: .defaultType, name: .siriAndSearch, icon: UIImage(named: "Apple-Siri.jpg.square_social") ?? UIImage(), imageView: setBGColor(color: .clear)),
         Setting(cellType: .defaultType, name: .faceIDAndPasscode, icon: editIcon(imageName: "faceid"), imageView: setBGColor(color: .systemGreen)),
         Setting(cellType: .defaultType, name: .emergencySOS, icon: editIcon(imageName: "sos"), imageView: setBGColor(color: .systemRed)),
         Setting(cellType: .defaultType, name: .explosureNotification, icon: editIcon(imageName: "circle.hexagongrid.fill"), imageView: setBGColor(color: .systemRed)),
         Setting(cellType: .defaultType, name: .battery, icon: editIcon(imageName: "battery.100percent"), imageView: setBGColor(color: .systemGreen)),
         Setting(cellType: .defaultType, name: .privacyAndSecurity, icon: editIcon(imageName: "hand.raised.fill"), imageView: setBGColor(color: .systemBlue))]
    ]
}
// airplane.circle.fill   airplane
// wifi.square.fill  V
//
// antenna.radiowaves.left.and.right
// personalhotspot

// bell.badge.fill
// speaker.wave.3.fill
// moon.fill
// hourglass

// gear
// switch.2
// textformat.size
//
// accessibility
//
//
// faceid
// sos
// circle.hexagongrid.fill
// battery.100percent
// hand.raised.square.fill



// 1.circle.fill
//#007AFF



