//
//  SearchTableViewCell.swift
//  iOSWeather
//
//  Created by Ahmed Mahouchi on 19/7/2022.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var cityName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
