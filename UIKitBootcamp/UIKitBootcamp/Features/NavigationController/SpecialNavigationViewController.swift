//
//  SpecialNavigationViewController.swift
//  UIKitBootcamp
//
//  Created by Yunus Emre Berdibek on 5.01.2024.
//

import UIKit

final class SpecialNavigationViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(action))
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = "Title"
        navigationItem.prompt = "Prompt"

        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .red
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.green]

        navigationController?.navigationBar.tintColor = .yellow // change navigation item tint color.

        navigationController?.navigationBar.barStyle = .black // açıklama ve prompt kısmının rengini beyaz yapar.

        navigationController?.navigationBar.isTranslucent = false // nav bar daha koyu olur. Daha gerçeğe yakın.

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }

    @objc
    private func action() {
        print("Action")
    }
}
