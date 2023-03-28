// Project: VasquezAmberEtana-HW3
// EID: kav835
// Course: CS29E

// MainVCViewController.swift




import UIKit

class MainVCViewController: UIViewController,TextChangeDelegate,ColorChangeDelegate {
   
    
    
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func textChangeButtonPushed(_ sender: Any) {
        self.performSegue(withIdentifier: "TextChangeSegue", sender: self)
    }
    
    @IBAction func colorChangeButtonPushed(_ sender: Any) {
        self.performSegue(withIdentifier: "ColorChangeSegue", sender: self)
    }
    
    func onChange(_ text: String) {
        textLabel.text = text
    }
    
    func onChange(_ color: Color) {
        if (color == .blue){
            textLabel.backgroundColor = .blue
        }else if (color == .red) {
            textLabel.backgroundColor = .red
        }
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "TextChangeSegue") {
            if let viewController = segue.destination as? TextChangeVC {
                viewController.delegate = self
                viewController.text = textLabel.text
            }
        }
        else if (segue.identifier == "ColorChangeSegue") {
            if let viewController = segue.destination as? ColorChangeVC {
                viewController.delegate = self
            }
        }
    }
   
}
