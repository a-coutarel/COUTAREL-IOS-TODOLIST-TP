//
//  ToDo.swift
//  TP
//
//  Created by Allan Coutarel on 07/11/2022.
//

import Foundation

class ToDo {
    var name: String
    var desc: String
    var done: Bool
    var date: Date
    
    init(name: String, desc: String) {
        self.name = name
        self.desc = desc
        self.done = false
        self.date = Date()
    }
    
    func setName(name: String) {
        self.name = name
    }
    
    func setDesc(desc: String) {
        self.desc = desc
    }
    
    func setDone(done: Bool) {
        self.done = done
    }
    
    func setDateText(date: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        self.date = formatter.date(from: date)!
    }
    
    func setDate(date: Date) {
        self.date = date
    }
    
}

extension ToDo: Equatable {
    static func == (lhs: ToDo, rhs: ToDo) -> Bool {
        return
            lhs.name == rhs.name &&
            lhs.desc == rhs.desc &&
            lhs.done == rhs.done &&
            lhs.date == rhs.date
    }
}
