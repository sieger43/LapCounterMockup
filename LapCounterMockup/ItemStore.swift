//
//  Copyright © 2015 Big Nerd Ranch
//

import Foundation

class ItemStore {
    
    var allItems: [Item] = []
    
    init() {
        for ii in 0..<5 {
            createItem(index: ii)
        }
    }
    
    @discardableResult func createItem(index: Int) -> Item {
        let newItem = Item(my_index: index)
        
        allItems.append(newItem)
        
        return newItem
    }
    
}
