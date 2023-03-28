// Project: VasquezAmberEtana-HW5
// EID: kav835
// Course: CS329E

// PizzaOrderScreen.swift

import UIKit

class PizzaCell: UITableViewCell{
    
    @IBOutlet weak var sizeLabel: UILabel!
    
    @IBOutlet weak var crustLabel: UILabel!
    
    @IBOutlet weak var cheeseLabel: UILabel!
    
    @IBOutlet weak var meatLabel: UILabel!
    
    @IBOutlet weak var veggieLabel: UILabel!
    
}


class PizzaOrderScreen: UIViewController {
    
    var delegate: PizzaProtocol? = nil
    var size: Size = .small
    var crustType: CrustType? = nil
    var cheeseType: CheeseType? = nil
    var meatType: MeatType? = nil
    var veggieType: VeggieType? = nil
    

    @IBOutlet weak var sizeSegmentedControl: UISegmentedControl!
    
    
    @IBOutlet weak var summaryLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func selectedCrustTapped(_ sender: Any) {
        self.presentCrustTypesAlert()
    }
    
    @IBAction func selectedCheeseTapped(_ sender: Any) {
        self.presentCheeseTypesAlert()
    }
    
    @IBAction func selectedMeatTapped(_ sender: Any) {
        self.presentMeatTypesAlert()
    }
    
    @IBAction func selectedVeggiesTapped(_ sender: Any) {
        self.presentVeggiesTypesAlert()
    }
    
    
    @IBAction func doneTapped(_ sender: Any) {
        do {
            let pizza = try PizzaValidation.validate(size: self.size, crustType: self.crustType, cheeseType: cheeseType, meatType: meatType, veggieType: veggieType)
            summaryLabel.text = pizza.summary()
            summaryLabel.adjustsFontSizeToFitWidth = true
            summaryLabel.minimumScaleFactor = 0.5
            summaryLabel.sizeToFit()
            summaryLabel.numberOfLines = 0
            self.delegate?.addNewPizza(pizza: pizza)
            
        }catch(let error){
            let alert = UIAlertController(title: "Missing ingredient", message: error.localizedDescription, preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .default) { _ in
            }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func sizeChanged(_ sender: Any) {
        switch sizeSegmentedControl.selectedSegmentIndex{
        case 0:
            size = .small
            print("Selected 0")
        case 1:
            size = .medium
            print("Selected 1")
        case 2:
            size = .large
            print("Selected 2")
        default:
            break
        }
    }
    
    func presentCrustTypesAlert(){
        let alert = UIAlertController(title: "Select crust", message: "Choose a crust type:", preferredStyle: .alert)
        let thinAction = UIAlertAction(title: CrustType.thin.stringValue, style: .default) { _ in
            self.crustType = .thin
        }
        let thickAction = UIAlertAction(title: CrustType.thick.stringValue, style: .default) { _ in
            self.crustType = .thick
        }
        alert.addAction(thinAction)
        alert.addAction(thickAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func presentCheeseTypesAlert(){
        let alert = UIAlertController(title: "Select cheese", message: "Choose a cheese type:", preferredStyle: .actionSheet)
        for option in CheeseType.allCases{
            let action = UIAlertAction(title: option.stringValue, style: .default) { _ in
                self.cheeseType = option
            }
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    func presentMeatTypesAlert(){
        let alert = UIAlertController(title: "Select meat", message: "Choose one meat:", preferredStyle: .actionSheet)
        for option in MeatType.allCases{
            let action = UIAlertAction(title: option.stringValue, style: .default) { _ in
                self.meatType = option
            }
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    func presentVeggiesTypesAlert(){
        let alert = UIAlertController(title: "Select veggies", message: "Choose your veggies:", preferredStyle: .actionSheet)
        for option in VeggieType.allCases{
            let action = UIAlertAction(title: option.stringValue, style: .default) { _ in
                self.veggieType = option
            }
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
    /*
    // MARK: - NavigationCRUST

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
