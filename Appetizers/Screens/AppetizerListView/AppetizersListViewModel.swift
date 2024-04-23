//
//  AppetizersListViewModel.swift
//  Appetizers
//
//  Created by Ramya Adattiri on 2023-12-04.
//

import SwiftUI

@MainActor final class AppetizersListViewModel: ObservableObject{
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    @Published  var isShowingDetail = false;
    @Published  var selectedAppetizer: Appetizer?
    
    func getAppetizers() {
        isLoading = true;
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false;
            } catch {
                if let apError = error as? APError {
                    switch apError {
                    case .invalidData:
                        alertItem = AlertContext.inValidData
                    case .invalidURL:
                        alertItem = AlertContext.inValidURL
                    case .invalidResponse:
                        alertItem = AlertContext.inValidResponse
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComple
                    }
                }else {
                    alertItem = AlertContext.inValidResponse
                }
              
                isLoading = false;
            }
        }
    }
    
//    func getAppetizers() {
//        isLoading = true;
//        NetworkManager.shared.getAppetizers { result in
//            DispatchQueue.main.async { [self] in
//                isLoading = false
//                switch(result) {
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//                case .failure(let error):
//                    switch(error) {
//                    case .invalidData:
//                        alertItem = AlertContext.inValidData
//                    case .invalidURL:
//                        alertItem = AlertContext.inValidURL
//                    case .invalidResponse:
//                        alertItem = AlertContext.inValidResponse
//                    case .unableToComplete:
//                        self.alertItem = AlertContext.unableToComple
//                    }
//                    print(error.localizedDescription)
//                }
//            }
//           
//        }
//    }
}
