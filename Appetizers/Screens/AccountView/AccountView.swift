//
//  AccountView.swift
//  Appetizers
//
//  Created by Ramya Adattiri on 2023-11-29.
//

import SwiftUI

struct AccountView: View {
    @StateObject private var viewModel = AccountViewModel()
    @FocusState private var focussedTextField: FormTextField?
    
    enum FormTextField {
        case firstname , lastName , email
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Personal Info")){
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focussedTextField, equals: .firstname)
                        .onSubmit { focussedTextField = .lastName }
                        .submitLabel(.next)
                    
                        
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focussedTextField, equals: .lastName)
                        .onSubmit { focussedTextField = .email }
                        .submitLabel(.next)
                        
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focussedTextField, equals: .email)
                        .onSubmit { focussedTextField = nil }
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        
                    
                    DatePicker("Bithday", selection: $viewModel.user.birthDate, displayedComponents: .date)
                    
                    Button{
                        viewModel.saveChanges()
                    }label: {
                        Text("Save Changes")
                    }
                }
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                
            }
            .navigationTitle("😃 Account")
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("Dismiss") {
                        focussedTextField = nil
                    }
                }
            }
        }
        .onAppear{
            viewModel.retriveUser()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
        
    }
}

#Preview {
    AccountView()
}
