//
//  ContentLoader
//  Copyright (c) 2019 alberdev. All rights reserved.
//

import Foundation

enum TableAssociatedKeys {
    static var tableDataSource = "tableDataSource"
    static var tableOriginalFormat = "tableOriginalFormat"
}

public extension UITableView {
    
    var estimatedNumberOfRows: Int {
        return Int(ceil(frame.height/rowHeight))
    }
    
    var contentLoaderDataSource: ContentLoader? {
        get { return ao_get(pkey: &TableAssociatedKeys.tableDataSource) as? ContentLoader }
        set {
            ao_setOptional(newValue, pkey: &TableAssociatedKeys.tableDataSource)
            self.dataSource = newValue
        }
    }
    
    var originalFormat: TableOriginalFormat {
        get { return ao_get(pkey: &TableAssociatedKeys.tableOriginalFormat) as! TableOriginalFormat }
        set { ao_setOptional(newValue, pkey: &TableAssociatedKeys.tableOriginalFormat) }
    }
    
    func hideLoadingCells() {
        for cell in self.visibleCells {
            cell.hideLoading()
        }
    }
}
