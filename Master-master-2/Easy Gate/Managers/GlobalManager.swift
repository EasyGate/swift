//
//  q.swift
//  Easy Gate
//
//  Created by ameer on 7/15/18.
//  Copyright © 2018 JpJets. All rights reserved.
//

import UIKit

class GlobalManager: NSObject {
    // Singleton
    static let sharedInstance = GlobalManager()
    
    
    public var selectedImage: Int = 4
    public var CollictionSelected: String = ""
     public var AirportNameColliction: String = ""
    
    
}
