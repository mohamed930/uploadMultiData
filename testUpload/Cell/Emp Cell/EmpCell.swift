//
//  EmpCell.swift
//  testUpload
//
//  Created by Mohamed Ali on 22/10/2021.
//

import UIKit

class EmpCell: UITableViewCell {
    
    @IBOutlet weak var EmpNameLabel: UILabel!
    @IBOutlet weak var EmpAgeLabel: UILabel!
    @IBOutlet weak var EmpEmailLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func ConfigureCell(Emp: EmpModel) {
        EmpNameLabel.text = Emp.EmpName
        EmpEmailLabel.text = Emp.EmpEmail
        EmpAgeLabel.text = String(Emp.EmpAge)
    }
}
