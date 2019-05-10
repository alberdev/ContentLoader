//
//  ContentLoader
//  Copyright (c) 2019 alberdev. All rights reserved.
//

import Foundation

public struct ContentLoaderFormat {
    
    /// Loader color
    public var color = "#F6F6F6".hexColor
    
    /// Corner radius
    public var radius: CGFloat = 5
    
    /// Animation type
    public var animation: ContentLoaderAnimation? = .fade
    
    public init() {}
}
