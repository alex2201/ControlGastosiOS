//
//  ApiDelegate.swift
//  appautofin
//
//  Created by Alexander Lopez Cedillo on 27/06/20.
//  Copyright © 2020 Mauricio Guerrero Vega. All rights reserved.
//

import Foundation

protocol ApiManagerDelegate {
	func apiQueryManager(_ apiQueryManager: ApiQueryManager, didFinishQuery query: ApiQuery, withResult result: Result<Data, URLRequestError>)
}

