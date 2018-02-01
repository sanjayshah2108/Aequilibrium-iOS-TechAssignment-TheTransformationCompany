//
//  ViewController.swift
//  TheTransformationCompany
//
//  Created by Sanjay Shah on 2018-02-01.
//  Copyright © 2018 Sanjay Shah. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var typeTextField: UITextField!
    
    
    @IBOutlet weak var attributesTextField: UITextField!
    
    
    @IBOutlet weak var noOfBattlesLabel: UILabel!
    
    @IBOutlet weak var winningTeamLabel: UILabel!
    
    
    @IBOutlet weak var losingTeamSurvivors: UILabel!
    
    
    var autobotsArray: [Autobot]!
    var decepticonsArray: [Decepticon]!
    var attributesStringArray: [String]!
    var attributesIntDict = [String : Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        autobotsArray = []
        decepticonsArray = []
        attributesStringArray = []
        attributesIntDict = [:]
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addToTheWar(_ sender: UIButton) {
        
        attributesStringArray = []
        attributesIntDict = [:]
        
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
        
        //fix
        guard (attributesTextField.text != "") else {
            let alert = UIAlertController(title: "Whoops", message: "Transformer must have 8 attributes", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        attributesStringArray = attributesTextField.text?.components(separatedBy: ",")
        
        for char in attributesStringArray{
            //attributesIntDict
        }
        
        if (typeTextField.text == "D") {
            
          //  let newDecepticon =  Decepticon(name: nameTextField.text!, strength: attributesIntDict["strength"]!, intelligence: <#T##Int#>, speed: <#T##Int#>, endurance: <#T##Int#>, courage: <#T##Int#>, firepower: <#T##Int#>, skill: <#T##Int#>)
        }
        
        else if (typeTextField.text == "D") {
            
           // let newDecepticon =  Decepticon(name: nameTextField.text!, strength: attributesIntDict["strength"]!, intelligence: <#T##Int#>, speed: <#T##Int#>, endurance: <#T##Int#>, courage: <#T##Int#>, firepower: <#T##Int#>, skill: <#T##Int#>)
        }
        
        
       
        
        
    }
    
    @IBAction func fight(_ sender: UIButton) {
        
    }
    
}

