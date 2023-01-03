//
//  TableViewCell.swift
//  TP
//
//  Created by Allan Coutarel on 07/11/2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var todoName: UILabel!
    
    var todo: ToDo?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func changeState(_ sender: UIButton) {
        if todo?.done == false {
            todo?.done = true
            doneButton.setTitleColor(UIColor.green, for: .normal)
        }
        else {
            todo?.done = false
            doneButton.setTitleColor(UIColor.red, for: .normal)
        }
    }
    
}
