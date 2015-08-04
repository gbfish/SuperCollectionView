//
//  CVMComponent.swift
//  SuperCollectionView
//
//  Created by David Yu on 15/8/4.
//  Copyright © 2015年 David Yu. All rights reserved.
//

import Foundation
import UIKit

class CVComponent
{
    init(location: CVComponentLocation, width: CGFloat, height: CGFloat, edgeInsets: UIEdgeInsets) {
        self.location = location
        self.width = width
        self.height = height
        self.edgeInsets = edgeInsets
    }
    
    // MARK: - Location
    
    enum CVComponentLocation {
        case Center
        case Top
        case Bottom
        case Left
        case Right
    }
    
    var location: CVComponentLocation
    
    // MARK: - Size
    
    var width: CGFloat
    var height: CGFloat
    
    
    
    var edgeInsets: UIEdgeInsets
}

class CVComponentStack: CVComponent
{
    init(location: CVComponent.CVComponentLocation, width: CGFloat, height: CGFloat, edgeInsets: UIEdgeInsets, axis: CVComponentStackAxis, distribution: CVComponentStackDistribution, spacing: CGFloat, arrangedSubviews: [CVComponent]) {
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
        self.arrangedSubviews = arrangedSubviews
        
        super.init(location: location, width: width, height: height, edgeInsets: edgeInsets)
    }
    
    enum CVComponentStackAxis {
        case Horizontal
        case Vertical
    }
    
    var axis: CVComponentStackAxis
    
//    enum CVComponentStackAlignment {
//        case Fill
//        case Leading
//        case Center
//        case Trailing
//    }
//    
//    var alignment: CVComponentStackAlignment
    
    enum CVComponentStackDistribution {
        case Fill
        case FillEqually
        case FillProportionally
        case EqualSpacing
        case EqualSize
    }
    
    var distribution: CVComponentStackDistribution
    
//    var layoutMarginsRelativeArrangement: Bool = false
    var spacing: CGFloat
    var arrangedSubviews: [CVComponent]
}

//class CVComponentImage: CVComponent {
//    init(imageUrlPart: String) {
//        
//    }
//}