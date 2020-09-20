//
//  ApiQueryManager.swift
//  appautofin
//
//  Created by Alexander Lopez Cedillo on 31/07/20.
//  Copyright © 2020 Alexander López Cedillo. All rights reserved.
//

import Foundation

protocol ApiQueryManager {
    var delegate: ApiManagerDelegate? { get set }
    func executeGetQuery(withApiQueryItems items: [ApiQueryItem])
    func executePostQuery(withData data: Data?, withApiQueryItems items: [ApiQueryItem]?)
    func executePutQuery(withData data: Data?, withApiQueryItems items: [ApiQueryItem]?)
}
