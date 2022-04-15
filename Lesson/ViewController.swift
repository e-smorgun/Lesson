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
    let volume: Int
    
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
    
    @IBOutlet weak var dayPriceTextField: UITextField!
    
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
        let buffer = Int(dayPriceTextField.text!)
        cost += buffer!
        costLabel.text = "Выручка: \(cost)"
    }
    
    @IBAction func didTapDeleteCostButton(sender: UIButton) {
        let buffer = Int(dayPriceTextField.text!)
        cost += buffer!
        costLabel.text = "Выручка: \(cost)"
    }
    
    @IBAction func didTapShowButton(sender: UIButton) {
        var result = ""
        for beer in Storage.shared.beers {
            result += "\(beer.name) - \(beer.cost) - \(beer.country) - \(beer.volume) \n"
        }
        showLabel.text = result
    }
}

       
