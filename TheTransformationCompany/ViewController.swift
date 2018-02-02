//
//  ViewController.swift
//  TheTransformationCompany
//
//  Created by Sanjay Shah on 2018-02-01.
//  Copyright © 2018 Sanjay Shah. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var typeTextField: UITextField!
    
    
    @IBOutlet weak var attributesTextField: UITextField!
    
    
    @IBOutlet weak var autobotsListView: UIView!
    
    @IBOutlet weak var decepticonsListView: UIView!
    
    
    @IBOutlet weak var addToWarButton: UIButton!
    
    @IBOutlet weak var fightButton: UIButton!
    @IBOutlet weak var noOfBattlesLabel: UILabel!
    
    @IBOutlet weak var winningTeamLabel: UILabel!
    
    
    @IBOutlet weak var losingTeamSurvivors: UILabel!
    
    
    var autobotsArray: [Autobot]!
    var decepticonsArray: [Decepticon]!
    var autobotSurvivorsArray: [Autobot]!
    var decepticonSurvivorsArray: [Decepticon]!
    
    var attributesStringArray: [String]!
    var attributesIntDict : [String : Int]!
    
    
    var noOfBattles: Int!
    
    var tapGesture: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        typeTextField.delegate = self
        attributesTextField.delegate = self
        
        autobotsArray = []
        decepticonsArray = []
        autobotSurvivorsArray = []
        decepticonSurvivorsArray = []
        attributesStringArray = []
        attributesIntDict = [:]
  
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI(){
        autobotsListView.layer.borderWidth = 2.0
        autobotsListView.layer.borderColor = UIColor.black.cgColor
        
        decepticonsListView.layer.borderWidth = 2.0
        decepticonsListView.layer.borderColor = UIColor.black.cgColor
        
        fightButton.layer.borderColor = UIColor.blue.cgColor
        fightButton.layer.borderWidth = 2.0
        fightButton.layer.cornerRadius = 5.0
        
        addToWarButton.layer.borderColor = UIColor.blue.cgColor
        addToWarButton.layer.borderWidth = 2.0
        addToWarButton.layer.cornerRadius = 5.0
    }
    
    @IBAction func addToTheWar(_ sender: UIButton) {
        
        attributesStringArray = []
        attributesIntDict = [:]
        
        //guards to ensure correct format for data entry
        guard (nameTextField.text != "") else {
            let alert = UIAlertController(title: "Whoops", message: "Transformer must have name", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
    
        guard (typeTextField.text == "D" || typeTextField.text == "A") else {
            let alert = UIAlertController(title: "Whoops", message: "Transformer must either be of type A or D", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        attributesStringArray = attributesTextField.text?.components(separatedBy: ",")
        
        guard (attributesStringArray.count == 7) else {
            let alert = UIAlertController(title: "Whoops", message: "Transformer must have 7 attribute ratings separated by commas", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        attributesIntDict = convertArrayToDict(array: attributesStringArray)
        
        
        if (typeTextField.text == "D") {
            
            let newDecepticon =  Decepticon(name: nameTextField.text!, strength: attributesIntDict["strength"]!, intelligence: attributesIntDict["intelligence"]!, speed: attributesIntDict["speed"]!, endurance: attributesIntDict["endurance"]!, courage: attributesIntDict["courage"]!, firepower: attributesIntDict["firepower"]!, skill: attributesIntDict["skill"]!)
            
            decepticonsArray.append(newDecepticon)
            
            let label = UILabel(frame: CGRect(x: 10, y: decepticonsArray.count*25, width: Int(decepticonsListView.frame.size.width), height: 25))
            label.text = newDecepticon.name
            decepticonsListView.addSubview(label)
        }
        
        else if (typeTextField.text == "A") {
            
            let newAutobot =  Autobot(name: nameTextField.text!, strength: attributesIntDict["strength"]!, intelligence: attributesIntDict["intelligence"]!, speed: attributesIntDict["speed"]!, endurance: attributesIntDict["endurance"]!, courage: attributesIntDict["courage"]!, firepower: attributesIntDict["firepower"]!, skill: attributesIntDict["skill"]!)
            
            autobotsArray.append(newAutobot)
            
            let label = UILabel(frame: CGRect(x: 10, y: autobotsArray.count*25, width: Int(autobotsListView.frame.size.width), height: 25))
            label.text = newAutobot.name
            autobotsListView.addSubview(label)
        }
        
        //clear textFields
        nameTextField.text = ""
        typeTextField.text = ""
        attributesTextField.text = ""
    }
    
    func convertArrayToDict(array: [String]) -> [String: Int] {
        attributesIntDict["strength"] = Int(array[0])
        attributesIntDict["intelligence"] = Int(array[1])
        attributesIntDict["speed"] = Int(array[2])
        attributesIntDict["endurance"] = Int(array[3])
        attributesIntDict["courage"] = Int(array[4])
        attributesIntDict["firepower"] = Int(array[5])
        attributesIntDict["skill"] = Int(array[6])
        
        return attributesIntDict
    }
    
    @IBAction func fight(_ sender: UIButton) {
        
        attributesTextField.resignFirstResponder()
        typeTextField.resignFirstResponder()
        nameTextField.resignFirstResponder()
        
        let sortedAutobotsArray = sortTeamByOverallRating(array: autobotsArray)
        let sortedDecepticonsArray = sortTeamByOverallRating(array: decepticonsArray)
        
        var winningAutobots: [Autobot] = []
        var winningDecepticons: [Decepticon] = []
        
        noOfBattles = 0
        
        var x = 0
        
        for autobot in sortedAutobotsArray{
            
            let battle = Battle()
            
            if(x < sortedDecepticonsArray.count){
            
                battle.fight(inputAutobot: autobot as! Autobot, inputDecepticon: sortedDecepticonsArray[x] as! Decepticon)
                
                noOfBattles = noOfBattles + 1
                
                if (battle.winner is Autobot){
                    winningAutobots.append(autobot as! Autobot)
                    autobotSurvivorsArray.append(autobot as! Autobot)
                }
                else if (battle.winner is Decepticon){
                    winningDecepticons.append(sortedDecepticonsArray[x] as! Decepticon)
                    decepticonSurvivorsArray.append(sortedDecepticonsArray[x]  as! Decepticon)
                }
                
                else if (battle.winner == nil){
                    //do nothing, as no winners or survivors
                }
                    
                else if (battle.reasonForWin == "Game ends if Optimus Prime and Predaking battle"){
                    
                    winningTeamLabel.text = "Winning team: Draw!"
                    losingTeamSurvivors.text = "All Transformers Destroyed!"
                    
                    return
                }
                x += 1
            }
            
            //autobots who didnt fight
            else {
                autobotSurvivorsArray.append(autobot as! Autobot)
            }
            
            //decepticons who didnt fight
            if(x > sortedAutobotsArray.count){
                decepticonSurvivorsArray.append(sortedDecepticonsArray[x] as! Decepticon)
                
                x += 1
            }
        }
        
        noOfBattlesLabel.text = String(noOfBattles) + " battle(s)"
        
        var winnerNamesArray: [String] = []
        var loserSurvivorsNamesArray: [String] = []
        
        if (winningDecepticons.count > winningAutobots.count){
            
            for winner in winningDecepticons {
                winnerNamesArray.append(winner.name)
            }
            
            for losingSurvivor in autobotSurvivorsArray {
                loserSurvivorsNamesArray.append(losingSurvivor.name)
            }
            
            winningTeamLabel.text = "Winning team: Decepticons! Winners: \(winnerNamesArray)"
            
            losingTeamSurvivors.text = "Survivors from the Losing team (Autobots): \(loserSurvivorsNamesArray)"
        }
        
        else if (winningAutobots.count > winningDecepticons.count){
            
            for winner in winningAutobots {
                winnerNamesArray.append(winner.name)
            }
            for losingSurvivor in decepticonSurvivorsArray {
                loserSurvivorsNamesArray.append(losingSurvivor.name)
            }
            
            winningTeamLabel.text = "Winning team: Autobots! Winners: \(winnerNamesArray.joined(separator: ","))"
            
            losingTeamSurvivors.text = "Survivors from the Losing team (Decepticons):\(loserSurvivorsNamesArray.joined(separator: ","))"
        }
        
        else if (winningAutobots.count ==  winningDecepticons.count){
            
            for losingSurvivor in autobotSurvivorsArray {
                loserSurvivorsNamesArray.append(losingSurvivor.name)
            }
            for losingSurvivor in decepticonSurvivorsArray {
                loserSurvivorsNamesArray.append(losingSurvivor.name)
            }
            
            winningTeamLabel.text = "Winning team: Draw!"
            
            losingTeamSurvivors.text = "Survivors from both teams:\(loserSurvivorsNamesArray.joined(separator: ","))"
        }
        
    }
    
    //sorts by descending order
    func sortTeamByOverallRating(array: [Transformer]) -> [Transformer]{
        return array.sorted(by: { $0.overallRating > $1.overallRating })
    }
    

    //textField methods
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if (tapGesture != nil){
            self.view.removeGestureRecognizer(tapGesture)
        }
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        typeTextField.resignFirstResponder()
        attributesTextField.resignFirstResponder()
    }
    
}

