//
//  UIComponentsHelpers.swift
//  TheBest-iOS-Driver
//
//  Created by Sherif Darwish on 11/15/20.
//  Copyright © 2020 Sherif Darwish. All rights reserved.
//

import UIKit


extension UIView {
    func setupShadow(){
        self.layer.masksToBounds = false
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 3
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2)
    }
    
    func roundCorners(_ corners: CACornerMask, radius: CGFloat) {
        self.layer.maskedCorners = corners
        self.layer.cornerRadius = radius
    }
    
    func round() {
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
    
    func roundCorners(_ value: CGFloat = 10.0) {
        self.layer.cornerRadius = value
        self.clipsToBounds = true
    }

    
}

@IBDesignable
class LocalizedBtn: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.reload()
        
    }
    
    private func reload() {
        if "lang".localized == "ar" {
            self.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
    }
}

@IBDesignable
class LocalizedImg: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.reload()
    }
    
    private func reload() {
        if "lang".localized == "ar" {
            self.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
    }
}

@IBDesignable
class RoundedButton: UIButton {
    @IBInspectable var borderColor: UIColor? {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //self.round()
        self.setupBorder()
        self.setupCornerRadius()
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
       // self.round()
        self.setupBorder()
        self.setupCornerRadius()
    }
    
    private func setupBorder() {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor?.cgColor
    }
    
    private func setupCornerRadius() {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
}

@IBDesignable
class CustomTFs: UITextField{
    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        makeItCustom()
    }
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        makeItCustom()
    }
    private func makeItCustom(){
        
        self.borderStyle = .none
        self.backgroundColor = UIColor.white
        self.layer.masksToBounds = false
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 3
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2)
        self.layer.cornerRadius = 8
        self.clipsToBounds = false
        
    }
}

class CustomTFs1: UITextField{
    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        makeItCustom()
    }
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        makeItCustom()
    }
    private func makeItCustom(){
        
        self.borderStyle = .none
        self.backgroundColor = UIColor(named: "LightGray")
        self.layer.cornerRadius = 8
        self.clipsToBounds = false
        
    }
}

@IBDesignable
class RoundedLabel: UILabel {
    
    @IBInspectable var cornerRaduis: CGFloat = 0.0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var isCircle: Bool = false {
        didSet {
            setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.reload()
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        self.reload()
    }
    
    private func reload() {
        self.layer.cornerRadius = cornerRaduis
        
        if isCircle { self.round() }
        self.clipsToBounds = true
    }
}
class LocalizedLabel: UILabel{
    override func layoutSubviews() {
        super.layoutSubviews()
        self.reload()
    }
    
    private func reload() {
        self.text = self.text?.localized
    }
}

@IBDesignable
class ViewCorners: UIView {
    
    @IBInspectable var roundedTopLeft: Bool = false {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var roundedTopRight: Bool = false {
        didSet {
            setNeedsLayout()
        }
    }
    @IBInspectable var roundedBottomLeft: Bool = false {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var roundedBottomRight: Bool = false {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var cornerRaduis: CGFloat = 0.0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var singleCornerRaduis: CGFloat = 0.0 {
        didSet {
            setNeedsLayout()
        }
    }

    
    @IBInspectable var isCircle: Bool = false {
        didSet {
            setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor?.cgColor
        
        super.layoutSubviews()
        self.reload()
    }
    
    @IBInspectable var isShadow: Bool = false {
        didSet {
            setNeedsLayout()
        }
    }
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        self.reload()
    }
    
    private func reload() {
        
        if isCircle { self.round() }
        self.clipsToBounds = true
        
        var corners = CACornerMask()
        
        if roundedTopLeft{
            corners.insert("lang".localized == "en" ? .layerMinXMinYCorner : .layerMaxXMinYCorner)
        }
        if roundedTopRight{
            corners.insert("lang".localized == "en" ? .layerMaxXMinYCorner : .layerMinXMinYCorner)
        }
        if roundedBottomLeft{
            corners.insert("lang".localized == "en" ? .layerMinXMaxYCorner : .layerMaxXMaxYCorner)
        }
        if roundedBottomRight{
            corners.insert("lang".localized == "en" ? .layerMaxXMaxYCorner : .layerMinXMaxYCorner)
        }
        
        if !corners.isEmpty{
            self.roundCorners(corners, radius: singleCornerRaduis)
        }
        
        if self.cornerRaduis != 0.0{
            self.layer.cornerRadius = cornerRaduis
        }
        
        if isShadow { self.setupShadow() }
        
    }
}
