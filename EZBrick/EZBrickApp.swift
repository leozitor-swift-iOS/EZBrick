//
//  EZBrickApp.swift
//  EZBrick
//
//  Created by Leozítor Floro on 03/09/20.
//

import SwiftUI

@main
struct EZBrickApp: App {
    var body: some Scene {
        WindowGroup {
            let app = EZBrickViewModel()
            EZBrickView(viewModel: app)
        }
    }
}
