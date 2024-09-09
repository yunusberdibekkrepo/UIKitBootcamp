//
//  LoginInViewController.swift
//  UIKitBootcamp
//
//  Created by Yunus Emre Berdibek on 5.01.2024.
//

import UIKit

final class LoginInViewController: UIViewController {
    private let logoView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(resource: .logInLogo)
        return image
    }()

    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Kullanıcı Adı"
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Şifre"
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let buttonView: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Giriş Yap", for: .normal)
        button.backgroundColor = .systemPink
        button.tintColor = .white
        button.layer.cornerRadius = 12
        return button
    }()

    private let helpLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "DESTEK?"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        view.backgroundColor = .purple
        view.addSubviews(logoView,
                         usernameTextField,
                         passwordTextField,
                         buttonView,
                         helpLabel)
        super.viewDidLoad()
        addConstraints()
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            usernameTextField.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 50),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),

            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 25),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),

            buttonView.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 25),
            buttonView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: 12),
            buttonView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -12),
            buttonView.heightAnchor.constraint(equalToConstant: 40),

            helpLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            helpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

#Preview {
    LoginInViewController()
}
