//
//  ViewController.swift
//  TableViewProject
//
//  Created by Yunus Emre Berdibek on 7.02.2024.
//

import UIKit

struct TodoGroup {
    let title: String
    var todos: [String]
}

class ViewController: UIViewController {
    private let todos: [TodoGroup] = [
        .init(title: "First", todos: [
            UUID().uuidString,
            UUID().uuidString,
            UUID().uuidString,
            UUID().uuidString,
            UUID().uuidString,
        ]),
        .init(title: "Second", todos: [
            UUID().uuidString,
            UUID().uuidString,
            UUID().uuidString,
        ]),
    ]

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .systemBackground
        tableView.separatorColor = .systemGray
        tableView.register(CellHeader.self, forHeaderFooterViewReuseIdentifier: CellHeader.identifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.allowsSelection = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpTableView()
    }

    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.tableHeaderView = TableViewHeaderView(frame: CGRect(x: .zero, y: .zero, width: view.frame.width, height: 144))
        tableView.tableFooterView = TableViewFooterView(frame: CGRect(x: .zero, y: .zero, width: view.frame.width, height: 144))

        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0.0
        }

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        todos.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CellHeader.identifier) as? CellHeader else {
            fatalError()
        }
        let headerTitle = todos[section].title
        header.configure(with: headerTitle)
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        return view
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 55
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todos[section].todos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = todos[indexPath.section].todos[indexPath.row]
        return cell
    }
}

final class CellHeader: UITableViewHeaderFooterView {
    static let identifier: String = "CellHeader"

    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.text = "Title"
        return label
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUp()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    public func configure(with text: String) {
        label.text = text
    }

    private func setUp() {
        let bView = UIView()
        bView.backgroundColor = .lightGray
        backgroundView = bView

        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}

final class TableViewHeaderView: UIView {
    private let labelsStackView: UIStackView = {
        let stackView: UIStackView = .init()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 4
        return stackView
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .yellow
        imageView.image = UIImage(systemName: "sun.max.fill")
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.systemTeal
        setUpLabelsStackView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    private func setUpLabelsStackView() {
        let labels = ["Bankey", "Good morning,", "Jonathan", "Date"]

        addSubview(labelsStackView)
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        for x in 0 ..< labels.count {
            let label = createLabel(index: x, title: labels[x])
            labelsStackView.addArrangedSubview(label)
        }

        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            labelsStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),

            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            imageView.widthAnchor.constraint(equalToConstant: 100),
        ])
    }

    private func createLabel(index: Int, title: String) -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.text = title
        label.font = UIFont.preferredFont(forTextStyle: index == 0 ? .largeTitle : .body)
        return label
    }
}

final class TableViewFooterView: UIView {
    private let labelsStackView: UIStackView = {
        let stackView: UIStackView = .init()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 4
        return stackView
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        imageView.image = UIImage(systemName: "moon.fill")
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.lightGray
        setUpLabelsStackView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    private func setUpLabelsStackView() {
        let labels = ["Bankey", "Good night,", "Jonathan", "Date"]

        addSubview(labelsStackView)
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        for x in 0 ..< labels.count {
            let label = createLabel(index: x, title: labels[x])
            labelsStackView.addArrangedSubview(label)
        }

        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            labelsStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),

            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            imageView.widthAnchor.constraint(equalToConstant: 100),
        ])
    }

    private func createLabel(index: Int, title: String) -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.text = title
        label.font = UIFont.preferredFont(forTextStyle: index == 0 ? .largeTitle : .body)
        return label
    }
}
