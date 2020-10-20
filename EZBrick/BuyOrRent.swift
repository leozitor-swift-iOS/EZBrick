//
//  Person.swift
//  EZBrick
//
//  Created by Leozítor Floro on 14/09/20.
// EZ Brick Model

import Foundation

struct BuyOrRent {
    var user: Person
    var userPartner: Person
    var house: Realty
    
    init() {
        user = Person()
        userPartner = Person()
        house = Realty()
    }
    
    struct Realty {
        var value:Double? = nil
        var contractValue: Double? = nil
        var reformCost: Double? = nil
        var size: Double? = nil
        var buyDate: Date? = nil
    }
    
    struct Person {
        var firstName: String = ""
        var lastName: String = ""
        var age: String = ""
        var cpf: String = ""
        var occupation: String = ""
        var email: String = ""
        var warrantyFund: Double = 0
        var yearsWorking: Int = 0
        var incomePerYear = Array(repeating: 0.0, count: 99)
        var variableIncomePerYear = Array(repeating: 0.0, count: 99)
        
    }
}

