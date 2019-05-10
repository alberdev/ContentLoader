//
//  ContentLoader
//  Copyright (c) 2019 alberdev. All rights reserved.
//  Based on SkeletonView https://github.com/Juanpe/SkeletonView
//

import Foundation

enum ImageViewAssociatedKeys {
    static var imageViewOriginalImage = "imageViewOriginalImage"
}

public extension UIImageView {
    
    var originalImage: UIImage? {
        get { return image != nil ? image : ao_get(pkey: &ImageViewAssociatedKeys.imageViewOriginalImage) as? UIImage }
        set {
            ao_setOptional(newValue, pkey: &ImageViewAssociatedKeys.imageViewOriginalImage)
            image = nil
        }
    }
}
