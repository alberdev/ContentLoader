//
//  ContentLoader
//  Copyright (c) 2019 alberdev. All rights reserved.
//

import Foundation

public protocol ContentLoaderDataSource: class {
    func numSections(in contentLoaderView: UIView) -> Int
    func contentLoaderView(_ contentLoaderView: UIView, numberOfItemsInSection section: Int) -> Int
    func contentLoaderView(_ contentLoaderView: UIView, cellIdentifierForItemAt indexPath: IndexPath) -> String
    func contentLoaderView(_ contentLoaderView: UIView, headerIdentifierForItemAt indexPath: IndexPath) -> String
}

public extension ContentLoaderDataSource {
    
    func numSections(in contentLoaderView: UIView) -> Int {
        // Optional
        return 1
    }
    
    func contentLoaderView(_ contentLoaderView: UIView, numberOfItemsInSection section: Int) -> Int {
        // Optional
        if let tableView = contentLoaderView as? UITableView {
            return tableView.estimatedNumberOfRows
        }
//        if let collectionView = contentLoaderView as? UICollectionView {
//            return collectionView.estimatedNumberOfRows
//        }
        return 10
    }
    
    func contentLoaderView(_ contentLoaderView: UIView, headerIdentifierForItemAt indexPath: IndexPath) -> String {
        // Optional
        return ""
    }
}
