//
//  GoogleAuthService.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 22.02.2020.
//  Copyright © 2020 serglam. All rights reserved.
//

import Firebase
import FirebaseAuth
import Foundation
import GoogleSignIn

// TODO: Insert your codable model here
typealias AuthClosure = (Swift.Result<String/*UserJSON*/, Error>) -> Void
typealias VoidResultClosure = (Swift.Result<Void, Error>) -> Void

final class GoogleAuthorizationService: NSObject {
    
    private let decoder = JSONDecoder()
    
    private var googleCompletion: AuthClosure?
    
    // MARK: - Life cycle
    override init() {
        super.init()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
    }
    
    // MARK: - Public methods
    func loginToGoogle(view: UIViewController, completion: @escaping AuthClosure) {
        
        googleCompletion = completion
        GIDSignIn.sharedInstance()?.presentingViewController = view
        logInWithGoogle()
    }
    
    // MARK: - Private methods
    private func logInWithGoogle() {
        GIDSignIn.sharedInstance().signIn()
    }
    
    /**
     SignUp with Gmail to your server
     */
    private func signUpGmail(request: AuthRequest,
                             credential: AuthCredential,
                             completion: @escaping AuthClosure) {
        
        // TODO: Perform request to your server in order to authorise user
        // TODO: Replace AuthRequest with your codable model if needed
        
//        RestAPI.request(.loginByProvider(request)) { [weak self] result in
//            switch result {
//
//            case .success(let response):
//                do {
                    // TODO: Parse server response here
                    
//                    guard let user = try self?.decoder.decode(UserJSON.self, from: response.data) else {
//                        let error = AuthError.serverError(failureReason: "Unable to parse response")
//                        completion(.failure(error))
//                        return
//                    }
//                    guard user.token != nil else {
//                        let error = AuthError.emptyToken
//                        completion(.failure(error))
//                        return
//                    }
//                    UserDefaults.shared.accessToken = user.token
//                    DataManager.shared.safeWrite(value: [MyUser(user: user)])
//                    completion(.success((user)))
                   
//                } catch {
//                    completion(.failure(error))
//                }
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
        
    }
    
    private func signUpGmailFirebase(credential: AuthCredential,
                                     completion: @escaping VoidResultClosure) {
        
        Auth.auth().signIn(with: credential) { _, error in
            guard let error = error else {
                completion(.success(()))
                return
            }
            completion(.failure(error))
        }
    }
    
}

// MARK: - GIDSignInDelegate
extension GoogleAuthorizationService: GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if error != nil {
            // Usually call when user cancel auth flow - we should not show error message in this case
            googleCompletion?(.failure(AuthError.noError))
            return
        }
        guard let authentication = user?.authentication else {
            googleCompletion?(.failure(AuthError.googleSignInFailure))
            return
        }
        
        let request = AuthRequest(type: .gmail, token: authentication.idToken)
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        guard let closure = googleCompletion else {
            let message: String = "Closure was'nt provided"
            assertionFailure(message)
            // ErrorLoggerService.logWithTrace(message)
            return
        }
        
        signUpGmail(request: request, credential: credential, completion: closure)
    }
    
    func logOut(_ completion: (() -> Void)? = nil) {
        GIDSignIn.sharedInstance().signOut()
    }
}
