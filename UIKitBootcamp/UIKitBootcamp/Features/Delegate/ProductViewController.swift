//
//  ProductViewController.swift
//  UIKitBootcamp
//
//  Created by Yunus Emre Berdibek on 5.01.2024.
//

import UIKit

final class ProductViewController: UIViewController {
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = .allProducts
        return imageView
    }()
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Apple Product line"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textColor = .darkGray
        return label
    }()
    
    private let chooseProductButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .tinted()
        button.configuration?.title = "Choose Product"
        button.configuration?.image = UIImage(systemName: "apple.logo")
        button.configuration?.imagePadding = 8
        return button
    }()
    
    @objc
    private func presentProductSelectionVC() {
        let destinationVC = ProductSelectionViewController()
        destinationVC.delegate = self
        destinationVC.modalPresentationStyle = .pageSheet
        destinationVC.sheetPresentationController?.detents = [.medium()]
        destinationVC.sheetPresentationController?.prefersGrabberVisible = true
        present(destinationVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubviews(productImageView, productNameLabel, chooseProductButton)
        addConstraints()
    }
    
    private func addConstraints() {
        chooseProductButton.addTarget(self, action: #selector(presentProductSelectionVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            productImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            productImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            productImageView.widthAnchor.constraint(equalToConstant: 300),
            productImageView.heightAnchor.constraint(equalToConstant: 225),
            
            productNameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 20),
            productNameLabel.centerXAnchor.constraint(equalTo: productImageView.centerXAnchor),
            productNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            productNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            chooseProductButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            chooseProductButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chooseProductButton.heightAnchor.constraint(equalToConstant: 50),
            chooseProductButton.widthAnchor.constraint(equalToConstant: 260)
        ])
    }
}

#Preview {
    ProductViewController()
}

extension ProductViewController: ProductSelectionViewControllerProtocol {
    func didSelectProduct(name: String, image: String) {
        productNameLabel.text = name
        productImageView.image = UIImage(named: image)
    }
}

