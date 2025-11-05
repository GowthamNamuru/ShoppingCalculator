//
//  ShoppingCalculatorTests.swift
//  ShoppingCalculatorTests
//
//  Created by Gowtham Namuru on 05/11/25.
//

import XCTest
@testable import ShoppingCalculator

final class ShoppingCalculatorTests: XCTestCase {

    func test_PercentageAndThenAmount_WhenUserIsOnlyEmployee() {
        let bill = Bill(items: makeProducts(grocery: 300, nonGrocery: 280.0))
        let user = User(role: [.employee])
        let discountCalculator = OverallDiscountCalculator(discounts: [PercentageDiscountCalculator(), AmountBasedDiscountCalculator()])
        XCTAssertEqual(discountCalculator.calculate(user: user, bill: bill), 476.0)
    }

    func test_PercentageAndThenAmount_WhenUserIsOnlyAffliate() {
        let bill = Bill(items: makeProducts(grocery: 300, nonGrocery: 280.0))
        let user = User(role: [.affliate])
        let discountCalculator = OverallDiscountCalculator(discounts: [PercentageDiscountCalculator(), AmountBasedDiscountCalculator()])
        XCTAssertEqual(discountCalculator.calculate(user: user, bill: bill), 527.0)
    }

    func test_PercentageThenAmount_WhenUserIsEmployeeAndAffliate() {
        let bill = Bill(items: makeProducts(grocery: 300, nonGrocery: 280))
        let user = User(role: [.affliate, .employee])
        let discountCalculator = OverallDiscountCalculator(discounts: [PercentageDiscountCalculator(), AmountBasedDiscountCalculator()])
        XCTAssertEqual(discountCalculator.calculate(user: user, bill: bill), 476.0)
    }

    func test_PercentageThenAmount_WhenUserIsEligibleForLoyalty() {
        let bill = Bill(items: makeProducts(grocery: 300, nonGrocery: 280))
        let user = User(role: [.customerSince(Date().addingTimeInterval(-3600 * 24 * 7))])
        let discountCalculator = OverallDiscountCalculator(discounts: [PercentageDiscountCalculator(), AmountBasedDiscountCalculator()])
        XCTAssertEqual(discountCalculator.calculate(user: user, bill: bill), 555)
    }
}

private extension ShoppingCalculatorTests {
    func makeProducts(grocery: Float, nonGrocery: Float) -> [Product] {
        [Product(name: "Grocery", unitPrice: grocery / 10, type: .grocesry, quantity: 10),
         Product(name: "Non - Grocery", unitPrice: nonGrocery / 10, type: .other, quantity: 10)]
    }
}
