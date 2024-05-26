//
//  CustomTableViewCell.swift
//  IOS-HW13 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 20/05/2024.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let identifier = "CustomTableViewCell"

    var setting: Setting? {
        didSet {
            settingName.text = setting?.name.rawValue
            settingIcon.backgroundColor = setting?.imageView.backgroundColor
            settingIcon.image = setting?.icon
        }
    }

    // MARK: - Outlets

     private var settingName: UILabel = {
         let name = UILabel()
         name.font = UIFont.systemFont(ofSize: 18, weight: .regular)
         name.translatesAutoresizingMaskIntoConstraints = false
         return name
     }()

     private var icon: UIImage = {
         let image = UIImage()
         return image
     }()

     private var settingIcon: UIImageView = {
         let iconBG = UIImageView()
         iconBG.contentMode = .scaleAspectFit
         iconBG.clipsToBounds = true
         iconBG.layer.masksToBounds = true
         iconBG.layer.cornerRadius = 5
         iconBG.translatesAutoresizingMaskIntoConstraints = false
         return iconBG
     }()

    private lazy var switchOnTheRight: UISwitch = {
        let switcher = UISwitch()
        switcher.setOn(false, animated: true)
        switcher.addTarget(self, action: #selector(switchOnOff), for: .valueChanged)
        switcher.translatesAutoresizingMaskIntoConstraints = false
        return switcher
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups

    private func setupHierarchy() {
        addSubview(settingName)
        addSubview(settingIcon)
        addSubview(switchOnTheRight)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            settingIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            settingIcon.topAnchor.constraint(equalTo: self.topAnchor, constant: 6),
            settingIcon.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6),
            settingIcon.widthAnchor.constraint(equalToConstant: 35),
            settingIcon.heightAnchor.constraint(equalToConstant: 35),

            settingName.leadingAnchor.constraint(equalTo: settingIcon.trailingAnchor, constant: 20),
            settingName.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            settingName.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),

           switchOnTheRight.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            switchOnTheRight.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            switchOnTheRight.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }

    // MARK: - Actions

    @objc
    func switchOnOff() { }

    // MARK: - Reuse
    
    override func prepareForReuse() {
        self.accessoryType = .none
    }
}
