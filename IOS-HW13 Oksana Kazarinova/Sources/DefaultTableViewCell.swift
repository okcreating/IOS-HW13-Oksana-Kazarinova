//
//  DefaultTableViewCell.swift
//  IOS-HW13 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 20/05/2024.
//

import UIKit

class DefaultTableViewCell: UITableViewCell {

    static let identifier = "DefaultTableViewCell"

    var setting: Setting? {
        didSet {
            settingName.text = setting?.name.rawValue
            settingIcon = setting?.imageView ?? UIImageView()
            settingIcon.image = setting?.icon
            
        }
    }

   // MARK: - Outlets

    private var settingName: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()

    private var icon: UIImage = {
        let image = UIImage()
        //image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private var settingIcon: UIImageView = {
        let iconBG = UIImageView()
        iconBG.contentMode = .scaleToFill
        iconBG.clipsToBounds = true
        iconBG.layer.cornerRadius = 10
        iconBG.translatesAutoresizingMaskIntoConstraints = false
        return iconBG
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: DefaultTableViewCell.identifier)
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

//        addSubview(imageContainer)
//        imageContainer.addSubview(settingIcon)
    }

    private func setupLayout() {

    }

    // MARK: - Reuse
    
    override func prepareForReuse() {
        self.accessoryType = .none
    }
}
