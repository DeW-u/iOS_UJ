//
//  ViewController.swift
//  iOS_Project_1
//
//  Created by Daniel Latos on 09/11/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var equationUiLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        equationUiLabel.text = ""
    }
    
    @IBAction func calculatorButtonsClicked(_ sender: Any) {
        guard let tag = (sender as? UIButton)?.titleLabel?.text else {
            return
        }
        
        switch tag {
        case "C": equationUiLabel.text = ""
        case "⌫": equationUiLabel.text?.removeLast()
        case "=":
            if let equation = equationUiLabel.text {
                if !equation.isEmpty {
                    let expression = NSExpression(format: equation)
                    if let result = expression.expressionValue(with: nil, context: nil) as? NSNumber {
                        print(result)
                        equationUiLabel.text = "\(result)"
                    } else {
                        print("error evaluating expression")
                    }
                }
            }
        default:
            if let text = equationUiLabel.text {
                if text.isEmpty && !tag.first!.isNumber {
                    print("ERROR")
                    return
                }
                
                if let textLast = text.last {
                    if !textLast.isNumber && !tag.first!.isNumber {
                        print("ERROR")
                        return
                    }
                }
                
                equationUiLabel.text! += tag
            }
        }
    }
}

