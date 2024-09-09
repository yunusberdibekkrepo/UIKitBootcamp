//
//  TextFieldPickerViewController.swift
//  UIKitBootcamp2
//
//  Created by Yunus Emre Berdibek on 8.01.2024.
//

import UIKit

final class TextFieldPickerViewController: UIViewController {
    private let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Ülke seç"
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let toolbar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        toolbar.sizeToFit()
        return toolbar
    }()

    private let pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()

    private let ulkeler: [String] = [
        UUID().uuidString,
        UUID().uuidString,
        UUID().uuidString,
        UUID().uuidString,
        UUID().uuidString,
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

    @objc
    private func tamamButton() {
        view.endEditing(true)
    }

    @objc
    private func iptalButton() {
        textField.text = nil
        textField.placeholder = "Ülke seç"
        view.endEditing(true)
    }

    private func setUpUI() {
        view.backgroundColor = .systemBackground
        setUpTextField()
        setUpToolbar()
        addConstraints()
    }

    private func setUpTextField() {
        view.addSubview(textField)
        textField.inputView = pickerView
        pickerView.delegate = self
        pickerView.dataSource = self
    }

    private func setUpToolbar() {
        let tamamButton = UIBarButtonItem(title: "Tamam", style: .plain, target: self, action: #selector(tamamButton))
        let bosluk = UIBarButtonItem(systemItem: .flexibleSpace)
        let iptalButton = UIBarButtonItem(title: "İptal", style: .plain, target: self, action: #selector(iptalButton))
        toolbar.setItems([tamamButton, bosluk, iptalButton], animated: true)
        textField.inputAccessoryView = toolbar
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            textField.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

#Preview {
    TextFieldPickerViewController()
}

extension TextFieldPickerViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ulkeler.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ulkeler[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(ulkeler[row])
    }
}
