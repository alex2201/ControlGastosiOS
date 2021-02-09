//
//  DateExtension.swift
//  Organizador Gastos
//
//  Created by Alexander Lopez Cedillo on 09/02/21.
//

import Foundation

extension Date {
    static func fromString(_ dateString: String, usingFormat dateFormat: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let date = dateFormatter.date(from: dateString)
        return date
    }
}
