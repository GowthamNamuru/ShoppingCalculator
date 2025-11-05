//
//  DiscountCalculator.swift
//  ShoppingCalculator
//
//  Created by Gowtham Namuru on 05/11/25.
//

import Foundation

protocol DiscountCalculator {
    func apply(user: User, bill: Bill, currentTotal: Float) -> Float
}

//MARK: - We can have each for each type of discount it will end up having common code, so added a new implementation for Percentage based calculation
//struct EmployeeDiscount: DiscountRule {
//    private var percentage: Float = 0.3
//    func apply(user: User, bill: Bill) -> Float {
//        Float(bill.nonGrocerySubTotal * percentage)
//    }
//}
//
//struct AffliateDiscount: DiscountRule {
//    private var percentage: Float = 0.3
//    func apply(user: User, bill: Bill) -> Float {
//        Float(bill.nonGrocerySubTotal * percentage)
//    }
//}

struct PercentageDiscountCalculator: DiscountCalculator {
    func apply(user: User, bill: Bill, currentTotal: Float) -> Float {
        let discount = (bill.nonGrocerySubTotal * user.totalDiscount)
        return (currentTotal - discount)
    }
}

struct AmountBasedDiscountCalculator: DiscountCalculator {
    func apply(user: User, bill: Bill, currentTotal: Float) -> Float {
        let hundreds = Int((currentTotal / 100))
        let discount = (hundreds * 5)
        return (currentTotal - Float(discount))
    }
}
