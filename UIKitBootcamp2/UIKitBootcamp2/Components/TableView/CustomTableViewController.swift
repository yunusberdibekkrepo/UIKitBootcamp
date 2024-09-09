//
//  CustomTableViewController.swift
//  UIKitBootcamp2
//
//  Created by Yunus Emre Berdibek on 10.01.2024.
//

import UIKit

final class CustomTableViewController: UIViewController {
    // MARK: - Variables

    // MARK: - UI Components

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    private var countries: [String] = [
        "1.Türkiye Cumhuriyeti – T.C.",
        "2.Kuzey Kıbrıs Türk Cumhuriyeti – KKTC",
        "3.Azerbaycan",
        "4.Kazakistan",
        "5.Türkmenistan",
        "6.Tacikistan",
        "7.Özbekistan",
        "8.Kırgızistan",
        "9.Başkurdistan",
        "10.Çeçenistan",
        "11.Çavuşistan",
        "12.Kırım",
        "13.Yakutistan",
        "14.Tataristan",
        "15.Tuva",
        "16.Adige Cumhuriyeti",
        "17.Kuzey Oseta",
        "18.Batı Trakya Türkleri",
        "19.Dağıstan",
        "20.Doğu Türkistan",
        "21.Gagauz",
        "22.Karakalpakistan",
        "23.Irak Türkmenleri",
        "24.Kabartay Balkay",
        "25.Kalmuk Cumhuriyeti",
        "26.Karaçay Çerkeş",
        "27.Mogalistan"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

    private func setUpUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        addConstraints()
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension CustomTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(countries[indexPath.row])
    }
}

extension CustomTableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if #available(iOS 14.0, *) {
            var content = cell.defaultContentConfiguration()
            content.text = countries[indexPath.row]
            cell.contentConfiguration = content
        } else {
            cell.textLabel?.text = countries[indexPath.row]
        }
        return cell
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { _, _, _ in
            self.countries.remove(at: indexPath.row)
            tableView.reloadData()
        }
        let duzenleAction = UIContextualAction(style: .normal, title: "Duzenle") { _, _, _ in
            print("\(self.countries[indexPath.row]) düzenlendi.")
        }
        return UISwipeActionsConfiguration(actions: [silAction, duzenleAction])
    }
}

#Preview {
    CustomTableViewController()
}
