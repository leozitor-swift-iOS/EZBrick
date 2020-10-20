//
//  EZBrickViewModel.swift
//  EZBrick
//
//  Created by Leozítor Floro on 28/09/20.
//

import SwiftUI

class EZBrickViewModel: ObservableObject {
    @Published private var model: BuyOrRent = EZBrickViewModel.createUsers()
    
    private static func createUsers() -> BuyOrRent {
        let app = BuyOrRent()
        return app
    }
    
    // MARK: - Access to the Model
    var user: BuyOrRent.Person {
        model.user
    }
    var user_partner: BuyOrRent.Person {
        model.userPartner
    }
    var house: BuyOrRent.Realty {
        model.house
    }
}
