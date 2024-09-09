//
//  ViewController.swift
//  TableViewWithNib
//
//  Created by Yunus Emre Berdibek on 15.03.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    var strings: [String] = ["Alpha", "Beta", "Unlimited", "Revised"]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        strings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        cell.customImageView.image = UIImage(systemName: "square.fill")
        cell.customLabel.text = strings[indexPath.row]
        cell.configure(with: indexPath.row)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "testVC")
        vc.navigationItem.title = strings[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        152
    }
}
