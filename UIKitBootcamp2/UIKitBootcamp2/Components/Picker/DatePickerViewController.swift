//
//  DatePickerViewController.swift
//  UIKitBootcamp2
//
//  Created by Yunus Emre Berdibek on 7.01.2024.
//

import UIKit

final class DatePickerViewController: UIViewController {
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Date: "
        return label
    }()

    private let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .inline
        picker.locale = .current
        picker.date = .now
        picker.maximumDate = .distantFuture
        picker.minimumDate = .now
        return picker
    }()

    private var flagView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(resource: .turkey)
        view.contentMode = .scaleAspectFill
        return view
    }()

    private var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }

    @objc
    private func getSelectedDate() {
        dateLabel.text = formatter.string(from: datePicker.date)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

    private func setUpUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(datePicker)
        view.addSubview(dateLabel)
        addConstraints()
        datePicker.addTarget(self, action: #selector(getSelectedDate), for: .valueChanged)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}

#Preview {
    DatePickerViewController()
}
