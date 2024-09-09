//
//  CustomPickerViewController.swift
//  UIKitBootcamp2
//
//  Created by Yunus Emre Berdibek on 8.01.2024.
//

import UIKit

final class CustomPickerViewController: UIViewController {
    private let pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()

    private let sonucLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Sonuç: "
        return label
    }()

    private let gosterButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration?.title = "Goster"
        button.configuration?.baseBackgroundColor = .magenta
        button.configuration?.baseForegroundColor = .white
        return button
    }()

    private let randomStrings: [String] = [
        UUID().uuidString,
        UUID().uuidString,
        UUID().uuidString,
        UUID().uuidString,
        UUID().uuidString,
    ]

    @objc
    private func addAction() {}

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

    private func setUpUI() {
        view.backgroundColor = .systemBackground
        pickerView.delegate = self
        pickerView.dataSource = self
        view.addSubview(pickerView)
        view.addSubview(sonucLabel)
        view.addSubview(gosterButton)
        gosterButton.addTarget(self, action: #selector(addAction), for: .touchUpInside)
        addConstraints()
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            sonucLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            sonucLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            pickerView.topAnchor.constraint(equalTo: sonucLabel.bottomAnchor, constant: 50),
            pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pickerView.widthAnchor.constraint(equalToConstant: 300),
            pickerView.heightAnchor.constraint(equalToConstant: 300),

            gosterButton.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 50),
            gosterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gosterButton.widthAnchor.constraint(equalToConstant: 300),
            gosterButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

extension CustomPickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // Picker view sütun sayısı
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // Picker içindeki eleman sayısı
        return randomStrings.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // Picker içine veriler satır satır eklenir.
        return randomStrings[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sonucLabel.text = randomStrings[row]
    }
}

#Preview {
    CustomPickerViewController()
}
