//
//  ViewController.swift
//  VasquezAmber-HW2
//  Project: VasquezAmber-HW2
//  EID: kav835
//  Course: CS329E
//
//  Created by Amber Etana Vasquez on 9/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var userIdTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: Any) {
        if let userId = userIdTextField.text, let password = passwordTextField.text, !userId.isEmpty && !password.isEmpty {
            self.statusLabel.text = "\(userId), logged in"
            
        }else {
            self.statusLabel.text = "invalid login"
        }
    }
    func hideKeyboard(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}
