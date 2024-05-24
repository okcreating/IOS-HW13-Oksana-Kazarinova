//
//  Value1TableViewCell.swift
//  IOS-HW13 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 20/05/2024.
//

import UIKit

class Value1TableViewCell: UITableViewCell {

    static let identifier = "Value1TableViewCell"
    var setting: Setting? {
        didSet {
            settingName.text = setting?.name.rawValue
            settingIcon = setting?.imageView ?? UIImageView()
            settingIcon.image = setting?.icon
            labelOnTheRight.text = setting?.rightLabelText
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

    private lazy var labelOnTheRight: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

     // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: Value1TableViewCell.identifier)
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
        addSubview(labelOnTheRight)
        settingIcon.addSubview(icon)
    }

    private func setupLayout() {

    }

    // MARK: - Reuse
    
    override func prepareForReuse() {
        self.accessoryType = .none
    }
}
