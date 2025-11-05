//
//  Product.swift
//  ShoppingCalculator
//
//  Created by Gowtham Namuru on 05/11/25.
//

import Foundation

enum ProductType: Equatable {
    case grocesry
    case other

    var isGrocery: Bool {
        self == .grocesry
    }
}

struct Product: Equatable {
    let name: String
    let unitPrice: Decimal
    let type: ProductType
    let quantity: Int

    var total: Decimal {
        return Decimal(quantity) * unitPrice
    }
}
