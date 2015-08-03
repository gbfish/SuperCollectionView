//
//  CVFunction.swift
//  SuperCollectionView
//
//  Created by David Yu on 15/8/3.
//  Copyright © 2015年 David Yu. All rights reserved.
//

import Foundation

protocol CVFunction {
    func action()
}

struct CVFunctionLikeTap: CVFunction {
    init(tapId: Int) {
        argumentTapId = tapId
    }
    
    var argumentTapId: Int = 0
    
    func action() {
        TapitureAPIClient.sharedClient().userService.likeTapWithUserId(1070261, andTapId: argumentTapId, success: { (_) -> Void in
            
        }) { (_) -> Void in
            
        }
    }
}