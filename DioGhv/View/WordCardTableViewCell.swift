//
//  WordCardTableViewCell.swift
//  DioGhvKeyboard
//
//  Created by silly on 08/04/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class WordCardTableViewCell: UITableViewCell {

    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var pronLabel: UILabel!
    
    var rowId: Int64?
    let num2UpNum = ["1":"¹", "2":"²", "3":"³", "4":"⁴", "5":"⁵", "6":"⁶", "7":"⁷", "8":"⁸"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPronLabelText(with str: String) {
        var retStr = ""
        for c in str.characters {
            if c > "0" && c <= "8" {
                retStr += num2UpNum[String(c)]!
            } else {
                retStr += String(c)
            }
        }
        self.pronLabel.text = retStr
    }
    
}
