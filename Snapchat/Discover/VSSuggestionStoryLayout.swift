//
//  VSSuggestionStoryLayout.swift
//  Snapchat
//
//  Created by Scrupulous on 13/9/18.
//  Copyright © 2018 Md. Mamun-Ur-Rashid. All rights reserved.
//

import UIKit

private let kSideItemWidthCoef: CGFloat = 0.5
private let kSideItemHeightAspect: CGFloat = 2
private let kNumberOfSideItems = 1

class VSSuggestionStoryLayout: VSStoryLayout {

    private var _mainItemSize: CGSize!
    private var _sideItemSize: CGSize!
    private var _columnsXoffset: [CGFloat]!
    
    //MARK: Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.totalColumns = 2
    }
    
    //MARK: Override getters
    override var description: String {
        return "Layout v2"
    }
    
    //MARK: Override Abstract methods
    override func columnIndexForItemAt(indexPath: IndexPath) -> Int {
        let totalItemsInRow = kNumberOfSideItems + 1
        let columnIndex = indexPath.item % totalItemsInRow
        let columnIndexLimit = totalColumns - 1
        
        return columnIndex > columnIndexLimit  ? columnIndexLimit : columnIndex
    }
    
    override func calculateItemFrame(indexPath: IndexPath, columnIndex: Int, columnYoffset: CGFloat) -> CGRect {
        let size = columnIndex == 0 ? _mainItemSize : _sideItemSize
        return CGRect(origin: CGPoint(x: _columnsXoffset[columnIndex], y: columnYoffset), size: size!)
    }
    
    override func calculateItemsSize() {
        let floatNumberOfSideItems = CGFloat(kNumberOfSideItems)
        let contentWidthWithoutIndents = collectionView!.bounds.width - contentInsets.left - contentInsets.right
        let resolvedContentWidth = contentWidthWithoutIndents - interItemsSpacing
        
        // We need to calculate side item size first, in order to calculate main item height
        let sideItemWidth = resolvedContentWidth * kSideItemWidthCoef
        let sideItemHeight = (sideItemWidth * kSideItemHeightAspect) - (sideItemWidth * 0.30)
        
        _sideItemSize = CGSize(width: sideItemWidth, height: sideItemHeight)
        
        // Now we can calculate main item height
        let mainItemWidth = resolvedContentWidth - sideItemWidth
        let mainItemHeight = sideItemHeight * floatNumberOfSideItems + ((floatNumberOfSideItems - 1) * interItemsSpacing)
        
        _mainItemSize = CGSize(width: mainItemWidth, height: mainItemHeight-40)
        
        // Calculating offsets by X for each column
        _columnsXoffset = [0, _mainItemSize.width + interItemsSpacing]
    }
    
}