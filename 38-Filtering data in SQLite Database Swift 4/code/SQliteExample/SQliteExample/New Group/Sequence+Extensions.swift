//
//  Sequence+Extensions.swift
//  SQliteExample
//
//  Created by Nguyen Duc Hoang on 9/4/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import Foundation
extension AnySequence {
    func count() -> Int {
        var count = 0
        for _ in self {
            count += 1
        }
        return count
    }
}
