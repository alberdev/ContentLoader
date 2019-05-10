//
//  ContentLoader
//  Copyright (c) 2019 alberdev. All rights reserved.
//

import UIKit
import ContentLoader

class CollectionViewController: UICollectionViewController {

    struct User {
        let name: String
        let place: String
        let phone: String
        let points: Int
    }
    
    private let reuseIdentifier = "CollectionViewCell"
    private let itemsPerRow: CGFloat = 2
    private var items = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var format = ContentLoaderFormat()
        format.color = "#F6F6F6".hexColor
        format.radius = 5
        
        collectionView.startLoading(format: format)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: { [weak self] in
            self?.loadContent()
            self?.collectionView.hideLoading()
        })
    }
}

extension CollectionViewController {
    
    private func loadContent() {
        items = [
            User(name: "Vincent Nichols", place: "United States", phone: "(420) 568 1625", points: 234),
            User(name: "Billy Allen", place: "United States", phone: "(719) 653 3370", points: 98),
            User(name: "Angela Davis", place: "United States", phone: "(577) 853 9234", points: 329),
            User(name: "Hannah Lawrence", place: "United States", phone: "(514) 319 6831", points: 478),
            User(name: "Debra Howard", place: "United States", phone: "(648) 927 5058", points: 732),
            User(name: "Howard Greene", place: "United States", phone: "(258) 662 1454", points: 35),
            User(name: "Jacqueline Rose", place: "United States", phone: "(224) 489 1764", points: 372),
            User(name: "Joshua Dunn", place: "United States", phone: "(471) 580 4605", points: 57),
            User(name: "Alice Arnold", place: "United States", phone: "(493) 702 1107", points: 198),
            User(name: "Bobby Anderson", place: "United States", phone: "(627) 412 5565", points: 24),
            User(name: "Paul Murray", place: "United States", phone: "(183) 293 8670", points: 57),
            User(name: "Kathy Hill", place: "United States", phone: "(914) 478 2336", points: 492)
        ]
    }
}

extension CollectionViewController: ContentLoaderDataSource {
    
    func numSections(in contentLoaderView: UIView) -> Int {
        return 1
    }
    
    func contentLoaderView(_ contentLoaderView: UIView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func contentLoaderView(_ contentLoaderView: UIView, cellIdentifierForItemAt indexPath: IndexPath) -> String {
        return reuseIdentifier
    }
}

extension CollectionViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.viewModel = CollectionViewCell.ViewModel(name: item.name, place: item.place, phone: item.phone, points: item.points)
        return cell
    }
}

extension CollectionViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 30) / itemsPerRow, height: 180)
    }
}
