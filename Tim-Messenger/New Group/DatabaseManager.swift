//
//  DatabaseManager.swift
//  Tim-Messenger
//
//  Created by Tim Cho on 24/8/2020.
//  Copyright © 2020 Tim Cho. All rights reserved.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    public func testDB() {
        database.child("foo").setValue(["something": true, "another": false])
    }
    public func addUser() {
        database.child("users").setValue(["something": true, "another": false])
    }
}
