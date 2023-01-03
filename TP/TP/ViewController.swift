//
//  ViewController.swift
//  TP
//
//  Created by Allan Coutarel on 07/11/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UISearchResultsUpdating {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchController.isActive {
            return searchResults.count
        }
        else {
            return myData.todoList.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableViewCell
        
        let row = indexPath.row
        
        let todo = (searchController.isActive) ? searchResults[row] : myData.todoList[row]
        
        
        cell.todoName.text = todo.name
        cell.todo = todo
        
        if todo.done == false {
            cell.doneButton.setTitleColor(UIColor.red, for: .normal)
        }
        else {
            cell.doneButton.setTitleColor(UIColor.green, for: .normal)
        }
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search a task..."
        
        var todo1 = ToDo(name: "Faire les courses", desc: "Lait, café, cacao")
        todo1.setDateText(date: "2022/12/21")
        var todo2 = ToDo(name: "Faire les devoirs", desc: "Maths, C++")
        todo2.setDateText(date: "2022/12/15")
        
        myData.addToDo(toDo: todo1)
        myData.addToDo(toDo: todo2)
            
        myTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailViewController {
            let row = myTableView.indexPathForSelectedRow!.row
            vc.data = (searchController.isActive) ? searchResults[row] : myData.todoList[row]
            vc.myData = myData
        }
    }
    
    @IBAction func cancel(_ unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? EditViewController {
            vc.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func save(_ unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? EditViewController {
            if let todoName = vc.todoName {
                if let todoDesc = vc.todoDesc {
                    if let todoDate = vc.todoDate {
                        var todo = ToDo(name: todoName, desc: todoDesc)
                        todo.setDate(date: todoDate)
                        myData.addToDo(toDo: todo)
                        myTableView.reloadData()
                    }
                }
            }
            vc.dismiss(animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            var dialogMessage = UIAlertController(title: "Confirm", message: "Are you sure you want to delete this task ?", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                self.myData.todoList.remove(at: indexPath.row)
                self.myTableView.deleteRows(at: [indexPath], with: .fade)
            })
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            ok.setValue(UIColor.red, forKey: "titleTextColor")
            
            dialogMessage.addAction(ok)
            dialogMessage.addAction(cancel)
            
            self.present(dialogMessage, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if searchController.isActive {
            return false
        } else {
            return true
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myTableView.reloadData()
    }
    
    
    func filterContent(for searchText: String) {
        searchResults = myData.todoList.filter({ (todo) -> Bool in
            if let todoname = todo.name as String? {
                let isMatch = todoname.localizedCaseInsensitiveContains(searchText)
                return isMatch
            }
            return false
        })
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterContent(for: searchText)
            myTableView.reloadData()
        }
    }
    

    @IBOutlet weak var myTableView: UITableView!
    
    var myData = ToDoList()
    
    let searchController = UISearchController()
    
    var searchResults: [ToDo] = []
    
}
