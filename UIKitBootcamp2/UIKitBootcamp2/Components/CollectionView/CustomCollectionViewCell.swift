//
//  CustomCollectionViewCell.swift
//  UIKitBootcamp2
//
//  Created by Yunus Emre Berdibek on 17.01.2024.
//

import UIKit

final class CustomCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier: String = "CustomCollectionViewCell"

    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .magenta
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(label)
        addConstraints()
        setUpLayer()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func prepareForReuse() {
        label.text = nil
    }

    public func configure(value: String) {
        label.text = value
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    private func setUpLayer() {
        contentView.layer.cornerRadius = 8
        contentView.layer.shadowColor = UIColor.secondaryLabel.cgColor
        contentView.layer.cornerRadius = 4
        contentView.layer.shadowOffset = .init(width: -4, height: 4)
        contentView.layer.shadowOpacity = 0.3
    }
}
