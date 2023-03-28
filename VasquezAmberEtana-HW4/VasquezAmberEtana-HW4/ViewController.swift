// Project: VasquezAmberEtana-HW4
// EID: kav835
// Course: CS329E

// ViewController.swift
//
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let operators: [Operator] = [.add,.subtract,.multiply,.divide]
    var selectedOperator: Operator = .add
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad")
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(operators.count)
        return operators.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OPERATOR", for: indexPath)
        cell.textLabel?.text = operators[indexPath.row].stringValue
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? CalculatorViewController {
            print("prepare \(self.selectedOperator)")
            viewController.calculator = Calculator(operation: self.selectedOperator)
        }

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedOperator = operators[indexPath.row]
        self.performSegue(withIdentifier: "CalculatorSegue", sender: nil)
        print("selected \(selectedOperator.operation)")
    }
}

