// Project: VasquezAmberEtana-HW5
// EID: kav835
// Course: CS329E

// ViewController.swift

import UIKit

protocol PizzaProtocol{
    func addNewPizza(pizza:Pizza)
}


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,PizzaProtocol{
    
    var pizzaList: [Pizza] = []
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        self.title = "Pizza Order"
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
    func addNewPizza(pizza: Pizza) {
        print("I am called")
        self.pizzaList.append(pizza)
        self.tableView.reloadData()
    }
    
    @objc func addTapped(){
        self.performSegue(withIdentifier: "ADD_ORDER", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PizzaCell", for: indexPath) as! PizzaCell
        let pizza = pizzaList [indexPath.row]
        cell.sizeLabel.text = pizza.pSize.stringValue
        cell.crustLabel.text = pizza.crust.stringValue
        cell.cheeseLabel.text = pizza.cheese.stringValue
        cell.meatLabel.text = pizza.meat.stringValue
        cell.veggieLabel.text = pizza.veggies.stringValue
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(pizzaList.count)
        return pizzaList.count
        
    }
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if let viewController = segue.destination as? PizzaOrderScreen {
          viewController.delegate = self
    }
      // Get the new view controller using segue.destination.
      // Pass the selected object to the new view controller.
  }

}
