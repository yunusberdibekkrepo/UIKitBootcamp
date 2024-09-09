//
//  ProductSelectionViewController.swift
//  UIKitBootcamp
//
//  Created by Yunus Emre Berdibek on 5.01.2024.
//

import UIKit

protocol ProductSelectionViewControllerProtocol {
    func didSelectProduct(name: String, image: String)
}

final class ProductSelectionViewController: UIViewController {
    var delegate: ProductSelectionViewControllerProtocol?

    private let iPadButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .tinted()
        button.configuration?.title = "iPad"
        button.configuration?.image = UIImage(systemName: "ipad")
        button.configuration?.imagePadding = 8
        button.configuration?.baseBackgroundColor = .systemBlue
        button.configuration?.baseForegroundColor = .systemBlue
        return button
    }()

    private let macbookButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .tinted()
        button.configuration?.title = "Macbook Pro"
        button.configuration?.image = UIImage(systemName: "macbook")
        button.configuration?.imagePadding = 8
        button.configuration?.baseBackgroundColor = .systemTeal
        button.configuration?.baseForegroundColor = .systemTeal
        return button
    }()

    private let iPhoneButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .tinted()
        button.configuration?.title = "iPhone"
        button.configuration?.image = UIImage(systemName: "iphone")
        button.configuration?.imagePadding = 8
        button.configuration?.baseBackgroundColor = .systemIndigo
        button.configuration?.baseForegroundColor = .systemIndigo
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubviews(iPadButton, iPhoneButton, macbookButton)
        addConstraints()
        setUpUI()
    }

    @objc
    private func iPadButtonAction() {
        delegate?.didSelectProduct(name: "iPad Air", image: "ipad")
        dismiss(animated: true)
    }

    @objc
    private func iPhoneButtonAction() {
        delegate?.didSelectProduct(name: "iPhone 14", image: "iphone")
        dismiss(animated: true)
    }

    @objc
    private func macbookButtonAction() {
        delegate?.didSelectProduct(name: "Macbook Pro", image: "macbook")
        dismiss(animated: true)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            iPhoneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iPhoneButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            iPhoneButton.widthAnchor.constraint(equalToConstant: 280),
            iPhoneButton.heightAnchor.constraint(equalToConstant: 50),

            iPadButton.topAnchor.constraint(equalTo: iPhoneButton.bottomAnchor, constant: 20),
            iPadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iPadButton.widthAnchor.constraint(equalToConstant: 280),
            iPadButton.heightAnchor.constraint(equalToConstant: 50),

            macbookButton.topAnchor.constraint(equalTo: iPadButton.bottomAnchor, constant: 20),
            macbookButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            macbookButton.widthAnchor.constraint(equalToConstant: 280),
            macbookButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    private func setUpUI() {
        iPhoneButton.addTarget(self, action: #selector(iPhoneButtonAction), for: .touchUpInside)
        iPadButton.addTarget(self, action: #selector(iPadButtonAction), for: .touchUpInside)
        macbookButton.addTarget(self, action: #selector(macbookButtonAction), for: .touchUpInside)
    }
}

#Preview {
    ProductSelectionViewController()
}
