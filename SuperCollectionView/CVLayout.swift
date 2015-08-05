//
//  CVLayout.swift
//  SuperCollectionView
//
//  Created by David Yu on 15/8/4.
//  Copyright © 2015年 David Yu. All rights reserved.
//

import Foundation

class CVLayout: UICollectionViewLayout
{/*
    init(columnCount: NSInteger, spacing: CGFloat, contentInset: UIEdgeInsets) {
        self.columnCount = columnCount
        self.spacing = spacing
        self.contentInset = contentInset
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    var model: CVModel {
//        didSet {
//            
//        }
//    }
    
    //列数
    var columnCount: NSInteger
    
    //间距
    var spacing: CGFloat
    
    //ColletionView的边界
    var contentInset: UIEdgeInsets
    
    //每一列宽度
//    var itemWidth: CGFloat {
//        get {
//            return model.collectionCellWidth
//        }
//    }
    
    // MARK: - Private
    
    //一共多少item
    private var itemCount: NSInteger {
        get {
            return collectionView!.numberOfItemsInSection(0)
        }
    }
    
    //计算item的间距
    private var interItemSpacing: CGFloat {
        get {
            return spacing
        }
    }
    
    // MARK: - itemAttributes
    
    private var itemAttributes = [UICollectionViewLayoutAttributes]()
    
    private func prepareItemAttributes() -> () {
        for var index = 0; index < itemCount; ++index {
            addAttributesWithIndex(index, index: index)
        }
    }
    
    private func addAttributesWithIndex(dataIndex: NSInteger, index: NSInteger) {
        var itemHeight: CGFloat = 0.0;
        
        var width: CGFloat
        var height: CGFloat
        
        width = 100
        height = 100
        /*
        var isHeader = false
        var isSectionGroupStart = false
        var isSectionGroupEnd = false
        var isSectionStart = false
        var isSectionEnd = false
        var isComponentGroupStart = false
        var isComponentGroupEnd = false
        
        var sectionGroupHeight: CGFloat = 0
        var sectionHeight: CGFloat = 0
        
        if let component = collectionViewModel.getComponent(dataIndex) {
            isHeader = component.isHeader
            isSectionGroupStart = component.isSectionGroupStart
            isSectionGroupEnd = component.isSectionGroupEnd
            isSectionStart = component.isSectionStart
            isSectionEnd = component.isSectionEnd
            isComponentGroupStart = component.isComponentGroupStart
            isComponentGroupEnd = component.isComponentGroupEnd
            sectionGroupHeight = CGFloat(component.sectionGroupHeight)
            sectionHeight = CGFloat(component.sectionHeight)
            
            width = CGFloat(component.width)
            height = CGFloat(component.height)
        }
        
        var x: CGFloat = 0.0
        var y: CGFloat = 0.0
        
        if isSectionGroupStart == true {
            if isHeader == true {
                columnIndex = longestColumnIndex
                x = 0.0
                y = columnHeights[columnIndex]
            } else {
                columnIndex = shortestColumnIndex
                x = sectionInset.left + ((itemWidth + interItemSpacing) * CGFloat(columnIndex))
                y = columnHeights[columnIndex]
            }
            
            sectionGroupPoint = CGPointMake(x, y)
            sectionPoint = CGPointMake(x, y)
            componentGroupPoint = CGPointMake(x, y)
            componentPoint = CGPointMake(x, y)
        }
        */
        let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: NSIndexPath(forRow: index, inSection: 0))
        attributes.frame = CGRect(x: componentPoint.x, y: componentPoint.y, width: width, height: height)
        itemAttributes.append(attributes)
        
        componentPoint = CGPointMake(componentPoint.x, componentPoint.y + height)
        /*
        if isComponentGroupEnd == true {
            componentGroupPoint = CGPointMake(componentGroupPoint.x + width, componentGroupPoint.y)
            componentPoint = CGPointMake(componentGroupPoint.x, componentGroupPoint.y)
        }
        
        if isSectionEnd == true {
            sectionPoint = CGPointMake(sectionPoint.x, sectionPoint.y + sectionHeight)
            componentGroupPoint = CGPointMake(sectionPoint.x, sectionPoint.y)
            componentPoint = CGPointMake(sectionPoint.x, sectionPoint.y)
        }
        
        if isSectionGroupEnd == true {
            if isHeader == true {
                let theColumnHeight = columnHeights[columnIndex]
                for var i = 0; i < columnHeights.count; ++i {
                    columnHeights[i] = theColumnHeight + sectionGroupHeight + interItemSpacing
                }
                
            } else {
                columnHeights[columnIndex] = columnHeights[columnIndex] + sectionGroupHeight + interItemSpacing
            }
        }*/
    }
    
    var columnIndex: NSInteger = 0
    
    var sectionGroupPoint: CGPoint = CGPointZero
    var sectionPoint: CGPoint = CGPointZero
    var componentGroupPoint: CGPoint = CGPointZero
    var componentPoint: CGPoint = CGPointZero
    
    // MARK: - columnHeights
    
    private var columnHeights = [CGFloat]()
    
    private var shortestColumnIndex: NSInteger {
        get {
            var shortestIndex = 0
            var shortestHeight = columnHeights[0]
            
            for var index = 1; index < columnCount; ++index {
                if columnHeights[index] < shortestHeight {
                    shortestIndex = index
                    shortestHeight = columnHeights[index]
                }
            }
            return shortestIndex
        }
    }
    
    private var longestColumnIndex: NSInteger {
        get {
            var longestIndex = 0
            var longestHeight = columnHeights[0]
            
            for var index = 1; index < columnCount; ++index {
                if columnHeights[index] > longestHeight {
                    longestIndex = index
                    longestHeight = columnHeights[index]
                }
            }
            return longestIndex
        }
    }
    
    // MARK: - override
    
    override func prepareLayout() {
        super.prepareLayout()
        
        columnHeights = [CGFloat](count: columnCount, repeatedValue: contentInset.top)
        itemAttributes = [UICollectionViewLayoutAttributes]()
        
        prepareItemAttributes()
    }
    
    override func collectionViewContentSize() -> CGSize {//minimumSize用于防止由于contentSize过小UIScrollView不能滑动的问题
        if itemCount == 0 {
            return UIScreen.mainScreen().bounds.size
        }
        if var contentSize = collectionView?.frame.size {
            let columnIndex = longestColumnIndex
            let height: CGFloat = columnHeights[columnIndex] as CGFloat
            
            contentSize.height = height - interItemSpacing + contentInset.bottom
            if (contentSize.height < UIScreen.mainScreen().bounds.size.height) {
                return UIScreen.mainScreen().bounds.size;
            }
            return contentSize
        }
        return UIScreen.mainScreen().bounds.size
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        return itemAttributes[indexPath.row]
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        if itemCount > 0 {
            var begin = 0
            for var index = 0; index < itemCount; ++index {
                if CGRectIntersectsRect(rect, itemAttributes[index].frame) {
                    begin = index
                    break;
                }
            }
            
            var end = itemCount
            for var index = itemCount - 1; index >= 0; --index {
                if CGRectIntersectsRect(rect, itemAttributes[index].frame) {
                    end = index
                    break;
                }
            }
            end = min(end + columnCount, itemCount)//保持瀑布流最下面不闪
            
            var retureValue = [UICollectionViewLayoutAttributes]()
            for var index = begin; index < end; ++index {
                retureValue.append(itemAttributes[index])
            }
            return retureValue
        } else {
            return nil
        }
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return false
    }*/
}