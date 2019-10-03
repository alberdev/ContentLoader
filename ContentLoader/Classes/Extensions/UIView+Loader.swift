//
//  ContentLoader
//  Copyright (c) 2019 alberdev. All rights reserved.
//

import UIKit

enum ViewAssociatedKeys {
    static var loadable = "loadable"
    static var active = "active"
    static var loader = "loader"
    
    // To save values
    static var backgroundColor = "backgroundColor"
    static var cornerRadius = "cornerRadius"
    static var borderColor = "borderColor"
    static var clipToBounds = "clipToBounds"
    static var textColor = "textColor"
    static var image = "image"
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
            
            if loading {
                layer.playAnimation(loadingFormat.animation)
                for view in self.getAllSubviews() { view.isHidden = true }
            } else {
                layer.stopAnimation()
                for view in self.getAllSubviews() { view.isHidden = false }
            }
        }
        
        // Get all UICollectionView
        for view in self.getAllSubviews() as [UICollectionView] {
            if view.isLoadable {
                if loading {
                    view.startLoading(format: format)
                } else {
                    view.hideLoading()
                }
            }
        }
        
        // Get all UIImageView
        for view in self.getAllSubviews() as [UIImageView] {
            if view.isLoadable {
                if loading {
                    view.clipToBounds_ = view.clipsToBounds
                }
                view.layer.backgroundColor = loading ? loadingFormat.color.cgColor : nil
                view.cornerRadius = view.cornerRadius == 0 ? loadingFormat.radius : view.cornerRadius
                view.clipsToBounds = loading ? view.cornerRadius != 0 : view.clipToBounds_
                
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
                if loading {
                    view.textColor_ = view.textColor
                    view.cornerRadius_ = view.cornerRadius
                    view.clipToBounds_ = view.clipsToBounds
                }
                view.layer.backgroundColor = loading ? loadingFormat.color.cgColor : nil
                view.textColor = loading ? .clear : view.textColor_
                view.cornerRadius = loading ? loadingFormat.radius : view.cornerRadius_
                view.clipsToBounds = loading ? view.cornerRadius != 0 : view.clipToBounds_
                
                if loading { view.layer.playAnimation(loadingFormat.animation) }
                else { view.layer.stopAnimation() }
            }
        }
        
        // Get all UIButton
        for view in self.getAllSubviews() as [UIButton] {
            if view.isLoadable {
                if loading {
                    view.backgroundColor_ = view.backgroundColor
                    view.borderColor_ = view.borderColor
                    view.image_ = view.image(for: .normal)
                    view.textColor_ = view.titleColor(for: .normal)
                }
                view.backgroundColor = loading ? loadingFormat.color : view.backgroundColor_
                view.borderColor = loading ? .clear : view.borderColor_
                view.setTitleColor(loading ? .clear : view.textColor_, for: .normal)
                view.setImage(loading ? nil : view.image_, for: .normal)
                
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
    
    fileprivate var backgroundColor_: UIColor? {
        get { return ao_get(pkey: &ViewAssociatedKeys.backgroundColor) as? UIColor }
        set { ao_setOptional(newValue, pkey: &ViewAssociatedKeys.backgroundColor) }
    }
    
    fileprivate var cornerRadius_: CGFloat! {
        get { return ao_get(pkey: &ViewAssociatedKeys.cornerRadius) as? CGFloat ?? 0 }
        set { ao_setOptional(newValue ?? 0, pkey: &ViewAssociatedKeys.cornerRadius) }
    }
    
    fileprivate var borderColor_: UIColor! {
        get { return ao_get(pkey: &ViewAssociatedKeys.borderColor) as? UIColor ?? .clear }
        set { ao_setOptional(newValue ?? .clear, pkey: &ViewAssociatedKeys.borderColor) }
    }
    
    fileprivate var clipToBounds_: Bool! {
        get { return ao_get(pkey: &ViewAssociatedKeys.clipToBounds) as? Bool ?? false }
        set { ao_setOptional(newValue ?? false, pkey: &ViewAssociatedKeys.clipToBounds) }
    }
    
    fileprivate var textColor_: UIColor? {
        get { return ao_get(pkey: &ViewAssociatedKeys.textColor) as? UIColor }
        set { ao_setOptional(newValue, pkey: &ViewAssociatedKeys.textColor) }
    }
    
    fileprivate var image_: UIImage? {
        get { return ao_get(pkey: &ViewAssociatedKeys.image) as? UIImage }
        set { ao_setOptional(newValue, pkey: &ViewAssociatedKeys.image) }
    }
}
