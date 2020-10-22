//
//  InfoView2.swift
//  EZBrick
//
//  Created by Leozítor Floro on 04/09/20.
//

import SwiftUI

struct InfoView2: View {
    @ObservedObject var viewModel: EZBrickViewModel
    
    @State var warrantyFund = false
    
    var currentYear: Int = 2020
    
    var body: some View {
        HeaderInfoView(progress: 0.3) {
            Form {
                Section(header: Text("Fundo de Garantia")) {
                    Toggle(isOn: $warrantyFund) {
                        Text("Sabe Quanto Possui ?")
                    }
                    if warrantyFund {
                        TextField("R$ 0,00", value: $viewModel.model.user.warrantyFund, formatter: NumberFormatter.currency)
                            .keyboardType(.decimalPad)
                            .font(.title2)
                    }
                }
                Section(header: Text("Tempo de Trabalho")) {
                    Picker(selection: $viewModel.model.user.yearsWorking, label: Text("Quantos Anos ?")) {
                        ForEach(0 ..< 99) {
                            Text("\(String($0)) Anos")
                        }
                    }
                }
                if viewModel.model.user.yearsWorking > 0{
                    Section(header: Text("Em média Qual o Salário de Cada Mês ?")) {
                        ScrollView {
                            ForEach(0 ..< viewModel.model.user.yearsWorking) { index in
                                HStack {
                                    Text(String(currentYear - viewModel.model.user.yearsWorking + index))
                                    Slider(value: $viewModel.model.user.incomePerYear[index])
                                    Text("R$ \(String(format: "%.0f",viewModel.model.user.incomePerYear[index] * 10000))")
                                }
                                .padding(.vertical, 10)
                            }
                        }
                    }
                    Section(header: Text("E Quanto a Remuneração Variável ?")) {
                        ScrollView {
                            ForEach(0 ..< viewModel.model.user.yearsWorking) { index in
                                HStack {
                                    Text(String(currentYear - viewModel.model.user.yearsWorking + index))
                                    Slider(value: $viewModel.model.user.variableIncomePerYear[index])
                                    Text("R$ \(String(format: "%.0f", viewModel.model.user.variableIncomePerYear[index] * 10000))")
                                }
                                .padding(.vertical, 10)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Financeiro \(viewModel.model.user.firstName)"))
            .navigationBarItems(
                leading: NavigationLink(
                    destination: InfoView1(
                        viewModel: viewModel,
                        option: ""), label: {}),
                trailing: NavigationLink(
                    destination: InfoView3(viewModel: viewModel),
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
