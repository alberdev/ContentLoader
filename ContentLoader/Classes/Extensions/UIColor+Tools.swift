//
//  ContentLoader
//  Copyright (c) 2019 alberdev. All rights reserved.
//

import Foundation

public extension UIColor {
    
    private func isLight() -> Bool {
        guard let components = cgColor.components,
            components.count >= 3 else { return false }
        let brightness = ((components[0] * 299) + (components[1] * 587) + (components[2] * 114)) / 1000
        return !(brightness < 0.5)
    }
    
    var complementaryColor: UIColor {
        return isLight() ? darker : lighter
    }
    
    var lighter: UIColor {
        return adjust(by: 1.35)
    }
    
    var darker: UIColor {
        return adjust(by: 0.94)
    }
    
    private func adjust(by percent: CGFloat) -> UIColor {
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return UIColor(hue: h, saturation: s, brightness: b * percent, alpha: a)
    }
}
