//
//  Router.swift
//  Khdamat
//
//  Created by Sherif Darwish on 16/02/2021.
//

import Foundation
import UIKit

class Router{
    static func toGuide(sender: UIViewController){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "GuideVC") as! GuideVC
        sender.navigationController?.pushViewController(vc, animated: true)
    }
    static func toRegister(sender: UIViewController){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
        sender.navigationController?.pushViewController(vc, animated: true)
    }
    static func toSignin(sender: UIViewController){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SignInVC") as! SignInVC
        sender.navigationController?.pushViewController(vc, animated: true)
    }
    static func toForgetPass(sender: UIViewController, emailOrMobile: String, otp: String){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ForgotPassVC") as! ForgotPassVC
        vc.emailorMobile = emailOrMobile
        vc.otp = otp
        sender.navigationController?.pushViewController(vc, animated: true)
    }
    static func toVerifyCode(sender: UIViewController, type: VerifyType, emailOrMobile: String){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VerifyCodeVC") as! VerifyCodeVC
        vc.verifyType = type
        vc.emailOrMobile = emailOrMobile
        sender.navigationController?.pushViewController(vc, animated: true)
    }
    static func toHome(sender: UIViewController){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SWHome") as! SWRevealViewController
        sender.navigationController?.pushViewController(vc, animated: true)
    }
    static func toRentingCars(sender: UIViewController){
        let storyboard = UIStoryboard(name: "Cars", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RentingCarsVC") as! RentingCarsVC
        sender.navigationController?.pushViewController(vc, animated: true)
    }
    static func toCar(sender: UIViewController, car: Car, assetBaseUrl: String){
        let storyboard = UIStoryboard(name: "Cars", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CarVC") as! CarVC
        vc.receivedCar = car
        vc.assetBaseUrl = assetBaseUrl
        sender.navigationController?.pushViewController(vc, animated: true)
    }
    static func toAddress(sender: UIViewController){
        let storyboard = UIStoryboard(name: "Cars", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddressVC") as! AddressVC
        sender.navigationController?.pushViewController(vc, animated: true)
    }
    static func toMap(sender: UIViewController){
        let storyboard = UIStoryboard(name: "Cars", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MapVC") as! MapVC
        sender.navigationController?.pushViewController(vc, animated: true)
    }
    static func toFollowOrder(sender: UIViewController, bookData: BookData?, myBook: MyBook?){
        let storyboard = UIStoryboard(name: "Cars", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "FollowOrderVC") as! FollowOrderVC
        vc.bookData = bookData
        vc.myBook = myBook
        sender.navigationController?.pushViewController(vc, animated: true)
    }
    static func toAddCar(sender: UIViewController, _ att: CarAttributes){
        let storyboard = UIStoryboard(name: "Cars", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddCarVC") as! AddCarVC
        vc.attributes = att
        sender.navigationController?.pushViewController(vc, animated: true)
    }
    static func toChooseCar(sender: UIViewController,_ cars: [Car]?, _ services: [Service]?){
        let storyboard = UIStoryboard(name: "Cars", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ChooseCarVC") as! ChooseCarVC
        vc.cars = cars
        vc.services = services
        sender.navigationController?.pushViewController(vc, animated: true)
    }
}
