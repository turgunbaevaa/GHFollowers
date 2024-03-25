//
//  ErrorMessage.swift
//  GHFollowers
//
//  Created by Aruuke Turgunbaeva on 25/3/24.
//

import Foundation

enum GFErrorMessage: String, Error {
    case invalidUserName = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please, check your internet connection."
    case invalidResponse = "Invalid response from the server. Please, try again."
    case invalidData = "The data received from the server was invalid. Please, try again."
}
