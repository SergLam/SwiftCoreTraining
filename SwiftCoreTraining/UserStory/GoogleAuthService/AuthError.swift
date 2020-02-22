//
//  AuthError.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 22.02.2020.
//  Copyright © 2020 serglam. All rights reserved.
//

import Foundation

enum AuthError: Error, LocalizedError {
    
    case notFound
    case notAuthorized
    case unableToGetUserProfile
    case unableToLogOut
    
    case googleSignInFailure
    
    case serverError(failureReason: String)
    case emptyToken
    case emptyRefreshToken
    case emptyResponseValues
    
    case invalidPassword
    case emptyPassword
    
    case noError
    
    var description: String {
        switch self {
        case .notFound:
            return "Not found"
            
        case .notAuthorized:
            return "Authorization error. You should sign in first"
            
        case .unableToGetUserProfile:
            return "Failed to load user profile"
            
        case .unableToLogOut:
            return "Unable to log out"
            
        case .googleSignInFailure:
            return "Unable to login with Google"
            
        case .serverError(let failureReason):
            return failureReason
            
        case .emptyToken:
            return "Token data is empty"
            
        case .emptyRefreshToken:
            return "Refresh token is empty"
            
        case .emptyResponseValues:
            return "Some of required values is empty"
            
        case .invalidPassword:
            return "Invalid password"
            
        case .emptyPassword:
            return "Current password is empty"
            
        case .noError:
            return "No error should be shown"
        }
    }
    
    var errorDescription: String? {
        return self.description
    }
    
}
