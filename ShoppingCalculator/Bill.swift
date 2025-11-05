//
//  Bill.swift
//  ShoppingCalculator
//
//  Created by Gowtham Namuru on 05/11/25.
//

import Foundation

struct Bill: Equatable {
    let items: [Product]

    var subTotal: Decimal {
        items.reduce(0) { $0 + $1.total }
    }

    var grocesrySubTotal: Decimal {
        items.filter { $0.type.isGrocery }.reduce(0) { $0 + $1.total }
    }

    var nonGrocerySubTotal: Decimal {
        items.filter { !$0.type.isGrocery }.reduce(0) { $0 + $1.total }
    }
}
