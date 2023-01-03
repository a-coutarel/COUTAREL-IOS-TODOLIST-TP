//
//  EditViewController.swift
//  TP
//
//  Created by Nemo on 04/12/2022.
//

import UIKit

class EditViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoName = "Name"
        todoDesc = "Description"
        todoDate = date.date
        
        name.text = todoName
        desc.text = todoDesc

        name.delegate = self
        desc.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        todoName = name.text!
        todoDesc = desc.text!
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        todoName = name.text!
        todoDesc = desc.text!
    }
 
    @IBAction func dateChange(_ sender: UIDatePicker) {
        todoDate = sender.date
    }
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var desc: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    
    var todoName: String?
    var todoDesc: String?
    var todoDate: Date?

}
