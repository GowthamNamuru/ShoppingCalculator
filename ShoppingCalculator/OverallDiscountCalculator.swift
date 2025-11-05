//
//  OverallDiscountCalculator.swift
//  ShoppingCalculator
//
//  Created by Gowtham Namuru on 05/11/25.
//

import Foundation

final class OverallDiscountCalculator {
    private let discounts: [DiscountCalculator]
    init(discounts: [DiscountCalculator]) {
        self.discounts = discounts
    }

    func calculate(user: User, bill: Bill) -> Float {
        var currentTotal = bill.subTotal
        var percentageAppliedOn: String = ""
        for discount in discounts {
            let discountedValue = discount.apply(user: user, bill: bill, currentTotal: currentTotal)
            if discount is PercentageDiscountCalculator {
                percentageAppliedOn += "Percentage based Discounted value: \(discountedValue) \n"
            } else {
                percentageAppliedOn += "Amount based Discounted value: \(discountedValue) \n"
            }
            currentTotal = discountedValue
        }
        return currentTotal
    }
}

public extension Float {
    func rounded(toPlaces places: Int) -> Float {
        let divisor = pow(10.0, Float(places))
        return (self * divisor).rounded() / divisor
    }
}
