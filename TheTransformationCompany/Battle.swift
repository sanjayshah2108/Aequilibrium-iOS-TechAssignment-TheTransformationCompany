//
//  Battle.swift
//  TheTransformationCompany
//
//  Created by Sanjay Shah on 2018-02-01.
//  Copyright © 2018 Sanjay Shah. All rights reserved.
//

import UIKit

class Battle: NSObject {

    var autobot: Autobot!
    var decepticon: Decepticon!
    
    var winner: Transformer?
    var reasonForWin: String?
    
    
    func fight(inputAutobot: Autobot, inputDecepticon: Decepticon){
        
        //special rule 1: Optimus and Predaking
        if (inputAutobot.name == "Optimus Prime" && inputDecepticon.name == "Predaking"){
            winner = nil
            reasonForWin = "Game ends if Optimus Prime and Predaking battle"
        }
        
        else if (inputAutobot.name == "Optimus Prime"){
            winner = inputAutobot
            reasonForWin = "Optimus wins all battles"
        }
        
        else if (inputDecepticon.name == "Predaking"){
            winner = inputDecepticon
            reasonForWin = "Predaking wins all battles"
        }
        
        //courage & strength rule
        else if (((inputAutobot.courage - inputDecepticon.courage) >= 4) && ((inputAutobot.strength - inputDecepticon.strength) >= 3)){
            winner = inputAutobot
            reasonForWin = "\(inputAutobot.name) is way stronger and more courageous, so \(inputDecepticon.name) has run away"
        }
        else if (((inputDecepticon.courage - inputAutobot.courage) >= 4) && ((inputDecepticon.strength - inputAutobot.strength) >= 3)){
            winner = inputDecepticon
            reasonForWin = "\(inputDecepticon.name) is way stronger and more courageous, so \(inputAutobot.name) has run away"
        }
            
        //skill rule
        else if ((inputAutobot.skill - inputDecepticon.skill) >= 3){
            winner = inputDecepticon
            reasonForWin = "\(inputAutobot.name) is way more skilled, so \(inputDecepticon.name) doesnt have a chance"
        }
        
        else if ((inputDecepticon.skill - inputAutobot.skill) >= 3){
            winner = inputDecepticon
            reasonForWin = "\(inputDecepticon.name) is way more skilled, so \(inputAutobot.name) doesnt have a chance"
        }
            
            
        //overallRating Rule
        else if (inputAutobot.overallRating > inputDecepticon.overallRating){
            winner = inputAutobot
            reasonForWin = "\(inputAutobot.name) has a better overall rating"
        }
        
        else if (inputDecepticon.overallRating > inputAutobot.overallRating){
            winner = inputDecepticon
            reasonForWin = "\(inputDecepticon.name) has a better overall rating"
        }
        
        //tie
        else if (inputDecepticon.overallRating == inputAutobot.overallRating){
            winner = nil
            reasonForWin = "No winner, both were evenly matched, and so got destroyed"
        }
    }
}
