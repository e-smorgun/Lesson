//
//  ViewController.swift
//  Lesson
//
//  Created by Evgeny on 14.04.22.
//

import UIKit

class Storage {
    static let shared = Storage()
    
    var beers: [Beer] = []
    
    init(){
    }
}

class Beer {
    let name: String
    let cost: Int
    let country: String
    var volume: Int
    
    init(name: String, cost: Int, country: String, volume: Int) {
        self.name = name
        self.cost = cost
        self.country = country
        self.volume = volume
    }
    
}

class ViewController: UIViewController {
    private var cost = 0
    
    @IBOutlet weak var costTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var countryTextField: UITextField!
    
    @IBOutlet weak var volumeTextField: UITextField!
    
    @IBOutlet weak var volumeSellTextField: UITextField!
    
    @IBOutlet weak var selldTextField: UITextField!
        
    @IBOutlet weak var alertLabel: UILabel!
    
    @IBOutlet weak var costLabel: UILabel!
    
    @IBOutlet weak var showLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapAddButton(sender: UIButton) {
        let name = nameTextField.text!
        let cost = Int(costTextField.text!)
        let country = countryTextField.text!
        let volume = Int(volumeTextField.text!)
        
        let order = Beer(name: name, cost: cost!, country: country, volume: volume!)
        Storage.shared.beers.append(order)
    }
    
    @IBAction func didTapNullButton(sender: UIButton) {
        cost = 0
        costLabel.text = "Выручка: \(cost)"
    }
    
    @IBAction func didTapAddCostButton(sender: UIButton) {
        let bufferVolume = Int(volumeSellTextField.text!)
        let bufferId = Int(selldTextField.text!)
        var bufferCost = Storage.shared.beers[bufferId! - 1].cost
    
        
        if (bufferId! - 1) > Storage.shared.beers.count{
            alertLabel.textColor = UIColor.red
            alertLabel.text = "Неверный ID" }
        else if bufferVolume! > Storage.shared.beers[bufferId! - 1].volume {
            alertLabel.textColor = UIColor.red
            alertLabel.text = "Неверный Volume"
        } else {
            bufferCost *= bufferVolume!
            Storage.shared.beers[bufferId! - 1].volume -= bufferVolume!
            cost += bufferCost
            
            alertLabel.textColor = UIColor.green
            alertLabel.text = "Для проверки остатков нажмите кнопку"
        }
        
        
        costLabel.text = "Выручка: \(cost)"
    }
    
    @IBAction func didTapShowButton(sender: UIButton) {
        var result = ""
        for (index, beer) in Storage.shared.beers.enumerated() {
            result += "\(index + 1) - Name: \(beer.name) Cost: \(beer.cost) Country: \(beer.country) Volume: \(beer.volume) \n"
        }
        showLabel.text = result
    }
}

       
