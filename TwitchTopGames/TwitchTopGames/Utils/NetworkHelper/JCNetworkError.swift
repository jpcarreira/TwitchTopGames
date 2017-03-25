//
//  JCNetworkError.swift
//
//  Created by João Carreira on 24/01/16.
//  Copyright © 2016 jpcarreira. All rights reserved.
//

import Foundation

struct JCNetworkError {

    let errorCode: Int
    let errorDetails: Dictionary<NSObject, AnyObject>?
}

enum JCNetworkErrorCode: Int {

    case unauthorized = 401
    case notFound = 404
    case internalServerError = 500
    case other = 0
    case noResponse = -1
}
