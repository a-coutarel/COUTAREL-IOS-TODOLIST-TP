//
//  DetailViewController.swift
//  TP
//
//  Created by Nemo on 04/12/2022.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let todo = data {
            name.text = todo.name
            desc.text = todo.desc
            if (todo.done) {
                state.text = "Done"
                state.textColor = UIColor.green;
            }
            else {
                state.text = "To do"
                state.textColor = UIColor.red;
            }
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd"
            date.text = formatter.string(from: todo.date)
        }

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func deletePress(_ sender: Any) {
        var dialogMessage = UIAlertController(title: "Confirm", message: "Are you sure you want to delete this task ?", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            while let idx = self.myData?.todoList.firstIndex(of:self.data!) {
                self.myData?.todoList.remove(at: idx)
            }
            self.navigationController?.popViewController(animated: true)
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        ok.setValue(UIColor.red, forKey: "titleTextColor")
        
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? EditDetailsViewController {
            vc.data = data
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewDidLoad()
        myData?.sort()
    }
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var date: UILabel!
    
    var data: ToDo?
    var myData: ToDoList?
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
