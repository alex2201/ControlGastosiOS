//
//  UtilitiesStyles.swift
//  appautofin
//
//  Created by Mauricio Guerrero on 26/06/20.
//  Copyright © 2020 Mauricio Guerrero Vega. All rights reserved.
//

import Foundation
import UIKit
//import MaterialComponents.MaterialButtons
//import MaterialComponents.MaterialButtons_Theming


class UtilidadesStyle {
    
    public static let colorPrimary =  UIColor.init(red: 12/255, green: 5/255, blue: 109/255, alpha: 1)
    
//    static let containerScheme = MDCContainerScheme()
//    static func styleFilledButtonMDC(_ MDCButton: MDCButton){
//        MDCButton.applyContainedTheme(withScheme: containerScheme)
//        MDCButton.backgroundColor = colorPrimary
//        MDCButton.layer.cornerRadius = 10.0
//        MDCButton.setTitleColor(UIColor.white, for: .normal)
//    }
    
    static func styleFilledButton(_ button:UIButton) {
        button.backgroundColor = UIColor.init(red: 46/255, green: 49/255, blue: 141/255, alpha: 1)
        button.layer.cornerRadius = 10.0
        button.setTitleColor(UIColor.white, for: .normal)
    }
    
//    static func styleFilledButtonTelephoneMDC(_ MDCButton: MDCButton){
//
//        MDCButton.applyContainedTheme(withScheme: containerScheme)
//        MDCButton.backgroundColor = UIColor.init(red: 95/255, green: 191/255, blue: 92/255, alpha: 1)
//        MDCButton.setTitleColor(UIColor.white, for: .normal)
//        MDCButton.layer.cornerRadius = 10.0
//    }
//
//    static func styleFilledButtonFacebookMDC(_ MDCButton: MDCButton){
//
//        MDCButton.applyContainedTheme(withScheme: containerScheme)
//        MDCButton.backgroundColor = UIColor.init(red: 71/255, green: 100/255, blue: 161/255, alpha: 1)
//        MDCButton.setTitleColor(UIColor.white, for: .normal)
//        MDCButton.layer.cornerRadius = 10.0
//    }
//    static func styleFilledButtonCorreoMDC(_ MDCButton: MDCButton){
//
//        MDCButton.applyContainedTheme(withScheme: containerScheme)
//        MDCButton.backgroundColor = UIColor.init(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
//        MDCButton.setTitleColor(UIColor.white, for: .normal)
//        MDCButton.layer.cornerRadius = 10.0
//    }
       
    
    //Deprecated
    static func styleTextField(_ textfield:UITextField) {
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        textfield.borderStyle = .none
        textfield.layer.addSublayer(bottomLine)
    }
    
    
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
    }
    
}

extension UtilidadesStyle {
    
    static func setNavigationCenterImage(_ navigationItem: UINavigationItem) {
        
        let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 45))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 45))
        //imageView.contentMode = .scaleAspectFit
        imageView.contentMode = .scaleAspectFill
        let image = UIImage(named: "FestinHead")
        imageView.image = image
        logoContainer.addSubview(imageView)
     
         navigationItem.titleView = logoContainer
    }
    
    static func setTitulo(_ label: UILabel) {
        label.textColor = UtilidadesStyle.colorPrimary
        label.font = UIFont(name:  "NotoSansMyanmar-Bold", size: 30)
    }
    static func setSubtitulo(_ label: UILabel) {
           label.textColor = UtilidadesStyle.colorPrimary
           label.font = UIFont(name:  "NotoSansMyanmar-Regular", size: 12)
       }
    
    static func setViewWithBorder(_ view: UIView) {
        //view.layer.borderWidth = 1
        //view.layer.borderColor = UIColor.blue.cgColor
        view.layer.mask?.masksToBounds = true
        view.layer.cornerRadius = 10.0
    }
}

extension UITextField {
    
    func setFormat(){
        let color = UIColor.gray
        let placeholder = self.placeholder ?? ""
        
        self.backgroundColor = .white
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = 10.0
        self.layer.borderWidth = 1.0
    }
    
}
