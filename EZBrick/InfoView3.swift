//
//  InfoView3.swift
//  EZBrick
//
//  Created by Leozítor Floro on 18/10/20.
//

import SwiftUI

struct InfoView3: View {
    @Binding var user: BuyOrRent.Person
    @Binding var userPartner: BuyOrRent.Person
    @Binding var house: BuyOrRent.Realty
    
    var body: some View {
        HeaderInfoView(progress: 0.6) {
            Form {
                Section(header: Text("Imóvel")) {
                    TextField("Preço Imóvel", value: $house.value, formatter: NumberFormatter.currency)
                    TextField("Valor do Contrato", value: $house.contractValue, formatter: NumberFormatter.currency)
                    TextField("Reforma", value: $house.reformCost, formatter: NumberFormatter.currency)
                    TextField("Tamanho do Apto.", value: $house.size, formatter: NumberFormatter())
                    TextField("Data da Compra", value: $house.buyDate, formatter: DateFormatter())
                }
            }
            .navigationBarTitle(Text("Premissas"))
            .navigationBarItems(
                trailing: NavigationLink(
                    destination: EmptyView(),
                    label: {
                        Text("Seguinte")
                    })
            )
        }
    }
}

struct InfoView3_Previews: PreviewProvider {
    @State static var user = BuyOrRent.Person(firstName: "Leozitor", lastName: "Floro", age: "27", cpf: "", occupation: "", email: "")
    @State static var userPartner = BuyOrRent.Person(firstName: "Farluce", lastName: "Chaves", age: "29", cpf: "", occupation: "", email: "")
    @State static var house = BuyOrRent.Realty()
    
    static var previews: some View {
        InfoView3(user: $user, userPartner: $userPartner, house: $house)
    }
}

