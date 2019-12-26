//
//  Copyright © 2015 Big Nerd Ranch
//

import Foundation

class Item {
    
    var name: String
    var valueInDollars: String
    var serialNumber: String?
    let dateCreated: Date
    
    init(name: String, serialNumber: String?, valueInDollars: String) {
        self.name = name
        self.serialNumber = serialNumber
        self.valueInDollars = valueInDollars
        self.dateCreated = Date()

    }
    
    convenience init(my_index: Int) {

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy-MM-dd"
        
        let now = Date()
        
        let adjustedNow = Calendar.current.date(byAdding: .day, value: my_index, to: now)
        
        let nowString = dateFormatterPrint.string(from: adjustedNow!)
        
        let randomName = "\(nowString)"
        let randomValue = "00:00:0\(my_index)"
        let randomSerialNumber = "00000000"
        
        self.init(name: randomName,
            serialNumber: randomSerialNumber,
            valueInDollars: randomValue)
    }
    
}
