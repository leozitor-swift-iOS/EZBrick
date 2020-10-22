//
//  InfoView2.swift
//  EZBrick
//
//  Created by Leozítor Floro on 04/09/20.
//

import SwiftUI

struct InfoView2: View {
    @EnvironmentObject var viewModel: EZBrickViewModel
    
    @State var warrantyFund = false
    
    @Binding var user: BuyOrRent.Person
    @Binding var userPartner: BuyOrRent.Person
    @Binding var house: BuyOrRent.Realty
    
    var currentYear: Int = 2020
    
    var body: some View {
        HeaderInfoView(progress: 0.3) {
            Text("\(viewModel.user.firstName)")
            Form {
                Section(header: Text("Fundo de Garantia")) {
                    Toggle(isOn: $warrantyFund) {
                        Text("Sabe Quanto Possui ?")
                    }
                    if warrantyFund {
                        TextField("R$ 0,00", value: $user.warrantyFund, formatter: NumberFormatter.currency)
                            .keyboardType(.decimalPad)
                            .font(.title2)
                    }
                }
                Section(header: Text("Tempo de Trabalho")) {
                    Picker(selection: $user.yearsWorking, label: Text("Quantos Anos ?")) {
                        ForEach(0 ..< 99) {
                            Text("\(String($0)) Anos")
                        }
                    }
                }
                if user.yearsWorking > 0{
                    Section(header: Text("Em média Qual o Salário de Cada Mês ?")) {
                        ScrollView {
                            ForEach(0 ..< user.yearsWorking) { index in
                                HStack {
                                    Text(String(currentYear - user.yearsWorking + index))
                                    Slider(value: $user.incomePerYear[index])
                                    Text("R$ \(String(format: "%.0f",user.incomePerYear[index] * 10000))")
                                }
                                .padding(.vertical, 10)
                            }
                        }
                    }
                    Section(header: Text("E Quanto a Remuneração Variável ?")) {
                        ScrollView {
                            ForEach(0 ..< user.yearsWorking) { index in
                                HStack {
                                    Text(String(currentYear - user.yearsWorking + index))
                                    Slider(value: $user.variableIncomePerYear[index])
                                    Text("R$ \(String(format: "%.0f", user.variableIncomePerYear[index] * 10000))")
                                }
                                .padding(.vertical, 10)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Financeiro \(user.firstName)"))
            .navigationBarItems(
                leading: NavigationLink(
                    destination: InfoView1(
                        user: $user,
                        userPartner: $userPartner,
                        house: $house,
                        option: ""), label: {}),
                trailing: NavigationLink(
                    destination: InfoView3(user: $user, userPartner: $userPartner, house: $house),
                    label: {
                        Text("Seguinte")
                    })
            )
        }
    }
}
/*
struct InfoView2_Previews: PreviewProvider {
    @State static var user = BuyOrRent.Person(firstName: "Leozitor", lastName: "Floro", age: "27", cpf: "", occupation: "", email: "")
    @State static var userPartner = BuyOrRent.Person(firstName: "Farluce", lastName: "Chaves", age: "29", cpf: "", occupation: "", email: "")
    @State static var house = BuyOrRent.Realty()
    
    static var previews: some View {
        InfoView2(user: $user, userPartner: $userPartner, house: $house)
    }
}
*/
