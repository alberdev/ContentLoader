//
//  ContentLoader
//  Copyright (c) 2019 alberdev. All rights reserved.
//

import UIKit

enum ViewAssociatedKeys {
    static var loadable = "loadable"
    static var active = "active"
    static var loader = "loader"
}

public extension UIView {
    
    func startLoading(format: ContentLoaderFormat? = nil) {
        active = true
        if self is UITableView || self is UICollectionView { showContentLoader(format: format) }
        else { setupLoading(true, format: format) }
    }
    
    func hideLoading() {
        active = false
        if self is UITableView || self is UICollectionView { hideContentLoader() }
        else { setupLoading(false) }
    }
    
    private func setupLoading(_ loading: Bool, format: ContentLoaderFormat? = nil) {
        
        let loadingFormat = format ?? ContentLoaderFormat()
        
        if isLoadable {
            backgroundColor = loading ? loadingFormat.color : .clear
            cornerRadius = cornerRadius == 0 ? loadingFormat.radius : cornerRadius
            clipsToBounds = cornerRadius != 0
            
            if loading { layer.playAnimation(loadingFormat.animation) }
            else { layer.stopAnimation() }
        }
        
        // Get all UIImageView
        for view in self.getAllSubviews() as [UIImageView] {
            if view.isLoadable {
                view.layer.backgroundColor = loading ? loadingFormat.color.cgColor : nil
                view.cornerRadius = view.cornerRadius == 0 ? loadingFormat.radius : view.cornerRadius
                view.clipsToBounds = view.cornerRadius != 0
                
                if loading {
                    view.originalImage = view.image
                    view.layer.playAnimation(loadingFormat.animation)
                }
                else {
                    view.image = view.originalImage
                    view.layer.stopAnimation()
                }
            }
        }
        
        // Get all UILabel
        for view in self.getAllSubviews() as [UILabel] {
            if view.isLoadable {
                view.layer.backgroundColor = loading ? loadingFormat.color.cgColor : nil
                view.textColor = loading ? .clear : .darkGray
                view.cornerRadius = loadingFormat.radius
                view.clipsToBounds = view.cornerRadius != 0
                
                if loading { view.layer.playAnimation(loadingFormat.animation) }
                else { view.layer.stopAnimation() }
            }
        }
    }
    
    private func showContentLoader(format: ContentLoaderFormat?) {
        let contentLoader = ContentLoader(view: self, format: format)
        contentLoader.showLoading()
        loader = contentLoader
    }
    
    private func hideContentLoader() {
        loader?.hideLoading()
        loader = nil
    }
    
}

public extension UIView {
    
    @IBInspectable
    var isLoadable: Bool {
        get { return loadable }
        set { loadable = newValue }
    }
    
    var isActive: Bool {
        get { return active }
    }
    
    fileprivate var loadable: Bool! {
        get { return ao_get(pkey: &ViewAssociatedKeys.loadable) as? Bool ?? false }
        set { ao_set(newValue ?? false, pkey: &ViewAssociatedKeys.loadable) }
    }
    
    fileprivate var active: Bool! {
        get { return ao_get(pkey: &ViewAssociatedKeys.active) as? Bool ?? false }
        set { ao_set(newValue ?? false, pkey: &ViewAssociatedKeys.active) }
    }
    
    fileprivate var loader: ContentLoader? {
        get { return ao_get(pkey: &ViewAssociatedKeys.loader) as? ContentLoader }
        set { ao_set(newValue ?? false, pkey: &ViewAssociatedKeys.loader) }
    }
}
