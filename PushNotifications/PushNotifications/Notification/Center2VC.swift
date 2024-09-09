//
//  ViewController3.swift
//  PushNotifications
//
//  Created by Yunus Emre Berdibek on 24.01.2024.
//

import UIKit

final class Center2VC: UIViewController {
    private let button1: UIButton = {
        let button = UIButton()
        button.configuration = .tinted()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration?.title = "Notification 1"
        button.configuration?.baseForegroundColor = .systemPink
        button.configuration?.baseBackgroundColor = .systemPink
        return button
    }()

    private let button2: UIButton = {
        let button = UIButton()
        button.configuration = .tinted()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration?.title = "Notification 2"
        button.configuration?.baseForegroundColor = .systemBlue
        button.configuration?.baseBackgroundColor = .systemBlue
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        view.backgroundColor = .systemBackground
        view.addSubview(button1)
        view.addSubview(button2)
        button1.addTarget(self, action: #selector(button1Action), for: .touchUpInside)
        button2.addTarget(self, action: #selector(button2Action), for: .touchUpInside)

        NSLayoutConstraint.activate([
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button1.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            button1.widthAnchor.constraint(equalToConstant: 300),
            button1.heightAnchor.constraint(equalToConstant: 50),

            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 100),
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.widthAnchor.constraint(equalToConstant: 300),
            button2.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    @objc
    private func button1Action() {
        NotificationCenter.default.post(name: .button1Notification, object: nil)
    }

    @objc
    private func button2Action() {
        NotificationCenter.default.post(name: .button2Notification, object: nil, userInfo: ["gelenMesaj": "Notification button 2", "tarih": Date()])
    }
}
