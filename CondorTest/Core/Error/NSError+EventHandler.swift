//
//  NSError+EventHandler.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import Foundation

extension NSError {

    func eventHandlerError(statusCode:Int) -> NSError {
        guard let errorType = ErrorType(rawValue: statusCode) else {
            return self
        }

        var descriptionError:String
        switch errorType {
        case .serverError:
            descriptionError = ConstantsError.severError
        case .expiredTokenError:
            descriptionError = ConstantsError.severError
        }
        
        return NSError(domain: descriptionError, code: statusCode, userInfo: userInfo)
    }
}

enum ErrorType :Int{
    case serverError = 500
    case expiredTokenError = 401
}

struct ConstantsError {
    static let error = "Error"
    static let expiredToken = NSLocalizedString("expiredToken", comment: "")
    static let severError = NSLocalizedString("serverError", comment: "")
}
