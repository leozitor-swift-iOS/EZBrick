//
//  EZBrickView.swift
//  EZBrick
//
//  Created by Leozítor Floro on 03/09/20.
//

import SwiftUI

struct EZBrickView: View {
    @ObservedObject var viewModel: EZBrickViewModel
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    Text("EZ Brick").font(.largeTitle).padding(.top, 20)
                    HStack{
                        button(image: Image("invest"), text: Text("INVESTIR EM IMÓVEL"), option: "rent")
                        Spacer(minLength: 10)
                        button(image: Image("house"), text: Text("COMPRAR OU VENDER"), option: "buy")
                    }.padding(.horizontal, 20.0)
                    .frame(width: geometry.size.width, height: 250, alignment: .center)
                    Spacer()
                    Text("Informações de como App Funciona")
                    Spacer()
                }
                .navigationBarHidden(true)
            }
        }
    }
    
    @ViewBuilder
    func button(image: Image, text: Text, option: String) -> some View {
        VStack {
            NavigationLink(
                destination: InfoView1(viewModel: viewModel, option: option),
                label: {
                    ZStack {
                        Rectangle().foregroundColor(.clear)
                            .background(RadialGradient(gradient: Gradient(colors: [.gray, .white]), center: .center, startRadius: 10, endRadius: 200))
                        image.resizable()
                            .padding(.all, 10)
                    }.cornerRadius(buttonCornerRadius)
                })
            text.font(.title3)
                .multilineTextAlignment(.center)
        }
    }
    // MARK: - Drawing Constants
    
    private let buttonCornerRadius: CGFloat = 20
    private let buttonGradient: CGFloat = 20
    private let edgeLineWidth: CGFloat = 3
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EZBrickView(viewModel: EZBrickViewModel())
    }
}
