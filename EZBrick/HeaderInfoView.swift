//
//  HeaderInfoView.swift
//  EZBrick
//
//  Created by Leozítor Floro on 18/10/20.
//

import SwiftUI

struct HeaderInfoView<Content: View>: View {
    let content: Content
    let progress: Double
    
    init(progress:Double, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.progress = progress
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progress).padding(.all, 10)
            content
            //TODO: insert the infos about the navigation view items and etc
        }
    }
}
