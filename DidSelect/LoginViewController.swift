//
//  LoginViewController.swift
//  DidSelect
//
//  Created by Mac on 03/05/34.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true

      
    }

    func showAlertForEmpty()
    {
        let alert = UIAlertController(title: title, message: "Please Enter UserName and Password", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in
            print("Tapped Dismiss")
        }))
     present(alert, animated: true)
    }
        
        
        func showAlertCheck()
        {
            let alertCheck = UIAlertController(title: title, message: "please Enter Valid UserName And PassWord", preferredStyle: .alert)
            alertCheck.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in
                print("Tapped Dismiss")
            }))
            present(alertCheck, animated: true)
        }
            
            
             func loginSuccefully()
            {
                let alertForLogin = UIAlertController(title: title, message: "Login Successfully", preferredStyle: .alert)
                alertForLogin.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { action in
                    print("Ok")
                }))
                present(alertForLogin, animated: true)
            
    }
        
       
    @IBAction func loginButton(_ sender: Any) {

        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        if(self.userNameField.text == "" || self.passwordField.text == "")
        {
            showAlertForEmpty()
        }
        
        if(self.userNameField.text != "Akshay" || self.passwordField.text != "akshay@123")
            {
            showAlertCheck()
            }
        
                self.navigationController?.pushViewController(viewController, animated: true)
          loginSuccefully()
            }
        }
    

    
