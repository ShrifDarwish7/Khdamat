//
//  APIServices.swift
//  DFVendors
//
//  Created by Sherif Darwish on 29/12/2020.
//

import Foundation
import Moya
import Firebase

extension Data {
    func getDecodedObject<T>(from object : T.Type)->T? where T : Decodable {
        do {
            return try JSONDecoder().decode(object, from: self)
        } catch let error {
            print("Error Decoding Object ", error)
            return nil
        }
    }
}

class APIServices{
    
    static let shared = APIServices()
    let provider = MoyaProvider<Khdamat>()
    var user: LoginResponse?{
        set{
            let data = try! JSONEncoder.init().encode(newValue)
            UserDefaults.init().setValue(data, forKey: "user")
        }
        get{
            return UserDefaults.init().data(forKey: "user")?.getDecodedObject(from: LoginResponse.self)
        }
    }
    var isLogged: Bool{
        get{
            return UserDefaults.init().bool(forKey: "isLogged")
        }
        set{
            UserDefaults.init().setValue(newValue, forKey: "isLogged")
        }
    }
    
    func call(_ target: Khdamat , _ completed: @escaping (Data?)->Void){
        self.provider.request(target) {
            [weak self] result in
            guard self != nil else { return }
            switch result{
            case .success(let response):
                completed(response.data)
            case .failure(let err):
                print(err)
                completed(nil)
            }
        }
    }
//
//    func signinWith(credential: AuthCredential, _ completed: @escaping (_ token: String?)->Void){
//        Auth.auth().signIn(with: credential) { (authResult, error) in
//            if error != nil {
//                print("err auth",error)
//                completed(nil)
//                return
//            }
//
//            authResult?.user.getIDToken(completion: { (token, error) in
//
//                if let token = token {
//
//                    print("Token",token)
//                    completed(token)
//
//                }else{
//                    print("token fail")
//                    completed(nil)
//                }
//
//            })
//        }
//    }
    
}
