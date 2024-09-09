//
//  ToolbarViewController.swift
//  UIKitBootcamp
//
//  Created by Yunus Emre Berdibek on 5.01.2024.
//

import UIKit

final class ToolbarViewController: UIViewController {
    private let toolbar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        return toolbar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(toolbar)
        addConstraints()
        setUpToolbar()
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            toolbar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            toolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            toolbar.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func setUpToolbar() {
        let bookmarksItem = UIBarButtonItem(image: UIImage(systemName: "bookmark"), style: .plain, target: nil, action: nil)
        let cameraItem = UIBarButtonItem(systemItem: .camera)
        let organizeItem = UIBarButtonItem(systemItem: .organize)
        let replyItem = UIBarButtonItem(systemItem: .reply)

        toolbar.items = [
            UIBarButtonItem.flexibleSpace(),
            bookmarksItem,
            UIBarButtonItem.flexibleSpace(),
            cameraItem,
            UIBarButtonItem.flexibleSpace(),
            organizeItem,
            UIBarButtonItem.flexibleSpace(),
            replyItem,
            UIBarButtonItem.flexibleSpace()
        ]
    }
}

#Preview {
    ToolbarViewController()
}
