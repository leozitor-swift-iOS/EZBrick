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
        //Sale of Realty
        
        
        // Rent Apartment
        
        // Premises
        var value:Double? = nil
        var contractValue: Double? = nil
        var reformCost: Double? = nil
        var size: Double? = nil
        var buyDate: Date? = nil
        var notaryCost: Double? = nil
        var notaryDate: Date? = nil
        var financeITBI: Bool? = nil
        var financeEntry: Double? = nil
        var financeDate: Date? = nil
        var financeRate: Double? = nil
        var financeRevision: Date? = nil
        var financeNewRate: Date? = nil
        var financeDuration: Int? = nil
        var installmentType: String? = nil
        var princeInstallment: Double? = nil
        var withdrawInvestimentOption: String? = nil
        var returnOfInvestiment: Double? = nil
        var rental: Double? = nil
        var rentCorrection: Double? = nil
        var brokerageFee: Double? = nil
        var reinvestSale: Double? = nil
        var deductibleReformRate: Double? = nil
        var deductibleInterest: Double? = nil
        
        
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
        
        var isPersonEmpty: Bool {
            if firstName.isEmpty || lastName.isEmpty || age.isEmpty ||
                cpf.isEmpty || occupation.isEmpty || email.isEmpty {
                return true
            }
            return false
        }
        
    }
}

