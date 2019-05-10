//
//  ContentLoader
//  Copyright (c) 2019 alberdev. All rights reserved.
//

import UIKit
import ContentLoader

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ContentLoader"
        setupNavigation()
        reloadData()
    }
    
    @objc func reloadData() {
        var format = ContentLoaderFormat()
        format.color = "#F6F6F6".hexColor
        format.radius = 5
        format.animation = .fade
        
        view.startLoading(format: format)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: { [weak self] in
            self?.loadContent()
            self?.view.hideLoading()
        })
    }
}

extension ViewController {
    
    private func setupNavigation() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .darkGray
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.darkGray,
            NSAttributedString.Key.font: UIFont(name: "AvenirNext-DemiBold", size: 16)!]
        
        let button = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = button
        
        let rightButton = UIBarButtonItem(title: "Reload", style: .plain, target: self, action: #selector(reloadData))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    private func loadContent() {
        imageView.image = UIImage(named: "User")
        titleLabel.text = "ContentLoader"
        descriptionLabel.text = "Transform your content views in placeholders"
    }
}

