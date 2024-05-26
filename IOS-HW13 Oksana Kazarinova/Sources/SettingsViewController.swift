//
//  SettingsViewController.swift
//  IOS-HW13 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 20/05/2024.
//

import UIKit

class SettingsViewController: UIViewController {

    private var settings: [[Setting]]?

    // MARK: - Outlets

    private lazy var tableViewBuilding: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(DefaultTableViewCell.self, forCellReuseIdentifier: DefaultTableViewCell.identifier)
        tableView.register(Value1TableViewCell.self, forCellReuseIdentifier: Value1TableViewCell.identifier)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        settings = Setting.settings
        view.backgroundColor = .systemGray6
        title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setups
    
    private func setupHierarchy() {
        view.addSubview(tableViewBuilding)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableViewBuilding.topAnchor.constraint(equalTo: view.topAnchor),
            tableViewBuilding.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableViewBuilding.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableViewBuilding.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - Extension

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       50
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings?[section].count ?? 0
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return settings?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let setting = Setting.settings[indexPath.section][indexPath.row]
        switch setting.name {
        case .mobileData, .notifications, .soundAndHaptics, .focus, .screenTime, .general, .controlCentre, .displayAndBrightness, .homeScreen, .accessibility, .siriAndSearch, .faceIDAndPasscode, .emergencySOS, .explosureNotification, .battery, .privacyAndSecurity:
            let cell = tableViewBuilding.dequeueReusableCell(withIdentifier: DefaultTableViewCell.identifier, for: indexPath) as? DefaultTableViewCell
            cell?.setting = settings?[indexPath.section][indexPath.row]
            cell?.accessoryType = .disclosureIndicator
            return cell ?? UITableViewCell()
        case .wiFi, .blueTooth, .personalHotspot:
            let cell = tableViewBuilding.dequeueReusableCell(withIdentifier: Value1TableViewCell.identifier) as? Value1TableViewCell
            cell?.setting = settings?[indexPath.section][indexPath.row]
            cell?.accessoryType = .disclosureIndicator
            return cell ?? UITableViewCell()
        case .airPlaneMode:
            let cell = tableViewBuilding.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
            cell?.setting = settings?[indexPath.section][indexPath.row]
            return cell ?? UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = DetailView()
        tableView.deselectRow(at: indexPath, animated: true)
        viewController.setting = settings?[indexPath.section][indexPath.row]
        print("You pressed  \(settings?[indexPath.section][indexPath.row].name.rawValue ?? "unknown cell")")
        navigationController?.pushViewController(viewController, animated: true)
    }
}
