//
//  FileUploader.swift
//  appCupra
//
//  Created by Mauricio Guerrero Vega on 13/08/20.
//  Copyright © 2020 Mauricio Guerrero Vega. All rights reserved.
//

import Foundation

class HTTPDataUploader {
	enum DocumentType: String {
		case jpeg = "image/jpeg"
		case png = "image/png"
		case pdf = "application/pdf"
	}
	
    func uploadData(paramName: String, fileName: String, uploadData: Data, url: URL, type: DocumentType, completionHandler handler: (( Result<Data, URLRequestError>) -> Void)?) {
        // generate boundary string using a unique per-app string
        let boundary = UUID().uuidString

        let session = URLSession.shared

        // Set the URLRequest to POST and to the specified URL
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        
        // Set Content-Type Header to multipart/form-data, this is equivalent to submitting form data with file upload in a web browser
        // And the boundary is also set here
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var data = Data()
        
        // Add the image data to the raw http request data
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(paramName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)

		data.append("Content-Type: \(type.rawValue)\r\n\r\n".data(using: .utf8)!)

        data.append(uploadData)
        
        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        
        // Send a POST request to the URL, with the data we created earlier
        session.uploadTask(with: urlRequest, from: data, completionHandler: {
            (data, response, error) in

            guard error == nil else {
                handler?(.failure(URLRequestError.request(RequestError(error: error!))))
                return
            }

            let httpResponse = response as! HTTPURLResponse

            // Request succeeded
            if httpResponse.statusCode == 200, let data = data {
                handler?(.success(data))
            } else {
                handler?(.failure(URLRequestError.http(NetworkRequestError(statusCode: httpResponse.statusCode))))
            }
        }).resume()
    }
}
