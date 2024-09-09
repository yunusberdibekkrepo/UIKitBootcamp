//
//  MoviesViewController.swift
//  UIKitBootcamp2
//
//  Created by Yunus Emre Berdibek on 18.01.2024.
//

import UIKit

final class MoviesViewController: UIViewController {
    private let movies: [MovieModel] = [
        .init(image: "thepianist", name: "The Pianist", price: 567),
        .init(image: "thehatefuleight", name: "The Hateful Eight", price: 154),
        .init(image: "interstellar", name: "Interstellar", price: 112),
        .init(image: "inception", name: "Inception", price: 435),
        .init(image: "django", name: "Django", price: 122),
        .init(image: "birzamanlaranadoluda", name: "Bir Zamanlar Anadoluda", price: 321),
    ]

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.cellIdentifier)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpUI()
    }

    private func setUpUI() {
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        addConstraints()
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension MoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.cellIdentifier, for: indexPath) as! MovieCollectionViewCell
        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        cell.buttonAction = { [unowned self] value in
            let alertController = UIAlertController(title: "Sepete Eklendi! ", message: "\(value) isimli film sepete eklendi.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel)
            alertController.addAction(okAction)
            present(alertController, animated: true)
        }
        return cell
    }
}

extension MoviesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        let width = (bounds.width - 30) / 2
        return CGSize(width: width, height: width * 2.5)
    }
}

#Preview {
    MoviesViewController()
}
