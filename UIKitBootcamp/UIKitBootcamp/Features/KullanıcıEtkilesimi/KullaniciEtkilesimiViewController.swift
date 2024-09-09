//
//  KullaniciEtkilesimiViewController.swift
//  UIKitBootcamp
//
//  Created by Yunus Emre Berdibek on 7.01.2024.
//

import UIKit

final class KullaniciEtkilesimiViewController: UIViewController {
    private let alertButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .tinted()
        button.configuration?.title = "Show alert"
        button.configuration?.baseBackgroundColor = .magenta
        button.configuration?.baseForegroundColor = .magenta
        return button
    }()
    
    private let actionSheetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .tinted()
        button.configuration?.title = "Show action sheet"
        button.configuration?.baseBackgroundColor = .blue
        button.configuration?.baseForegroundColor = .blue
        return button
    }()
    
    private let specialAlertButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .tinted()
        button.configuration?.title = "Show special alert"
        button.configuration?.baseBackgroundColor = .red
        button.configuration?.baseForegroundColor = .red
        return button
    }()
    
    @objc
    private func showAlert() {
        let alertController = UIAlertController(title: "Alert", message: "Message", preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "Cancel", style: .destructive)
        let okButton = UIAlertAction(title: "Ok", style: .default)
        
        alertController.addAction(okButton)
        alertController.addAction(cancelButton)
        present(alertController, animated: true)
    }
    
    @objc
    private func showSpecialAlert() {
        let alertController = UIAlertController(title: "Alert", message: "Message", preferredStyle: .alert)
        alertController.addTextField { textfield in
            textfield.placeholder = "Email"
            textfield.keyboardType = .emailAddress
        }
        alertController.addTextField { textfield in
            textfield.placeholder = "Password"
            textfield.keyboardType = .default
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .destructive)
        let okButton = UIAlertAction(title: "Ok", style: .default) { _ in
            let alinanEmail = alertController.textFields?.first as? UITextField
            let alinanPassword = alertController.textFields?.last as? UITextField
            
            guard let alinanEmail, let alinanPassword else { return }
            print("Email: \(alinanEmail.text ?? ""), Password: \(alinanPassword.text ?? "")")
        }
        
        alertController.addAction(okButton)
        alertController.addAction(cancelButton)
        present(alertController, animated: true)
    }
    
    @objc
    private func showActionSheet() {
        let alertController = UIAlertController(title: "Alert", message: "Message", preferredStyle: .actionSheet)
        let cancelButton = UIAlertAction(title: "Cancel", style: .destructive)
        let okButton = UIAlertAction(title: "Ok", style: .default)
        
        alertController.addAction(okButton)
        alertController.addAction(cancelButton)
        present(alertController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpUI()
    }
    
    private func setUpUI() {
        view.addSubviews(alertButton, actionSheetButton, specialAlertButton)
        addConstraints()
        alertButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        actionSheetButton.addTarget(self, action: #selector(showActionSheet), for: .touchUpInside)
        specialAlertButton.addTarget(self, action: #selector(showSpecialAlert), for: .touchUpInside)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alertButton.widthAnchor.constraint(equalToConstant: 300),
            alertButton.heightAnchor.constraint(equalToConstant: 50),
            
            actionSheetButton.topAnchor.constraint(equalTo: alertButton.bottomAnchor, constant: 100),
            actionSheetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionSheetButton.widthAnchor.constraint(equalToConstant: 300),
            actionSheetButton.heightAnchor.constraint(equalToConstant: 50),
            
            specialAlertButton.topAnchor.constraint(equalTo: actionSheetButton.bottomAnchor, constant: 100),
            specialAlertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            specialAlertButton.widthAnchor.constraint(equalToConstant: 300),
            specialAlertButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

#Preview {
    KullaniciEtkilesimiViewController()
}
