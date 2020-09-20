//
//  ApiQueryComposer.swift
//  appautofin
//
//  Created by Alexander Lopez on 16/07/20.
//  Copyright © 2020 Alexander López Cedillo. All rights reserved.
//

import Foundation

protocol ApiQueryComposer {
    func getQueryItems() -> [URLQueryItem]
}
