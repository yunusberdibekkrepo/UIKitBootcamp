//
//  CustomTableViewCell1.swift
//  UIKitBootcamp2
//
//  Created by Yunus Emre Berdibek on 15.01.2024.
//

import UIKit

class CustomTableViewCell1: UITableViewCell {
    static let identifier: String = "CustomTableViewCell1"

    var clickBtn: ((String) -> Void)?

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()

    private let tiklaButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .tinted()
        button.configuration?.title = "Click"
        button.configuration?.baseForegroundColor = .lightGray
        button.configuration?.baseBackgroundColor = .lightGray
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemBackground
        addSubview(nameLabel)
        addSubview(tiklaButton)
        addConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        nameLabel.text = nil
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            tiklaButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            tiklaButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            tiklaButton.heightAnchor.constraint(equalToConstant: 50),
            tiklaButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        tiklaButton.addTarget(self, action: #selector(tiklaAction), for: .touchUpInside)
    }

    @objc
    func tiklaAction() {
        clickBtn?(nameLabel.text ?? "No data")
    }

    func configure(name: String) {
        nameLabel.text = name
    }
}
