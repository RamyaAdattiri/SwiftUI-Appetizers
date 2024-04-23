//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Ramya Adattiri on 2023-11-29.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizersListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView{
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            viewModel.isShowingDetail = true
                            viewModel.selectedAppetizer = appetizer
                        }
                }
                .navigationTitle("🍟 Appetizers")
                .listStyle(.plain)
                .disabled(viewModel.isShowingDetail)
            }
            .task {
                viewModel.getAppetizers()
            } 
            .blur(radius: viewModel.isShowingDetail ?  20 : 0)
            
            if(viewModel.isShowingDetail){
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer! ,
                                    isShowingDetail: $viewModel.isShowingDetail)
            }
            
            if(viewModel.isLoading) {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AppetizerListView()
}
