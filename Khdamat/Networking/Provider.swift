//
//  Provider.swift
//  Khdamat
//
//  Created by Sherif Darwish on 18/02/2021.
//

import Foundation
import Moya
import UIKit

public enum Khdamat{
    case login(_ prms: [String:String])
    case signup(_ prms: [String:String])
    case verifyAccount(_ prms: [String:String])
    case forgotPassword(_ prms: [String:String])
    case resendOTP
    case verifyOtpForget(_ prms: [String:String])
    case newPasswordWithForget(_ prms: [String:String])
    case rentalBookPost(_ prms: [String:String], _ id: Int)
    case rentalBookGet(_ id: Int)
    case rentalBookUpdateStatus(_ prms: [String:String], _ id: Int)
    case roadHelpBookUpdateStatus(_ prms: [String:String], _ id: Int)
    case carWashBookUpdateStatus(_ prms: [String:String], _ id: Int)
    case getCarAttributes
    case postCar(_ prms: [String:String])
    case getRentalCars
    case getServices
    case getMyCars
    case postCarWashBook(_ prms: [String:String])
    case getRoadHelpServices
    case postRoadHelpBook(_ prms: [String:String])
    case getMyRoadHelpBook(_ id: Int)
    case getMyWashingBook(_ id: Int)
    case getGarageServices
    case postGarageBook(_ prms: [String:String])
    case garageAddMsgText(_ prms: [String:String])
    case getMyGarageBook(_ id: Int)
    case postSparePartBook(_ prms: [String:String],_ images: [String:UIImage])
    case getMySpareBook(_ id: Int)
}

extension Khdamat: TargetType{
    public var baseURL: URL {
        return URL(string: "https://khdamat.app")!
    }
    
    public var path: String {
        switch self {
        case .login(_): return "api/user/login"
        case .signup(_): return "api/user/signup"
        case .verifyAccount(_): return "/api/user/verify_account"
        case .forgotPassword(_): return "/api/user/forget"
        case .rentalBookGet(let id), .rentalBookPost(_, let id):
            return "api/user/rental/book/\(id)"
        case .rentalBookUpdateStatus(_, let id): return "api/user/rental/book/\(id)/update/status"
        case .roadHelpBookUpdateStatus(_, let id):
            return "api/user/roadHelp/book/\(id)/update/status"
        case .carWashBookUpdateStatus(_, let id):
            return "api/user/carwash/book/\(id)/update/status"
        case .getRentalCars: return "api/user/rental/get/cars"
        case .getCarAttributes: return "/api/user/main/car/add"
        case .postCar(_):return "/api/user/profile/car/add"
        case .getServices: return "/api/user/carwash/get/services"
        case .getMyCars: return "/api/user/profile/cars"
        case .postCarWashBook(_): return "/api/user/carwash/book"
        case .getRoadHelpServices: return "/api/user/roadHelp/get/services"
        case .postRoadHelpBook(_): return "/api/user/roadHelp/book"
        case .resendOTP: return "/api/user/resend_verify_otp"
        case .verifyOtpForget(_): return "/api/user/verify_otp_forget"
        case .newPasswordWithForget(_): return "/api/user/new_password_with_forget_otp"
        case .getMyRoadHelpBook(let id): return "/api/user/roadHelp/book/\(id)"
        case .getMyWashingBook(let id): return "/api/user/carwash/book/\(id)"
        case .getGarageServices: return "/api/user/garage/get/services"
        case .postGarageBook(_): return "/api/user/garage/book"
        case .garageAddMsgText(_): return "/api/user/profile/garageAddMessageText"
        case .getMyGarageBook(let id): return "/api/user/garage/book/\(id)"
        case .postSparePartBook(_,_): return "/api/user/Spare_parts/book"
        case .getMySpareBook(let id): return "/api/user/Spare_parts/book/\(id)"
        }
    }
    public var method: Moya.Method {
        switch self {
        case .login(_),
             .signup(_),
             .carWashBookUpdateStatus(_, _),
             .rentalBookPost(_, _),
             .rentalBookUpdateStatus(_, _),
             .roadHelpBookUpdateStatus(_, _),
             .postCar(_),
             .postCarWashBook(_),
             .postRoadHelpBook(_),
             .verifyAccount(_),
             .forgotPassword(_),
             .resendOTP,
             .verifyOtpForget(_),
             .newPasswordWithForget(_),
             .postGarageBook(_),
             .garageAddMsgText(_),
             .postSparePartBook(_,_):
            return .post
        default:
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
             .roadHelpBookUpdateStatus(let prms, _),
             .postCar(let prms),
             .postRoadHelpBook(let prms),
             .verifyAccount(let prms),
             .verifyOtpForget(let prms),
             .newPasswordWithForget(let prms),
             .garageAddMsgText(let prms),
             .postGarageBook(let prms):
            var multipartFormData = [MultipartFormData]()
            for (key,value) in prms{
                let formData = MultipartFormData(provider: .data("\(value)".data(using: .utf8)!), name: key)
                multipartFormData.append(formData)
            }
            return .uploadMultipart(multipartFormData)
        case .forgotPassword(let prms):
            return .requestParameters(parameters: prms, encoding: URLEncoding.queryString)
        case .postSparePartBook(let prms, let images):
            var multipartFormData = [MultipartFormData]()
            for (key,value) in prms{
                let formData = MultipartFormData(provider: .data("\(value)".data(using: .utf8)!), name: key)
                multipartFormData.append(formData)
            }
            for (key,value) in images{
                let imageData = value.jpegData(compressionQuality: 0.2)
                let formData: Moya.MultipartFormData = Moya.MultipartFormData(provider: .data(imageData!), name: key, fileName: "\(key).jpg", mimeType: "image/jpeg")
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
        default:
            return Shared.headers
        }
    }
    
    
}
