//
//  ViewController.swift
//  logintest
//
//  Created by jose luis sanchez-porro godoy on 06/05/2018.
//  Copyright © 2018 jose luis sanchez-porro godoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var paswordLabel: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doLogin(_ sender: Any) {
        activityIndicator.startAnimating()
        let loginInteractor : LoginInteractorProtocol = LoginInteractorImpl()
        loginInteractor.execute(email: nameLabel.text!, password: paswordLabel.text!, onLogin: { (login)  in
            self.activityIndicator.stopAnimating()
            print(login)
            self.clearUI()
        }) { (error) in
            self.activityIndicator.stopAnimating()
            print(error)
        }
    }
    
    func clearUI()  {
        nameLabel.text = ""
        paswordLabel.text = ""
    }
    
}

