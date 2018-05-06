//
//  LoginInteractorImpl.swift
//  logintest
//
//  Created by jose luis sanchez-porro godoy on 06/05/2018.
//  Copyright © 2018 jose luis sanchez-porro godoy. All rights reserved.
//

import Foundation

public class LoginInteractorImpl: LoginInteractorProtocol {
    public func execute(email: String, password: String, onLogin: @escaping (String) -> Void, onError: @escaping (String) -> Void) {
        
        // Create JSON data body
        var jsonBody = [String:Any]()
        jsonBody["email"] = email
        jsonBody["password"] = password
        do{
            let body = try JSONSerialization.data(withJSONObject: jsonBody, options: [])
            // Get URL
            let userLoginURL = "https://playtour-api.azurewebsites.net/api/auth/user"
            if let url = URL(string: userLoginURL){
                let session = URLSession.shared
                var request = URLRequest(url: url)
                request.httpBody = body
                request.httpMethod = "POST"
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                let task = session.dataTask(with: request, completionHandler: { (data: Data?,
                    response: URLResponse?, error: Error?) in
                    if error != nil {
                        OperationQueue.main.addOperation {
                            onError("Conexion Error to API")
                        }
                    }else if data != nil{
                        OperationQueue.main.addOperation {
                            onLogin("Login correcto")
                        }
                    }
                
                })
                task.resume()
            }
        } catch {
            OperationQueue.main.addOperation {
                onError("Parse incorrect.")
            }
        }
    }
}
