//
//  RemoveDuplicate.swift
//  Final Challenge
//
//  Created by Kennyzi Yusuf on 06/02/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import Foundation
extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
    
    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}
