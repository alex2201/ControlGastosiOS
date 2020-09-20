//
//  Cache.swift
//  appautofin
//
//  Created by Alexander Lopez Cedillo on 01/07/20.
//  Copyright © 2020 Alexander López Cedillo. All rights reserved.
//

import Foundation

class Cache<K, V> where K: NSObject, V: NSObject {
	private var fetched = Set<K>()
	private var cache = NSCache<K, V>()
	
	func insert(_ value: V, forKey key: K) {
		fetched.insert(key)
		cache.setObject(value, forKey: key)
	}
	
	func insertNil(forKey key: K) {
		fetched.insert(key)
	}
	
	func remove(forKey key: K) {
		cache.removeObject(forKey: key)
	}
	
	func clear() {
		fetched.removeAll()
		cache.removeAllObjects()
	}
	
	func isFetched(forKey key: K) -> Bool {
		return fetched.contains(key)
	}
	
	func getObject(forKey key: K) -> V? {
		return cache.object(forKey: key)
	}
	
}
