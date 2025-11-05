//
//  User.swift
//  ShoppingCalculator
//
//  Created by Gowtham Namuru on 05/11/25.
//

import Foundation

enum UserType: Hashable {
    case employee
    case affliate
    case customerSince(Date)

    var isLoyalCustomer: Bool {
        switch self {
        case let .customerSince(since):
            let twoYearsAgo = Calendar.current.date(byAdding: .year, value: -2, to: Date())!
            return since < twoYearsAgo
        default:
            return false
        }
    }
}

struct User {
    let id = UUID()
    let role: Set<UserType>

    init(role: Set<UserType>) {
        self.role = role
    }
}
