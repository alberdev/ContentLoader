//
//  ContentLoader
//  Copyright (c) 2019 alberdev. All rights reserved.
//

import UIKit

public class ContentLoader: NSObject {
    
    weak var contentLoaderDataSource: ContentLoaderDataSource?
    weak var originalTableDataSource: UITableViewDataSource?
    weak var originalCollectionDataSource: UICollectionViewDataSource?
    
    var tableView: UITableView?
    var collectionView: UICollectionView?
    var format: ContentLoaderFormat?
    
    convenience init(view: UIView, format: ContentLoaderFormat?) {
        if let tableView = view as? UITableView { self.init(tableView, format: format) }
        else if let collectionView = view as? UICollectionView { self.init(collectionView, format: format) }
        else { self.init() }
    }
    
    convenience init(_ tableView: UITableView, format: ContentLoaderFormat?) {
        self.init()
        self.tableView = tableView
        self.contentLoaderDataSource = tableView.dataSource as? ContentLoaderDataSource
        self.originalTableDataSource = tableView.dataSource
        self.format = format
    }
    
    convenience init(_ collectionView: UICollectionView, format: ContentLoaderFormat?) {
        self.init()
        self.collectionView = collectionView
        self.contentLoaderDataSource = collectionView.dataSource as? ContentLoaderDataSource
        self.originalCollectionDataSource = collectionView.dataSource
        self.format = format
    }
}

extension ContentLoader {
    
    func showLoading() {
        // Table option
        tableView?.contentLoaderDataSource = self
        tableView?.originalFormat = TableOriginalFormat(
            separatorStyle: tableView?.separatorStyle,
            userInteractionEnabled: tableView?.isUserInteractionEnabled,
            showsVerticalScrollIndicator: tableView?.showsVerticalScrollIndicator,
            showsHorizontalScrollIndicator: tableView?.showsHorizontalScrollIndicator)
        
        tableView?.separatorStyle = .none
        tableView?.isUserInteractionEnabled = false
        tableView?.showsVerticalScrollIndicator = false
        tableView?.showsHorizontalScrollIndicator = false
        tableView?.reloadData()
        
        // Collection option
        collectionView?.contentLoaderDataSource = self
        collectionView?.originalFormat = CollectionOriginalFormat(
            userInteractionEnabled: collectionView?.isUserInteractionEnabled)
        
        collectionView?.isUserInteractionEnabled = false
        collectionView?.reloadData()
    }
    
    func hideLoading() {
        // Table option
        tableView?.hideLoadingCells()
        tableView?.contentLoaderDataSource = nil
        tableView?.dataSource = originalTableDataSource
        tableView?.separatorStyle = tableView?.originalFormat.separatorStyle ?? .none
        tableView?.isUserInteractionEnabled = tableView?.originalFormat.userInteractionEnabled ?? true
        tableView?.showsVerticalScrollIndicator = tableView?.originalFormat.showsVerticalScrollIndicator ?? true
        tableView?.showsHorizontalScrollIndicator = tableView?.originalFormat.showsHorizontalScrollIndicator ?? true
        tableView?.reloadData()
        
        // Collection option
        collectionView?.hideLoadingViews()
        collectionView?.contentLoaderDataSource = nil
        collectionView?.dataSource = originalCollectionDataSource
        collectionView?.isUserInteractionEnabled = collectionView?.originalFormat.userInteractionEnabled ?? true
        collectionView?.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension ContentLoader: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return contentLoaderDataSource?.numSections(in:tableView) ?? 0
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentLoaderDataSource?.contentLoaderView(tableView, numberOfItemsInSection:section) ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = contentLoaderDataSource?.contentLoaderView(tableView, cellIdentifierForItemAt: indexPath) ?? ""
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.startLoading(format: format)
        return cell
    }
}

// MARK: - UICollectionViewDataSource
extension ContentLoader: UICollectionViewDataSource {

    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return contentLoaderDataSource?.numSections(in: collectionView) ?? 0
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contentLoaderDataSource?.contentLoaderView(collectionView, numberOfItemsInSection: section) ?? 0
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = contentLoaderDataSource?.contentLoaderView(collectionView, cellIdentifierForItemAt: indexPath) ?? ""
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        cell.startLoading(format: format)
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerIdentifier = contentLoaderDataSource?.contentLoaderView(collectionView, headerIdentifierForItemAt: indexPath) ?? ""
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath)
        headerView.startLoading(format: format)
        return headerView
    }
}
