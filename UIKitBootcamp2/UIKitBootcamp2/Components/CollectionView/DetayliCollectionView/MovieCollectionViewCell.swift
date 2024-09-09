//
//  MovieCollectionViewCell.swift
//  UIKitBootcamp2
//
//  Created by Yunus Emre Berdibek on 18.01.2024.
//

import UIKit

final class MovieCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier: String = "MovieCollectionViewCell"
    var buttonAction: ((String) -> Void)?

    private let movieImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        return view
    }()

    private let movieNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()

    private let moviePriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        return label
    }()

    private let addBasketButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .plain()
        button.configuration?.title = "Sepete Ekle"
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        setUpUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func prepareForReuse() {
        movieImageView.image = nil
        movieNameLabel.text = nil
        moviePriceLabel.text = nil
    }

    @objc
    private func addBasket() {
        buttonAction?(movieNameLabel.text ?? "ERROR!")
    }

    public func configure(with movie: MovieModel) {
        movieImageView.image = UIImage(named: movie.image)
        movieNameLabel.text = movie.name
        moviePriceLabel.text = "\(movie.price) ₺"
    }
}

extension MovieCollectionViewCell {
    private func setUpUI() {
        contentView.addSubview(movieImageView)
        contentView.addSubview(movieNameLabel)
        contentView.addSubview(moviePriceLabel)
        contentView.addSubview(addBasketButton)
        setUpLayer()
        addConstraints()
        addBasketButton.addTarget(self, action: #selector(addBasket), for: .touchUpInside)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1),
            movieImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.60),

            movieNameLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 12),
            movieNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            moviePriceLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 12),
            moviePriceLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            addBasketButton.topAnchor.constraint(equalTo: moviePriceLabel.bottomAnchor, constant: 12),
            addBasketButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }

    private func setUpLayer() {
        contentView.layer.cornerRadius = 12
        contentView.layer.shadowColor = UIColor.secondaryLabel.cgColor
        contentView.layer.cornerRadius = 4
        contentView.layer.shadowOffset = .init(width: -4, height: 4)
        contentView.layer.shadowOpacity = 0.3
    }
}
