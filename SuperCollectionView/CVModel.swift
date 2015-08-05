//
//  CVModel.swift
//  SuperCollectionView
//
//  Created by David Yu on 15/8/3.
//  Copyright © 2015年 David Yu. All rights reserved.
//

import Foundation

class CVPageManager {
    init(size: Int, index: Int, end: Bool) {
        self.size = size
        self.index = index
        self.end = end
    }
    
    var size: Int
    var index: Int
    var end: Bool
}

class CVModel
{
    init() {
        self.collectionColumnCount = 1
        self.collectionSpacing = 0
        self.collectionContentInset = UIEdgeInsetsZero
    }
    
    init(collectionColumnCount: NSInteger, collectionSpacing: CGFloat, collectionContentInset: UIEdgeInsets) {
        self.collectionColumnCount = collectionColumnCount
        self.collectionSpacing = collectionSpacing
        self.collectionContentInset = collectionContentInset
//        self.collectionCellWidth = collectionCellWidth
    }
    
    var collectionColumnCount: NSInteger
    var collectionSpacing: CGFloat
    var collectionContentInset: UIEdgeInsets
//    var collectionCellWidth: CGFloat
    
    // MARK: - Status
    
    enum CVModelStatus {
        case NoData
        case Normal
        case Updating
    }
    
    private var status = CVModelStatus.NoData
    
    func dataWillLoad() {
        print("dataWillLoad - super")
        if status == CVModelStatus.Updating {
            return
        } else {
            status = CVModelStatus.Updating
        }
    }
}

class CVModelFeed: CVModel
{
    override init() {
        
        super.init(collectionColumnCount: 1, collectionSpacing: 10, collectionContentInset: UIEdgeInsetsMake(64.0, 10.0, 0.0, 10.0))
        
        dataWillLoad()
    }
    
    var pageManager = CVPageManager(size: 50, index: 0, end: false)
    
    override func dataWillLoad() {
        super.dataWillLoad()
        
        print("dataWillLoad - after")
        
        sendRequest()
    }
    
    func sendRequest() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            TapitureAPIClient.sharedClient().userService.feedWithUserId(1070261, andStart: self.pageManager.index, andCount: self.pageManager.size, andFilter: nil, andView: "slide", andFeed: "following", success: { (responseObject) -> Void in
                print(responseObject)
                
                //    println("responseObject = \(responseObject)")
                
            }, failure: { (error) -> Void in
//                self.sendRequestFailure()
            })
        })
    }
}