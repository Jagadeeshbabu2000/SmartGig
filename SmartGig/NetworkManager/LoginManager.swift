//
//  LoginManager.swift
//  SmartGig
//
//  Created by Jagadeesh on 01/02/23.
//

import Foundation
import Alamofire
import UIKit

enum APIError: Error {
    case custom(message: String)
}
typealias Handler = (Swift.Result<Any?, Error>) -> Void

struct NetworkManager {
    static let shared = NetworkManager()
    
    func loginApi(login: Login, compalation: Handler) {
        
        let headers : HTTPHeaders = [
            "Content-Type" : "application/json"]
        AF.request(login_url,method: .post, parameters: login,encoder: JSONParameterEncoder.default,headers:headers  ).response { response in
        debugPrint(response)
            

//            switch response.result {
//            case.success(let data):
//                do {
//
//                    let jsonrequest = try? JSONDecoder().decode(LoginModel.self, from: data!)
//                    print(jsonrequest as Any)
//
//            } catch {
//                    print(error.localizedDescription)
//                }
//            case .failure(let err):
//                print(err.localizedDescription)
//            }

        }




    }
        
//                if let url = URL(string:"http://13.232.73.1:8080/smg/admin/adminLogin"){
//
//                    var urlRequest = URLRequest(url: url)
//                    urlRequest.httpMethod = "POST"
//
//                    let body = Login(email: emailTextField.text!, password: passwordTextField.text!)
//                    let requestbody = try? JSONEncoder().encode(body)
//                    urlRequest.httpBody = requestbody
//                    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-type")
//                    URLSession.shared.dataTask(with: urlRequest) { data, response, error in
//
//                        if let data = data {
//                            let SuperAdminResponse = try? JSONDecoder().decode(LoginModel.self, from: data)
//
//
//
//                            if SuperAdminResponse != nil {
//
//                                DispatchQueue.main.async {
//
//                                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                                    let vc = storyboard.instantiateViewController(withIdentifier: "ApplyLeaveController") as? ApplyLeaveController
//                                    self.navigationController?.pushViewController(vc!, animated: true)
//
//
//                                    let alert = UIAlertController(title: "Login", message: "Login Sucessfully", preferredStyle: .alert)
//                                    let action = UIAlertAction(title: "Done", style: .default) { data in
//                                        print(data)
//                                    }
//                                    alert.addAction(action)
//                                    self.present(alert, animated: true)
//                                }
//
//                            } else {
//
//                                DispatchQueue.main.async {
//
//                                    let alert = UIAlertController(title: "Login", message: "Please entre the Correct Detalies", preferredStyle: .alert)
//                                    let action = UIAlertAction(title: "Done", style: .default) { data in
//                                        print(data)
//                                    }
//                                    alert.addAction(action)
//                                    self.present(alert, animated: true)
//
//                                    print("Wrong Detalies")
//
//
//                                }
//
//
//                            }
//                        }
//
//                    }.resume()
//
//                }
//            }
        
        
}
