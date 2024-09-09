//
//  IcIceAutoLayoutViewController.swift
//  UIKitBootcamp
//
//  Created by Yunus Emre Berdibek on 4.01.2024.
//

import UIKit

final class IcIceAutoLayoutViewController: UIViewController {
    private let bejView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(resource: .upViewBackground)
        return view
    }()

    private let whiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    private let cyanView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cyan
        return view
    }()

    private let blueView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()

    private let pinkView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemPink
        return view
    }()

    private let redView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()

    let yellowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        view.layer.cornerRadius = 50
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(bejView, redView, whiteView)
        redView.addSubview(yellowView)
        whiteView.addSubviews(cyanView)
        cyanView.addSubviews(blueView, pinkView)
        addConstraints()
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            bejView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            bejView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bejView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bejView.heightAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.15),

            whiteView.topAnchor.constraint(
                equalTo: bejView.bottomAnchor),
            whiteView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            whiteView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            whiteView.heightAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3),

            cyanView.centerXAnchor.constraint(
                equalTo: whiteView.centerXAnchor),
            cyanView.centerYAnchor.constraint(
                equalTo: whiteView.centerYAnchor),
            cyanView.widthAnchor.constraint(
                equalTo: whiteView.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            cyanView.heightAnchor.constraint(
                equalTo: whiteView.safeAreaLayoutGuide.heightAnchor, multiplier: 0.7),

            blueView.centerXAnchor.constraint(equalTo: cyanView.centerXAnchor, constant: -50),
            blueView.centerYAnchor.constraint(equalTo: cyanView.centerYAnchor),
            blueView.widthAnchor.constraint(equalTo: cyanView.widthAnchor, multiplier: 0.3),
            blueView.heightAnchor.constraint(equalTo: cyanView.heightAnchor, multiplier: 0.6),

            pinkView.centerYAnchor.constraint(equalTo: cyanView.centerYAnchor),
            pinkView.centerXAnchor.constraint(equalTo: cyanView.centerXAnchor, constant: 100),
            pinkView.widthAnchor.constraint(equalTo: cyanView.widthAnchor, multiplier: 0.3),
            pinkView.heightAnchor.constraint(equalTo: cyanView.heightAnchor, multiplier: 0.3),

            redView.topAnchor.constraint(equalTo: whiteView.bottomAnchor),
            redView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            redView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            redView.heightAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.heightAnchor,
                multiplier: 0.6),

            yellowView.centerXAnchor.constraint(
                equalTo: redView.centerXAnchor,
                constant: 50),
            yellowView.centerYAnchor.constraint(
                equalTo: redView.centerYAnchor,
                constant: -50),
            yellowView.widthAnchor.constraint(equalToConstant: 100),
            yellowView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}

#Preview {
    IcIceAutoLayoutViewController()
}
