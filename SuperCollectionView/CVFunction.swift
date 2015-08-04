//
//  CVMFunction.swift
//  SuperCollectionView
//
//  Created by David Yu on 15/8/3.
//  Copyright © 2015年 David Yu. All rights reserved.
//

import Foundation

protocol CVFunction
{
    func action(navigation: UINavigationController?)
}

struct CVFunctionLikeTap: CVFunction
{
    init(tapId: Int) {
        argumentTapId = tapId
    }
    
    var argumentTapId: Int = 0
    
    func action(navigation: UINavigationController?) {
        TapitureAPIClient.sharedClient().userService.likeTapWithUserId(1070261, andTapId: argumentTapId, success: { (_) -> Void in
            
        }) { (_) -> Void in
            
        }
        
        if let theNavigation = navigation {
            theNavigation.pushViewController(UIViewController(), animated: true)
        }
    }
}