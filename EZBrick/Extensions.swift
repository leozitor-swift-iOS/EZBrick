//
//  Extensions.swift
//  EZBrick
//
//  Created by Leozítor Floro on 18/10/20.
//

import Foundation

extension NumberFormatter {
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "R$"
        return formatter
    }
}
