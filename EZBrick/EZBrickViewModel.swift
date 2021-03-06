//
//  EZBrickViewModel.swift
//  EZBrick
//
//  Created by Leozítor Floro on 28/09/20.
//

import SwiftUI

class EZBrickViewModel: ObservableObject {
    @Published var model: BuyOrRent = EZBrickViewModel.createUsers()
    
    static func createUsers() -> BuyOrRent {
        let app = BuyOrRent()
        return app
    }
    
    // MARK: - Access to the Model
    var user: BuyOrRent.Person {
        model.user
    }

}
