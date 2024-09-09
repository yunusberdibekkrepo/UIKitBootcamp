//
//  IlhemVerViewController.swift
//  UIKitBootcamp
//
//  Created by Yunus Emre Berdibek on 5.01.2024.
//

import UIKit

final class IlhemVerViewController: UIViewController {
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(resource: .steveJobs)
        image.contentMode = .scaleAspectFit
        return image
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.text = "Steve Jobs"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private let buttonView: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("İLHAM VER", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .red
        button.layer.cornerRadius = 12
        return button
    }()

    @objc
    private func ilhamVerButtonAction() {
        print("Action:")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubviews(imageView, nameLabel, descriptionLabel, buttonView)
        buttonView.addTarget(self, action: #selector(ilhamVerButtonAction), for: .touchUpInside)
        addConstraints()

        if let tabItems = tabBarController?.tabBar.items { // Bir vc içinden tab items değerlerini değiştirme.
            let productsVC = tabItems[1]
            productsVC.badgeValue = "99"
            productsVC.badgeColor = .yellow
        }
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),

            buttonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            buttonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            buttonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            buttonView.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

#Preview {
    IlhemVerViewController()
}
