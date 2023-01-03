//
//  ToDoList.swift
//  TP
//
//  Created by Allan Coutarel on 07/11/2022.
//

import Foundation

class ToDoList {
    
    var todoList: [ToDo]
    
    init() {
        self.todoList = []
    }
    
    func addToDo(toDo: ToDo) {
        self.todoList.append(toDo)
        self.sort()
    }
    
    func sort() {
        self.todoList.sort {
            $0.date < $1.date
        }
    }
    
}
