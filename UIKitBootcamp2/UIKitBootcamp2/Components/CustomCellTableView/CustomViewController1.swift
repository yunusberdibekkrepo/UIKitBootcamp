//
//  CustomViewController1.swift
//  UIKitBootcamp2
//
//  Created by Yunus Emre Berdibek on 15.01.2024.
//

import UIKit

class CustomViewController1: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let kisiler = [
        "Yunus", "Ahmet", "Meryem", "Elif", "Murat", "Tarık", "Fatma", "Rahime", "Mehmet", "Sümeyye",
    ]

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomTableViewCell1.self, forCellReuseIdentifier: CustomTableViewCell1.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addConstraints()
    }

    private func addConstraints() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        kisiler.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell1.identifier, for: indexPath) as! CustomTableViewCell1
        cell.contentView.isUserInteractionEnabled = false
        let kisi = kisiler[indexPath.row]

        cell.configure(name: kisi)
        cell.clickBtn = { [unowned self] name in
            let alert = UIAlertController(title: "Clicled", message: "Name: \(name)", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func didTapCell(name: String) {
        print(name)
    }
}

#Preview {
    CustomViewController1()
}
