//
//  Provider.swift
//  Khdamat
//
//  Created by Sherif Darwish on 18/02/2021.
//

import Foundation
import Moya


public enum Khdamat{
    case login(_ prms: [String:String])
    case signup(_ prms: [String:String])
    case rentalBookPost(_ prms: [String:String], _ id: Int)
    case rentalBookGet(_ id: Int)
    case rentalBookUpdateStatus(_ prms: [String:String], _ id: Int)
    case roadHelpBookUpdateStatus(_ prms: [String:String], _ id: Int)
    case carWashBookUpdateStatus(_ prms: [String:String], _ id: Int)
    case getRentalCars
}

extension Khdamat: TargetType{
    public var baseURL: URL {
        return URL(string: "https://khdamat.app")!
    }
    
    public var path: String {
        switch self {
        case .login(_): return "api/user/login"
        case .signup(_): return "api/user/signup"
        case .rentalBookGet(let id), .rentalBookPost(_, let id):
            return "api/user/rental/book/\(id)"
        case .rentalBookUpdateStatus(_, let id): return "api/user/rental/book/\(id)/update/status"
        case .roadHelpBookUpdateStatus(_, let id):
            return "api/user/roadHelp/book/\(id)/update/status"
        case .carWashBookUpdateStatus(_, let id):
            return "api/user/carwash/book/\(id)/update/status"
        case .getRentalCars: return "api/user/rental/get/cars"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .login(_),
             .signup(_),
             .carWashBookUpdateStatus(_, _),
             .rentalBookPost(_, _),
             .rentalBookUpdateStatus(_, _),
             .roadHelpBookUpdateStatus(_, _):
            return .post
            
        case .rentalBookGet(_),
             .getRentalCars:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .login(let prms),
             .signup(let prms),
             .carWashBookUpdateStatus(let prms, _),
             .rentalBookPost(let prms, _),
             .rentalBookUpdateStatus(let prms, _),
             .roadHelpBookUpdateStatus(let prms, _):
            var multipartFormData = [MultipartFormData]()
            for (key,value) in prms{
                let formData = MultipartFormData(provider: .data("\(value)".data(using: .utf8)!), name: key)
                multipartFormData.append(formData)
            }
            return .uploadMultipart(multipartFormData)
        default:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        case .login(_),
             .signup(_):
            return ["Accept": "application/json"]
        case .carWashBookUpdateStatus(_, _),
             .rentalBookPost(_, _),
             .rentalBookUpdateStatus(_, _),
             .roadHelpBookUpdateStatus(_, _),
             .rentalBookGet(_),
             .getRentalCars:
            return Shared.headers
        }
    }
    
    
}
