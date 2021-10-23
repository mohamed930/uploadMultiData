//
//  AddEmployeeViewController.swift
//  testUpload
//
//  Created by Mohamed Ali on 22/10/2021.
//

import UIKit

protocol Employee {
    func employee (emp: EmpModel)
}

class AddEmployeeViewController: UIViewController {
    
    // MARK:- TODO:- This Section for IBOutlets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    // MARK:- TODO:- This Section For init new varibles
    var delegate: Employee!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK:- TODO:- This Method For Add Button Action
    @IBAction func AddEmployee (_ sender: Any) {
        
        // check data not empty
        if userNameTextField.text == "" || ageTextField.text == "" || emailTextField.text == "" {
            print("No Make Next Action")
        }
        else {
            // convert values to emp model and send it to main vc.
            let emp = EmpModel(EmpName: userNameTextField.text!, EmpAge: Int(ageTextField.text!)!, EmpEmail: emailTextField.text!)
            delegate.employee(emp: emp)
            self.dismiss(animated: true)
        }
        
        
    }
    // ------------------------------------------------
    
    // MARK:- TODO:- this method for Back Button Action
    @IBAction func BackButtonAction (_ sender: Any) {
        self.dismiss(animated: true)
    }
    // ------------------------------------------------
    
    // MARK:- TODO:- this method For Dismiss keypad when touch on any place in screen.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    // ------------------------------------------------

}
