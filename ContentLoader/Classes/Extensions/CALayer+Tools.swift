//
//  ContentLoader
//  Copyright (c) 2019 alberdev. All rights reserved.
//  Based on SkeletonView https://github.com/Juanpe/SkeletonView
//

import Foundation

public let ContentLoaderAnimationKey = "contentLoaderAnimation"

public extension CALayer {
    
    var pulse: CAAnimation {
        let pulseAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.backgroundColor))
        pulseAnimation.fromValue = backgroundColor
        pulseAnimation.toValue = UIColor(cgColor: backgroundColor!).complementaryColor.cgColor
        pulseAnimation.duration = 1
        pulseAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        pulseAnimation.autoreverses = true
        pulseAnimation.repeatCount = .infinity
        return pulseAnimation
    }
    
    var sliding: CAAnimation {
        let startPointAnim = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.startPoint))
        startPointAnim.fromValue = CGPoint(x: -1, y: 0.5)
        startPointAnim.toValue = CGPoint(x:1, y: 0.5)
        
        let endPointAnim = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.endPoint))
        endPointAnim.fromValue = CGPoint(x: 0, y: 0.5)
        endPointAnim.toValue = CGPoint(x:2, y: 0.5)
        
        let animGroup = CAAnimationGroup()
        animGroup.animations = [startPointAnim, endPointAnim]
        animGroup.duration = 1.5
        animGroup.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        animGroup.repeatCount = .infinity
        
        return animGroup
    }
    
    func playAnimation(_ animation: ContentLoaderAnimation?) {
        guard let animation = animation else { return }
        add(animation.layerAnimation(self), forKey: ContentLoaderAnimationKey)
    }
    
    func stopAnimation() {
        removeAnimation(forKey: ContentLoaderAnimationKey)
    }
}
