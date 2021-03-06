//
//  Scheduling.swift
//  SendGrid
//
//  Created by Scott Kawai on 6/9/16.
//  Copyright © 2016 Scott Kawai. All rights reserved.
//

import Foundation

/**
 
 The `Scheduling` protocol contains the properties and methods needed for a class to support scheduled sends.
 
 */
public protocol Scheduling {
    
    /// An optional time to send the email at. The date cannot be further than 72 hours in the future.
    var sendAt: Date? { get set }
    
    /**
     
     Validates the `sendAt` date.
     
     */
    func validateSendAt() throws
}

public extension Scheduling {
    
    /// The default implementation validates that the date is less than 72 hours in the future.
    public func validateSendAt() throws {
        if let date = self.sendAt {
            guard date.timeIntervalSinceNow <= Constants.ScheduleLimit else { throw SGError.Mail.invalidScheduleDate }
        }
    }
}
