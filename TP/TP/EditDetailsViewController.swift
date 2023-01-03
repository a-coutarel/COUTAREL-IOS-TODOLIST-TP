//
//  EditDetailsViewController.swift
//  TP
//
//  Created by Allan Coutarel on 06/12/2022.
//

import UIKit

class EditDetailsViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let todo = data {
            name.text = todo.name
            desc.text = todo.desc
            date.date = todo.date

            name.delegate = self
            desc.delegate = self
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        data?.setName(name: name.text!)
        data?.setDesc(desc: desc.text!)
        return true
    }
    
    @IBAction func nameEditing(_ sender: Any) {
        data?.setName(name: name.text!)
    }
    
    @IBAction func descEditing(_ sender: Any) {
        data?.setDesc(desc: desc.text!)
    }
    
    
    @IBAction func dateChange(_ sender: UIDatePicker) {
        data?.setDate(date: sender.date)
    }
    
    var data: ToDo?

    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var desc: UITextField!
    

}
