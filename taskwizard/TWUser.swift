//
//  TWUser.swift
//  taskwizard
//
//  Created by Tejas Nikumbh on 5/12/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import Foundation

class TWUser {
    
    static var isLoggedIn: Bool!
    
    init(isUserLoggedIn: Bool!) {
        TWUser.isLoggedIn = isUserLoggedIn
    }
}