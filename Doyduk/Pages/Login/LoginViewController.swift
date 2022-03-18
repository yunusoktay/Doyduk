//
//  LoginViewController.swift
//  Doyduk
//
//  Created by yunus oktay on 18.03.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var tableNoTextField: UITextField!
    
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.text = userDefaults.string(forKey: "name")
        tableNoTextField.text = userDefaults.string(forKey: "tableNo")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func actionLoginButton(_ sender: Any) {
        
        if nameTextField.text == "" {
            showAlert(message: "Lütfen isminizi girin!")
        }
        else if tableNoTextField.text == "" {
            showAlert(message: "Lütfen masa numarasını girin!")
        } else {
            
            userDefaults.set(nameTextField.text, forKey: "name")
            userDefaults.set(tableNoTextField.text, forKey: "tableNo")
            
            self.performSegue(withIdentifier: "loginToCategories", sender: self)
        }
        
    }
    
    func showAlert(message: String) {
        
        let alert = UIAlertController(title: "Hata!", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let categories = segue.destination as!  CategoriesViewController
        
        let login = sender as! LoginViewController
        
        categories.title = "\(login.nameTextField.text!), \(login.tableNoTextField.text!)"
    }

    

}
