//
//  AutoLayoutViewController.swift
//  UIKitBootcamp
//
//  Created by Yunus Emre Berdibek on 4.01.2024.
//

import UIKit

final class AutoLayoutViewController: UIViewController {
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(resource: .interstellar)
        return image
    }()

    private let button1: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Button 1", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 25
        return button
    }()

    private let button2: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Button 1", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .blue
        button.layer.cornerRadius = 12
        return button
    }()

    /*
     Bir görsel nesnenin yatayda ve dikeyde nerde olduğu,
     yükseklik ve genişliğin ne olduğu bilinmesi gerekir.
     Bunlardan bir tanesi eksik olursa hata alınır.
     */

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Selam"
        view.backgroundColor = .systemBackground
        view.addSubview(imageView)
        view.addSubview(button1)
        button1.addTarget(self, action: #selector(tappedFunc), for: .touchUpInside)
        view.addSubview(button2)
        addConstraints()
    }

    @objc
    private func tappedFunc() {
        print("Tapped")
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 400),

            button1.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button1.widthAnchor.constraint(equalToConstant: 200),
            button1.heightAnchor.constraint(equalToConstant: 50),

            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 50),
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.widthAnchor.constraint(equalToConstant: 200),
            button2.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

#Preview {
    AutoLayoutViewController()
}
