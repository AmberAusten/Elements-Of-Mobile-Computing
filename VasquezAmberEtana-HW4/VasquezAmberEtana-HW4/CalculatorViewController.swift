// Project: VasquezAmberEtana-HW4
// EID: kav835
// Course: CS329E

// CalculatorViewController.swift
//
//

import UIKit

class CalculatorViewController: UIViewController {
    var calculator: Calculator = Calculator(operation: .add)
    
    @IBOutlet weak var operand1TextField: UITextField!
    @IBOutlet weak var operand2TextField: UITextField!
    @IBOutlet weak var operationLabel: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear\(calculator.operation.operation)")
        self.operationLabel.text = calculator.operation.operation
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        guard let a = operand1TextField.text else{
            return
            }
        guard let b = operand2TextField.text else{
            return
        }
        let result = calculator.calculate(a: a, b: b)
       
            resultsLabel.text = ("\(result)")
        }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

 }
