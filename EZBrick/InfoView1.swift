//
//  InfoView1.swift
//  EZBrick
//
//  Created by Leozítor Floro on 04/09/20.
//

import SwiftUI

struct InfoView1: View {
    @EnvironmentObject var viewModel: EZBrickViewModel
    
    @Binding var user: BuyOrRent.Person
    @Binding var userPartner: BuyOrRent.Person
    @Binding var house: BuyOrRent.Realty
    
    var option: String
    
    var body: some View {
        HeaderInfoView(progress: 0.1) {
            fillInfo(user: $user, userPartner: $userPartner)
                .navigationBarTitle("Cadastro")
                .navigationBarItems(trailing: NavigationLink(
                                        destination: InfoView2(user: $user, userPartner: $userPartner, house: $house).animation(.easeInOut),
                                        label: {
                                            Text("SEGUINTE")
                                        })
                )
        }
    }
    
    @State private var spouseTrue = true
    
    @ViewBuilder
    func fillInfo (user: Binding<BuyOrRent.Person>, userPartner: Binding<BuyOrRent.Person>) -> some View {
        Form {
            Section(header: Text("Preencha Suas Informações Pessoais")){
                fillUserInfo(person: user)
                Toggle(isOn: $spouseTrue.animation(.easeInOut)) {
                    Text("PRETENDE COMPRAR SOZINHO ?").font(.footnote)
                }
            }
            if(spouseTrue == false) {
                Section(header: Text("Preencha Informações do Conjuge")){
                    fillUserInfo(person: userPartner)
                }.transition(.opacity)
            }
        }
    }
}

@ViewBuilder
func fillUserInfo(person: Binding<BuyOrRent.Person>) -> some View {
    TextField("Primeiro Nome", text: person.firstName)
    TextField("Sobrenome", text: person.lastName)
    TextField("Idade", text: person.age)
        .keyboardType(.numberPad)
    TextField("Email", text: person.email)
        .keyboardType(.emailAddress)
    TextField("CPF", text: person.cpf)
        .keyboardType(.numbersAndPunctuation)
    TextField("Profissão", text: person.occupation)
    
}

struct InfoView1_Previews: PreviewProvider {
    @State static var user = BuyOrRent.Person(firstName: "Leozitor", lastName: "Floro", age: "27", cpf: "", occupation: "", email: "")
    @State static var userPartner = BuyOrRent.Person(firstName: "Farluce", lastName: "Chaves", age: "29", cpf: "", occupation: "", email: "")
    @State static var house = BuyOrRent.Realty()
    
    static var previews: some View {
        InfoView1(user: $user, userPartner: $userPartner, house: $house, option: "")
    }
}
