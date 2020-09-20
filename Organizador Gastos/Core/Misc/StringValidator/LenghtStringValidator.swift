//
//  LenghtStringValidator.swift
//  appCupra
//
//  Created by Mauricio Guerrero Vega on 16/08/20.
//  Copyright © 2020 Mauricio Guerrero Vega. All rights reserved.
//

import Foundation

class LenghtStringValidator: StringValidator {
    
    private let lenght: Int
    private let mode: LenghtStringValidatorPlacesMode
    
    init(lenght: Int, mode: LenghtStringValidatorPlacesMode = .equal) {
        self.lenght = lenght
        self.mode = mode
    }
    
    enum LenghtStringValidatorPlacesMode {
        case less
        case lessOrEqual
        case equal
        case greater
        case greaterOrEqual
    }
    
    func validate(string: String) -> Bool {
        switch mode {
        case .less:
            return string.count < lenght
        case .lessOrEqual:
            return string.count <= lenght
        case .equal:
            return string.count == lenght
        case .greater:
            return string.count > lenght
        case .greaterOrEqual:
            return string.count >= lenght
        }
    }
}
