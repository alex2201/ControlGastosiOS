//
//  NSMuttableAttributedString.swift
//  appSeat
//
//  Created by Alexander Lopez Cedillo on 10/12/20.
//

import UIKit

extension NSMutableAttributedString {
    
    public func setAsLink(textToFind: String, linkURL: String) {
        
        let foundRange = self.mutableString.range(of: textToFind)
        if foundRange.location != NSNotFound {
            self.addAttribute(.link, value: linkURL, range: foundRange)
        }
    }
}
