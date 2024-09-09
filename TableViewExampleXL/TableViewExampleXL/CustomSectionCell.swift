//
//  FirstTypeSectionCell.swift
//  TableViewExampleXL
//
//  Created by Yunus Emre Berdibek on 20.02.2024.
//

import UIKit

final class CustomSectionCell: UITableViewCell {
    static let reuseIdentifier: String = "FirstTypeSectionCell"

    private let sfImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.textAlignment = .left
        label.textColor = .label
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareCell()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension CustomSectionCell {
    private func prepareCell() {
        accessoryType = .disclosureIndicator
        layer.cornerRadius = 5
        clipsToBounds = true

        prepareImageView()
        prepareTitleLabel()
    }

    private func prepareImageView() {
        addSubview(sfImageView)

        NSLayoutConstraint.activate([
            sfImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            sfImageView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            sfImageView.widthAnchor.constraint(equalToConstant: 32),
            sfImageView.heightAnchor.constraint(equalToConstant: 32),
        ])
    }

    private func prepareTitleLabel() {
        addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 1),
            titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.82),
        ])
    }

    public func configure(sectionModel: SectionModel) {
        sfImageView.backgroundColor = sectionModel.backgroundColor
        sfImageView.image = UIImage(systemName: sectionModel.systemImage)
        sfImageView.tintColor = .white
        titleLabel.text = sectionModel.title
    }
}
