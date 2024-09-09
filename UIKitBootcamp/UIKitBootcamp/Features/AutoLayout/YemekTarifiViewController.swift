//
//  YemekTarifiViewController.swift
//  UIKitBootcamp
//
//  Created by Yunus Emre Berdibek on 5.01.2024.
//

import UIKit

final class YemekTarifiViewController: UIViewController {
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(resource: .yemek)
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .red
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.text = "Tavuk Izgara"
        label.textAlignment = .left
        return label
    }()

    private let descLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()

    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sonraki Tarif", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 12
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubviews(imageView, titleLabel, descLabel, nextButton)
        addConstraints()
        nextButton.addTarget(self, action: #selector(function), for: .touchDown)
    }

    @IBAction
    func function() {
        let vc = DortRenkViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.39),

            titleLabel.topAnchor.constraint(
                equalTo: imageView.bottomAnchor,
                constant: 10),
            titleLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 16),
            titleLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -16),

            descLabel.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: 12),
            descLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 16),
            descLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -16),

            nextButton.topAnchor.constraint(
                equalTo: descLabel.bottomAnchor,
                constant: 24),
            nextButton.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            nextButton.widthAnchor.constraint(
                equalTo: view.widthAnchor,
                multiplier: 0.7),
            nextButton.heightAnchor.constraint(
                equalToConstant: 50),
        ])
    }
}

#Preview {
    YemekTarifiViewController()
}
