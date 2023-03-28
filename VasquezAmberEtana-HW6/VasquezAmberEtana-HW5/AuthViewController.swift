// Project: VasquezAmberEtana-HW6
// EID: kav835
// Course: CS329E

// AuthViewController.swift


import UIKit
import FirebaseAuth

class AuthViewController: UIViewController {
    @IBOutlet weak var authSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var confirmPasswordLabel: UILabel!
    @IBOutlet weak var confirmPasswordtextField: UITextField!
    @IBOutlet weak var passwordtextField: UITextField!
    @IBOutlet weak var userNametextField: UITextField!
    
    @IBOutlet weak var authButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLogin()
        // Do any additional setup after loading the view.
    }
    func setupLogin(){
        statusLabel.text = ""
        confirmPasswordLabel.isHidden = true
        confirmPasswordtextField.isHidden = true
        authButton.setTitle("Sign In", for: .normal)
    }
    func setupSignUp () {
        statusLabel.text = ""
        confirmPasswordLabel.isHidden = false
        confirmPasswordtextField.isHidden = false
        authButton.setTitle("Sign Up", for: .normal)
    }
    @IBAction func authSegmentChanged(_ sender: Any) {
        // to do: change labels and hode confirm password
        if authSegmentedControl.selectedSegmentIndex == 0 {
            setupLogin()
        }else {
            setupSignUp()
        }
    }
    @IBAction func authButtonPushed(_ sender: Any) {
        // to  do: create new user or sign in user and push to list
        guard let userName = userNametextField.text, !userName.isEmpty else {
          statusLabel.text = "Username Required"
          return
        }
        guard let password = passwordtextField.text, !password.isEmpty else {
          statusLabel.text = "Password Required"
          return
        }
        var confirmPassword = ""
        if (authSegmentedControl.selectedSegmentIndex == 1) {
            guard let c = confirmPasswordtextField.text, !c.isEmpty else {
            statusLabel.text = "Confirm Password Required"
            return
          }

          if (c != password) {
            statusLabel.text = "Passwords must match"
            return
          }
          confirmPassword = c
        }
        if (authSegmentedControl.selectedSegmentIndex == 0) {
            Auth.auth().signIn(withEmail: userName, password: password) { authResult, error in
                if error != nil {
                    self.statusLabel.text = error?.localizedDescription
                }else {
                    self.performSegue(withIdentifier: "DASHBOARD", sender: nil)
                }
            }

            
        }else{
            Auth.auth().createUser(withEmail: userName, password: password) { authResult, error in
                if error != nil {
                    self.statusLabel.text = error?.localizedDescription
                }else {
                    self.performSegue(withIdentifier: "DASHBOARD", sender: nil)
                }
            }
        }
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
