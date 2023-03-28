// Project: VasquezAmberEtana-HW3
// EID: kav835
// Course: CS29E

// ColorChangeVC.swift

import UIKit


enum Color {
    case blue
    case red
}

protocol ColorChangeDelegate {
    func onChange(_ color: Color)
}

class ColorChangeVC: UIViewController {
    var delegate: ColorChangeDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func blueButtonPushed(_ sender: Any) {
        delegate?.onChange(Color.blue)
    }
    
    @IBAction func redButtonPushed(_ sender: Any) {
        delegate?.onChange(Color.red)
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
