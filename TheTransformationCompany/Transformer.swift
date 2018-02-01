//
//  Transformer.swift
//  TheTransformationCompany
//
//  Created by Sanjay Shah on 2018-02-01.
//  Copyright © 2018 Sanjay Shah. All rights reserved.
//

import UIKit

class Transformer: NSObject {

    var name: String
    
    var strength: Int
    var intelligence: Int
    var speed: Int
    var endurance: Int
    var courage: Int
    var firepower: Int
    var skill: Int
    
    var overallRating: Int
    
    
    init(name: String, strength: Int, intelligence: Int, speed: Int, endurance: Int, courage: Int, firepower: Int, skill: Int) {
        
        self.name =  name
        
        self.strength = strength
        self.intelligence = intelligence
        self.speed = speed
        self.endurance = endurance
        self.courage = courage
        self.firepower = firepower
        self.skill = skill
        
        self.overallRating = strength + intelligence + endurance + speed + firepower
        
        
    }
    
    
    
}
