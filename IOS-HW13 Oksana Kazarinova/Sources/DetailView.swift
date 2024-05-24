//
//  DetailView.swift
//  IOS-HW13 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 21/05/2024.
//

import UIKit

class DetailView: UIViewController {

    var onTapped: (() -> Void)? // передача данных

    var detail: Setting? {
        didSet {

        }
    }

    private lazy var message: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.borderWidth = 2
        label.translatesAutoresizingMaskIntoConstraints = false
       // label.text = "
        return label
    }()

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
