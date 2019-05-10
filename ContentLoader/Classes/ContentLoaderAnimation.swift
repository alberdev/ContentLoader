//
//  ContentLoader
//  Copyright (c) 2019 alberdev. All rights reserved.
//

import Foundation

public typealias ContentLoaderLayerAnimation = (CALayer) -> CAAnimation

public enum ContentLoaderAnimation {
    
    case fade
    case gradient
    
    var layer: CALayer? {
        switch self {
        case .fade: return CALayer()
        case .gradient: return CAGradientLayer()
        }
    }
    
    var layerAnimation: (CALayer) -> CAAnimation {
        switch self {
        case .fade: return { $0.pulse }
        case .gradient: return { $0.sliding }
        }
    }
}
