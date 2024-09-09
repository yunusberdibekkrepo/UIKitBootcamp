//
//  CustomCollectionViewController.swift
//  UIKitBootcamp2
//
//  Created by Yunus Emre Berdibek on 16.01.2024.
//

import UIKit

final class CustomCollectionViewController: UIViewController {
    private var countries: [String] = [
        "T.C.",
        "KKTC",
        "Azerbaycan",
        "Kazakistan",
        "Türkmenistan",
        "Tacikistan",
        "Özbekistan",
        "Kırgızistan",
        "Çeçenistan",
        "Çavuşistan",
        "Kırım",
        "Yakutistan",
        "Tataristan",
        "Tuva",
        "Adige Cumhuriyeti",
        "Kuzey Oseta",
        "Batı Trakya Türkleri",
        "Dağıstan",
        "Doğu Türkistan",
        "Gagauz",
        "Karakalpakistan",
        "Irak Türkmenleri",
        "Kabartay Balkay",
        "Kalmuk Cumhuriyeti",
        "Karaçay Çerkeş",
        "Mogalistan"
    ]

    private let collectionView: UICollectionView = {
        // Genel collection view tasarım alanı.
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        // Itemlerin yatayda aralarındaki boşluk.
        layout.minimumInteritemSpacing = .zero
        // Itemlerin dikeyde aralarındaki boşluk
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.cellIdentifier)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        addConstraints()
    }

    private func addConstraints() {
        collectionView.delegate = self
        collectionView.dataSource = self

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension CustomCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print(countries[indexPath.row])
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        countries.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.cellIdentifier, for: indexPath) as! CustomCollectionViewCell
        let country = countries[indexPath.row]
        cell.configure(value: country)
        return cell
    }
}

extension CustomCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        let width = (bounds.width - 30) / 2
        return CGSize(width: width, height: width * 1.5)
    }
}

#Preview {
    CustomCollectionViewController()
}
