//
//  DortRenkViewController.swift
//  UIKitBootcamp
//
//  Created by Yunus Emre Berdibek on 4.01.2024.
//

import UIKit

final class DortRenkViewController: UIViewController {
    private let yellowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()

    private let redView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()

    private let blueView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()

    private let blackView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(yellowView, redView, blueView, blackView)
        addConstraints()
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            yellowView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            yellowView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            yellowView.widthAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.widthAnchor,
                multiplier: 0.5),
            yellowView.heightAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.heightAnchor,
                multiplier: 0.5),

            redView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            redView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            redView.heightAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.heightAnchor,
                multiplier: 0.5),
            redView.widthAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.widthAnchor,
                multiplier: 0.5),

            blueView.topAnchor.constraint(
                equalTo: yellowView.bottomAnchor),
            blueView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            blueView.widthAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.widthAnchor,
                multiplier: 0.5),
            blueView.heightAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.heightAnchor,
                multiplier: 0.5),

            blackView.topAnchor.constraint(
                equalTo: redView.bottomAnchor),
            blackView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            blackView.widthAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.widthAnchor,
                multiplier: 0.5),
            blackView.heightAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.heightAnchor,
                multiplier: 0.5),
        ])
    }
}

#Preview {
    DortRenkViewController()
}
