//
//  NavigationViewController.swift
//  UIKitBootcamp
//
//  Created by Yunus Emre Berdibek on 5.01.2024.
//

import UIKit

final class NavigationViewController: UIViewController {
    /*
     Navigation item üzerine resim eklemek istiyorsak 1 x için 28x28, 2X için 56x56, 3x için 84x84 yüklemeliyiz.
     */

    private let segmentedView: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.insertSegment(withTitle: "First", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Second", at: 1, animated: true)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .never

        navigationItem.title = "Title"
        navigationItem.prompt = "Prompt"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(action))
        // Başlık kısmına resim ekleme.
        let image = UIImage.homeHomeSymbol
        // navigationItem.titleView = UIImageView(image: image)
        
        // Navigation item + segmented
        navigationItem.titleView = segmentedView
        segmentedView.addTarget(self, action: #selector(segmentedAction), for: .valueChanged)
       
    }

    @IBAction
    private func action() {
        print(segmentedView.selectedSegmentIndex)
    }

    @IBAction
    private func segmentedAction() {
        print("SEGMENTED DEĞİŞTİR: \(segmentedView.selectedSegmentIndex)")
    }
}

#Preview {
    NavigationViewController()
}
