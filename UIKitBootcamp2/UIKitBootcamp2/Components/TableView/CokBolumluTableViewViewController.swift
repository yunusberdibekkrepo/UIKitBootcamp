//
//  CokBolumluTableViewViewController.swift
//  UIKitBootcamp2
//
//  Created by Yunus Emre Berdibek on 13.01.2024.
//

import UIKit

final class CokBolumluTableViewViewController: UIViewController {
    // MARK: - Variables

    private let bolumler: [String] = [
        "Meyveler",
        "Renkler",
        "Mevsimler"
    ]

    private let bolumVerileri = [
        ["Elma", "Armut", "Muz", "Çilek"],
        ["Kırmızı", "Mavi", "Yeşil"],
        ["Yaz", "Kış"]
    ]

    // MARK: -  UI Components

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

    private func setUpUI() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        addConstraints()
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension CokBolumluTableViewViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(bolumVerileri[indexPath.section][indexPath.row])
    }
}

extension CokBolumluTableViewViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Her bölümdeki eleman sayısı
        bolumVerileri[section].count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        // Bölüm sayısı
        bolumler.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return bolumler[section]
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if #available(iOS 14.0, *) {
            var content = cell.defaultContentConfiguration()
            // [00], [01], [02], [03] | [10], [11], [12] | [20], [21], [22] : Önce section sonra index.
            content.text = bolumVerileri[indexPath.section][indexPath.row]

            cell.contentConfiguration = content
        } else {
            cell.textLabel?.text = "111"
        }
        return cell
    }
}

#Preview {
    CokBolumluTableViewViewController()
}
