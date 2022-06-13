//
//  UniversitasTableViewCell.swift
//  Sample MVVM iOS
//
//  Created by Pak Ahmad on 13/06/22.
//

import UIKit

class UniversitasTableViewCell: UITableViewCell {

    @IBOutlet weak var lblWebsite: UILabel!
    @IBOutlet weak var lblNegara: UILabel!
    @IBOutlet weak var lblNama: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data: Universitas){
        lblNama.text = data.name
        lblNegara.text = data.country
        if !data.web_pages.isEmpty{
            lblWebsite.text = data.web_pages[0]
        }else{
            lblWebsite.text = "-"
        }
    }
    
}
