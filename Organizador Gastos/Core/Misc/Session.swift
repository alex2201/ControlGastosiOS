//
//  Session.swift
//  appautofin
//
//  Created by Alexander Lopez on 15/07/20.
//  Copyright © 2020 Alexander López Cedillo. All rights reserved.
//

import Foundation

class Session {
	private var defaults: UserDefaults { UserDefaults.standard }
//    private(set) var usuario: Usuario?
	
	static let shared = Session()
	
	private init() {
        getSavedUser()
    }
    
    private func getSavedUser() {
    }
    
    func save() {
    }
    
    func removeUser() {
    }
}
