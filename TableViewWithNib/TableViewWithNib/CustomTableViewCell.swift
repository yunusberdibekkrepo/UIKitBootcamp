//
//  CustomTableViewCell.swift
//  TableViewWithNib
//
//  Created by Yunus Emre Berdibek on 15.03.2024.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"

    @IBOutlet var customLabel: UILabel!
    @IBOutlet var customImageView: UIImageView!

    static func nib() -> UINib {
        return UINib(nibName: "CustomTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension CustomTableViewCell {
    public func configure(with index: Int) {
        switch index {
        case 0:
            customImageView.tintColor = .systemOrange
        case 1:
            customImageView.tintColor = .systemPink
        case 2:
            customImageView.tintColor = .systemYellow
        case 3:
            customImageView.tintColor = .systemBlue
        default:
            customImageView.tintColor = .systemBrown
        }
    }
}
