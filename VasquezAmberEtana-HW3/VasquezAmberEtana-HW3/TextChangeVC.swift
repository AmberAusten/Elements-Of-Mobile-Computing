// Project: VasquezAmberEtana-HW3
// EID: kav835
// Course: CS29E

// TextChangeVC.swift


import UIKit


protocol TextChangeDelegate{
    func onChange(_ text:String)
    
}

class TextChangeVC: UIViewController {
    var delegate:TextChangeDelegate?
    var text:String?
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = text
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSavePushed(_ sender: Any) {
        delegate?.onChange(textField.text ?? "")
    }
    
   

  

}
