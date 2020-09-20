//
//  Api.swift
//  appautofin
//
//  Created by Alexander Lopez on 17/07/20.
//  Copyright © 2020 Alexander López Cedillo. All rights reserved.
//

import Foundation

protocol Api {
	static var baseUrl: String { get }
}

protocol ApiEndpoint {
	static var queryUrl: String { get }
}

typealias ApiQuery = URLProvider
typealias ApiQueryItem = URLQueryItem
