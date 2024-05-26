//
//  DetailView.swift
//  IOS-HW13 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 21/05/2024.
//

import UIKit

class DetailView: UIViewController {

    var setting: Setting? {
        didSet {
            message.text = "Thank you. You pressed \(setting?.name.rawValue ?? "unknown thing")."
            view.backgroundColor = setting?.imageView.backgroundColor
        }
    }

    // MARK: - Outlets

     private var message: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup

    private func setupHierarchy() {
        view.addSubview(message)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            message.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            message.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            message.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            message.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)])
    }
}
