//
//  Battle.swift
//  TheTransformationCompany
//
//  Created by Sanjay Shah on 2018-02-01.
//  Copyright © 2018 Sanjay Shah. All rights reserved.
//

import UIKit

class Battle: NSObject {

    var autobot: Autobot
    var decepticon: Decepticon
    
    var winner: Transformer?
    
    
    init(inputAutobot: Autobot, inputDecepticon: Decepticon){
        self.autobot = inputAutobot
        self.decepticon = inputDecepticon
        
    }
    
    
}
