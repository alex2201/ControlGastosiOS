//
//  ApiService.swift
//  appfestin
//
//  Created by Mauricio Guerrero Vega on 24/03/20.
//  Copyright © 2020 Mauricio Guerrero. All rights reserved.
//

import Foundation

enum HttpMethod: String {
	case post = "POST"
	case get  = "GET"
	case put = "PUT"
	case delete = "DELETE"
}

enum URLRequestError: Error {
	case request(RequestError)
	case http(NetworkRequestError)
}

struct RequestError: Error {
	let error: Error
	
	var localizedDescription: String {
		return error.localizedDescription
	}
}

struct NetworkRequestError: Error {
	let statusCode: Int
	
	var localizedDescription: String {
		let description: String
		
		switch statusCode {
		case 400:
			description = "\(statusCode) Bad Request"
		case 401:
			description = "\(statusCode) Unatuhorized"
		case 404:
			description = "\(statusCode) Not Found"
		case 408:
			description = "\(statusCode) Request Timeout"
		default:
			description = "\(statusCode) Network Request Error - no other information"
		}
		
		return description
	}
}

struct ApiParseError: Error {
	static let code = 999
	
	let error: Error
	let httpUrlResponse: HTTPURLResponse
	let data: Data?
	
	var localizedDescription: String {
		return error.localizedDescription
	}
}

struct ApiError: Error {
	let data: Data?
	let httpUrlResponse: HTTPURLResponse
}

struct VoidResponse: Decodable { }
