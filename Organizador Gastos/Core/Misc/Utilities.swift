//
//  Utilities.swift
//  appautofin
//
//  Created by Mauricio Guerrero on 26/06/20.
//  Copyright © 2020 Mauricio Guerrero Vega. All rights reserved.
//

import UIKit
import CoreData

class Utilities{
    
    static func ValidarCorreo(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    static func convertDoubleToCurrency(amount: Float) -> String{
        
        let usLocale = Locale(identifier: "en_US")
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = usLocale
    
        return formatter.string(from: NSNumber(value: amount))!
    }
    
    static func convertDoubleToCurrency(amount: String) -> String{
        
        let usLocale = Locale(identifier: "en_US")
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = usLocale
        
        let amountFloat = Float(amount)
        
        return formatter.string(from: NSNumber(value: amountFloat!))!
    }

}

extension UIViewController {
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Aviso", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    func showLoad() -> UIAlertController {
        let alertLoad = UIAlertController(title: "Espere un momento...\n\n\n\n", message: nil, preferredStyle: UIAlertController.Style.alert)
        
        let indicador: UIActivityIndicatorView = UIActivityIndicatorView.init()
        indicador.color = UIColor.black
        alertLoad.view.addSubview(indicador)
        indicador.center = CGPoint(x: (alertLoad.view.bounds.width)/2, y: (alertLoad.view.bounds.height)/2)
        indicador.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
        indicador.startAnimating()
        
        return alertLoad
    }
    
    
    func showAlertWithMessage(title: String,
                              placeHolder: String,
                              textDefault: String,
                              completion: @escaping (_ result: String ) -> ()) {
        
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = placeHolder
            if textDefault != "" {
                textField.text = textDefault
            }
        })
        
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { action in
            
            if let name = alert.textFields?.first?.text {
                let result = name
                completion(result)
            }
        }))
        
        self.present(alert, animated: true)
    }
    
    func showAlertConfirm(message: String, title : String = "", completion: @escaping (_ result: Bool ) -> ()){
        var ok : Bool = false
        let refreshAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "Si", style: .default, handler: { (action: UIAlertAction!) in
            ok = true
            completion(ok)
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { (action: UIAlertAction!) in
            completion(ok)
        }))

        self.present(refreshAlert, animated: true, completion: nil)
    }

}


extension UITableViewController {
    
    func showLoadTable() -> UIAlertController {
        let alertLoad = UIAlertController(title: "Espere un momento...\n\n\n\n", message: nil, preferredStyle: UIAlertController.Style.alert)
        
        let indicador: UIActivityIndicatorView = UIActivityIndicatorView.init()
        indicador.color = UIColor.black
        alertLoad.view.addSubview(indicador)
        indicador.center = CGPoint(x: (alertLoad.view.bounds.width)/2, y: (alertLoad.view.bounds.height)/2)
        indicador.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
        indicador.startAnimating()
        
        return alertLoad
    }
}



