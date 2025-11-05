//
//  Bill.swift
//  ShoppingCalculator
//
//  Created by Gowtham Namuru on 05/11/25.
//

import Foundation

struct Bill: Equatable {
    let items: [Product]

    var subTotal: Float {
        items.reduce(0) { $0 + $1.total }
    }

    var grocesrySubTotal: Float {
        items.filter { $0.type.isGrocery }.reduce(0) { $0 + $1.total }
    }

    var nonGrocerySubTotal: Float {
        items.filter { !$0.type.isGrocery }.reduce(0) { $0 + $1.total }
    }
}
