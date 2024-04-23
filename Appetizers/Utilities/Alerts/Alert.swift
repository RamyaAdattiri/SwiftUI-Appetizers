//
//  Alert.swift
//  Appetizers
//
//  Created by Ramya Adattiri on 2023-12-04.
//

import SwiftUI

struct AlertItem: Identifiable {
    var id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    //MARK: Network Alerts
    static let inValidURL       = AlertItem(title: Text("Server Error"),
                                                   message: Text("There was an issue from connecting to the server. Please contact support"),
                                                   dismissButton: .default(Text("OK")))
    
    static let inValidData      = AlertItem(title: Text("Server Error"),
                                                   message: Text("The data received from server is invalid. Please contact support"),
                                                   dismissButton: .default(Text("OK")))
    
    static let inValidResponse  = AlertItem(title: Text("Server Error"),
                                                   message: Text("Invalid response from server is invalid. Please contact support"),
                                                   dismissButton: .default(Text("OK")))
    
    static let unableToComple   = AlertItem(title: Text("Server Error"),
                                                   message: Text("Unable to complete your request at this time. Please check your internet connection"),
                                                   dismissButton: .default(Text("OK")))
    
    //MARK: Account Alerts
    static let invalidForm   = AlertItem(title: Text("Invalid Form"),
                                                   message: Text("Please ensure all fields have been filled out!"),
                                                   dismissButton: .default(Text("OK")))
    
    static let invalidEmail   = AlertItem(title: Text("Invalid Email"),
                                                   message: Text("Please ensure your email is correct!"),
                                                   dismissButton: .default(Text("OK")))
    
    static let userSaveSuccess   = AlertItem(title: Text("Profile Saved"),
                                                   message: Text("Your profile information was successfully saved!"),
                                                   dismissButton: .default(Text("OK")))
    
    static let invalidUserData   = AlertItem(title: Text("Profile Error"),
                                                   message: Text("There was an error saving/retriving your profile!"),
                                                   dismissButton: .default(Text("OK")))
    
   
    
}
