//
//  ViewController.swift
//  BMI
//
//  Created by Narongsak Chobsri on 6/2/2562 BE.
//  Copyright © 2562 Narongsak Chobsri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var categoryResult: UILabel!
    @IBOutlet weak var bmiResult: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    let categoryArary: [String] = ["Obese", "OverWeight", "Healthy", "UnderWeight"]
    let bmiArray: [Double] = [ 27.5, 23.0, 18.5 ]
    
    func determineCategory(_ bmi: Double) -> String {
        for (index, row) in bmiArray.enumerated() {
            if bmi > row {
                return categoryArary[index]
            }
        }
        return categoryArary[3]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func handleCalculate(_ sender: UIButton) {
        let height = Double(heightTextField.text!)! / 100
        let weight = Double(weightTextField!.text!)
        let bmi = weight! / (height * height)
        bmiResult.text = String(format: "Your bmi result is %.2f", bmi)
        categoryResult.text = determineCategory(bmi)
        imageView.image = UIImage(named: "\(determineCategory(bmi)).png")
    }
    
}

