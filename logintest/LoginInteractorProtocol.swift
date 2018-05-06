//
//  LoginInteractorProtocol.swift
//  logintest
//
//  Created by jose luis sanchez-porro godoy on 06/05/2018.
//  Copyright © 2018 jose luis sanchez-porro godoy. All rights reserved.
//

import Foundation
public protocol LoginInteractorProtocol {
    func execute(email: String,
                 password: String,
                 onLogin: @escaping (String) -> Void,
                 onError: @escaping (String) -> Void)
}
