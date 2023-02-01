//
//  ViewController.swift
//  SmartGig
//
//  Created by Jagadeesh on 24/01/23.
//
let url = "http://13.232.73.1:8080/smg/admin/adminLogin"

import UIKit

class LoginPageController: UIViewController {
    
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loginView.layer.cornerRadius = 10
        
        
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        
        
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            
            if email == "" && password == "" {

                let alert = UIAlertController(title: "Login", message: "Please Entre Email and password", preferredStyle: .alert)
                let action = UIAlertAction(title: "Done", style: .default) { data in
                    print(data)
                }
                alert.addAction(action)
                self.present(alert, animated: true)

            }else  if email.isValdiateEmail(email: email) {

                let alert = UIAlertController(title: "Login", message: "Please Entre a Validate Email ", preferredStyle: .alert)
                let action = UIAlertAction(title: "Done", style: .default) { data in
                    print(data)
                }
                alert.addAction(action)
                self.present(alert, animated: true)
            }else{
                
                apiCall {
                    
                }
                
                    
//                    switch result {
//                    case.success(_ ):
//                        let alertController = UIAlertController(title: "LOGIN", message: "Your login sucessfully", preferredStyle:.alert)
//                        let action = UIAlertAction(title: "Done", style: .default) { alertAction in
//                            print(alertAction)
//                        }
//                        alertController.addAction(action)
//                        self.present(alertController, animated: true)
//                        let vc = storyboard?.instantiateViewController(withIdentifier: "ApplyLeaveController") as? ApplyLeaveController
//                        navigationController?.pushViewController(vc!, animated: true)
//
//                    case .failure(_):
//                        let alertController = UIAlertController(title: "LOGIN", message: "Your login Error please enter a correct detalies", preferredStyle:.alert)
//                        let action = UIAlertAction(title: "Done", style: .default) { alertAction in
//                            print(alertAction)
//                        }
//                        alertController.addAction(action)
//                        self.present(alertController, animated: true)
//
//
//                    }
                }
                

            }
        }
    
    //        if emailTextField == nil {
    //
    //            let alert = UIAlertController(title: "Login", message: "Please entre the correct email", preferredStyle: .alert)
    //            let action = UIAlertAction(title: "Done", style: .default) { data in
    //                print(data)
    //            }
    //            alert.addAction(action)
    //            self.present(alert, animated: true)
    //
    //
    //        }else if passwordTextField == nil {
    //
    //
    //           let alert = UIAlertController(title: "Login", message: "Please entre the correct password ", preferredStyle: .alert)
    //            let action = UIAlertAction(title: "Done", style: .default) { data in
    //                print(data)
    //            }
    //            alert.addAction(action)
    //            self.present(alert, animated: true)
    //
    //
    //        } else {
    //
    //            apiCall {
    //
    //            }
    //        }
    //
    //
    //}
    
    func apiCall(complation:@escaping() ->Void) {

        if let url = URL(string:"http://13.232.116.42:8080/smg/admin/adminLogin"){

            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"

            let body = Login(email: emailTextField.text!, password: passwordTextField.text!)
            let requestbody = try? JSONEncoder().encode(body)
            urlRequest.httpBody = requestbody
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-type")
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in

                if let data = data {
                    
                    let SuperAdminResponse = try? JSONDecoder().decode(LoginModel.self, from: data)
                    print(SuperAdminResponse as Any)
                    if SuperAdminResponse?.msg == "login Successfil" {
                        
                        DispatchQueue.main.async {

                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            let vc = storyboard.instantiateViewController(withIdentifier: "ApplyLeaveController") as? ApplyLeaveController
                            self.present(vc!, animated: true)


                            let alert = UIAlertController(title: "Login", message: "Login Sucessfully", preferredStyle: .alert)
                            let action = UIAlertAction(title: "Done", style: .default) { data in
                                print(data)
                            }
                            alert.addAction(action)
                            self.present(alert, animated: true)
                        }
                        
                    }else {
                        DispatchQueue.main.async {

                            let alert = UIAlertController(title: "Login", message: "Please enter the Correct Details", preferredStyle: .alert)
                            let action = UIAlertAction(title: "Done", style: .default) { data in
                                print(data)
                            }
                            alert.addAction(action)
                            self.present(alert, animated: true)

                            print("Wrong Detalies")


                        }


                    }
                         
                    }

            }.resume()

        }
    }
    
    @IBAction func passwordHideBtn(_ sender: Any) {
        
        if passwordTextField.isSecureTextEntry == true {
            passwordTextField.isSecureTextEntry = false
            passwordBtn.setImage(UIImage(named: "UnhideIcon"), for: .normal)
        }else {
            passwordTextField.isSecureTextEntry = true
            passwordBtn.setImage(UIImage(named: "HideIcon"), for: .normal)
        }
        
        
    }
    
}
    

extension String {
    
    func isValdiateEmail(email: String) -> Bool {
        let emailReg = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z._]+\\.[A-Za-z]"
        let emailtext = NSPredicate(format: "SELF MATCHES %@", emailReg)
        let result = emailtext.evaluate(with: email)
        return result
        
    }
    
    func isValdiatePassword(password: String) -> Bool {
        let passwordRgex = "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]"
        let passwordText = NSPredicate(format: "SELF MATCHES %@", passwordRgex)
        let result = passwordText.evaluate(with: password)
        return result
    }
}
    


