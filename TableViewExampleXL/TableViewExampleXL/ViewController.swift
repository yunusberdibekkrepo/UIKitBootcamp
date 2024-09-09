//
//  ViewController.swift
//  TableViewExampleXL
//
//  Created by Yunus Emre Berdibek on 20.02.2024.
//

import UIKit

final class ViewController: UIViewController {
    private let sectionModels = [
        [
            SectionModel(
                backgroundColor: .gray,
                systemImage: "gear",
                title: "Genel"),
            SectionModel(
                backgroundColor: .systemBlue,
                systemImage: "accessibility",
                title: "Erişilebilirlik"),
            SectionModel(
                backgroundColor: .systemBlue,
                systemImage: "hand.raised.fill",
                title: "Gizlilik ve Güvenlik"),
        ],
        [
            SectionModel(
                backgroundColor: .systemGray,
                systemImage: "key.fill",
                title: "Parolalar"),
        ],
        [
            SectionModel(
                backgroundColor: .lightGray,
                systemImage: "safari.fill",
                title: "Safari"),
            SectionModel(
                backgroundColor: .lightGray,
                systemImage: "newspaper.fill",
                title: "News"),
            SectionModel(
                backgroundColor: .lightGray,
                systemImage: "textformat.abc",
                title: "Çeviri"),
            SectionModel(
                backgroundColor: .lightGray,
                systemImage: "map.fill",
                title: "Harita"),
            SectionModel(
                backgroundColor: .lightGray,
                systemImage: "cross.case.fill",
                title: "Sağlık"),
            SectionModel(
                backgroundColor: .lightGray,
                systemImage: "photo.circle",
                title: "Fotoğraflar"),
        ],
        [
            SectionModel(
                backgroundColor: .lightGray,
                systemImage: "ellipsis.curlybraces",
                title: "Geliştirici"),
        ],
    ]

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .secondarySystemBackground
        tableView.register(CustomSectionCell.self, forCellReuseIdentifier: CustomSectionCell.reuseIdentifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        title = "Ayarlar"
        prepareTableView()
    }

    private func prepareTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            tableView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: tableView.trailingAnchor, multiplier: 2),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionModels.count
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        return view
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionModels[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomSectionCell.reuseIdentifier, for: indexPath) as? CustomSectionCell else {
            fatalError()
        }
        let sectionModel: SectionModel = sectionModels[indexPath.section][indexPath.row]

        cell.configure(sectionModel: sectionModel)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

#Preview {
    ViewController()
}
