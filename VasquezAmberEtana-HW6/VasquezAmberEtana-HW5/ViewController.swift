// Project: VasquezAmberEtana-HW6
// EID: kav835
// Course: CS329E

// ViewController.swift

import UIKit
import CoreData

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
        getPizzas()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
 
    func getPizzas() {
        let pizzaFetch: NSFetchRequest<PizzaModel> = PizzaModel.fetchRequest()
        do {
            let managedContext = (UIApplication.shared.delegate as? AppDelegate)!.persistentContainer.viewContext
            let results = try managedContext.fetch(pizzaFetch)
            pizzaList = results.map { (pizzaModel) -> Pizza in
                let size = Size.init(rawValue: Int(truncatingIfNeeded: pizzaModel.size)) ?? .small
                let crust = CrustType.init(rawValue: Int(truncatingIfNeeded: pizzaModel.crust)) ?? .thick
                let cheese = CheeseType.init(rawValue: Int(truncatingIfNeeded: pizzaModel.cheese)) ?? .noCheese
                let meat = MeatType.init(rawValue: Int(truncatingIfNeeded: pizzaModel.meat)) ?? .sausage
                let veggies = VeggieType.init(rawValue: Int(truncatingIfNeeded: pizzaModel.veggies)) ?? .blackOlive

                return Pizza(size: size, crustType: crust, cheeseType: cheese, meatType: meat, veggieType: veggies)
            }
            self.tableView.reloadData()
        } catch let error as NSError {
            print("Fetch error: \(error) description: \(error.userInfo)")
        }
    }
    
    func addNewPizza(pizza: Pizza) {
        
        let managedContext = (UIApplication.shared.delegate as? AppDelegate)!.persistentContainer.viewContext
        let p = PizzaModel(context: managedContext)
        p.setValue(pizza.pSize.rawValue, forKey: #keyPath(PizzaModel.size))
        p.setValue(pizza.crust.rawValue, forKey: #keyPath(PizzaModel.crust))
        p.setValue(pizza.cheese.rawValue, forKey: #keyPath(PizzaModel.meat))
        p.setValue(pizza.meat.rawValue, forKey: #keyPath(PizzaModel.cheese))
        p.setValue(pizza.veggies.rawValue, forKey: #keyPath(PizzaModel.veggies))
        self.pizzaList.insert(pizza, at: 0)
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
          let pizzaToDelete = pizzaList[indexPath.row]
          pizzaList.remove(at: indexPath.row)
          tableView.deleteRows(at: [indexPath], with: .fade)
      
          // TODO: Convert to PizzaModel
          let pizzaFetch: NSFetchRequest<PizzaModel> = PizzaModel.fetchRequest()
          do {
              let managedContext = (UIApplication.shared.delegate as? AppDelegate)!.persistentContainer.viewContext
              let results = try managedContext.fetch(pizzaFetch)
              let pizzaModels = results.filter { (pizzaModel) -> Bool in
                  return pizzaModel.size == pizzaToDelete.pSize.rawValue ||
                  pizzaModel.crust == pizzaToDelete.crust.rawValue ||
                  pizzaModel.cheese == pizzaToDelete.cheese.rawValue ||
                  pizzaModel.meat == pizzaToDelete.meat.rawValue ||
                  pizzaModel.veggies == pizzaToDelete.veggies.rawValue
                  
              }
              let pizzaModel = pizzaModels[0]
              managedContext.delete(pizzaModel)
              (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
          } catch let error as NSError {
              print("Fetch error: \(error) description: \(error.userInfo)")
          }
        
          
      }
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
