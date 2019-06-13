//
//  ContentLoader
//  Copyright (c) 2019 alberdev. All rights reserved.
//

import Foundation

enum CollectionAssociatedKeys {
    static var collectionDataSource = "collectionDataSource"
    static var collectionDelegate = "collectionDelegate"
    static var collectionOriginalFormat = "collectionOriginalFormat"
}

public extension UICollectionView {
    
    var estimatedNumberOfRows: Int {
        guard let flowlayout = collectionViewLayout as? UICollectionViewFlowLayout else { return 0 }
        return Int(ceil(frame.height/flowlayout.itemSize.height))
    }
    
    var contentLoaderDataSource: ContentLoader? {
        get { return ao_get(pkey: &CollectionAssociatedKeys.collectionDataSource) as? ContentLoader }
        set {
            ao_setOptional(newValue, pkey: &CollectionAssociatedKeys.collectionDataSource)
            self.dataSource = newValue
        }
    }
    
//    var contentLoaderDelegate: ContentLoaderCollection? {
//        get { return ao_get(pkey: &CollectionAssociatedKeys.collectionDelegate) as? ContentLoaderCollection }
//        set {
//            ao_setOptional(newValue, pkey: &CollectionAssociatedKeys.collectionDelegate)
//            self.delegate = newValue
//        }
//    }
    
    var originalFormat: CollectionOriginalFormat {
        get { return ao_get(pkey: &CollectionAssociatedKeys.collectionOriginalFormat) as! CollectionOriginalFormat }
        set { ao_setOptional(newValue, pkey: &CollectionAssociatedKeys.collectionOriginalFormat) }
    }
    
    func hideLoadingViews() {
        for cell in self.visibleCells {
            cell.hideLoading()
        }
        for header in self.visibleSupplementaryViews(ofKind: UICollectionView.elementKindSectionHeader) {
            header.hideLoading()
        }
    }
}
