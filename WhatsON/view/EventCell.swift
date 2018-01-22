//
//  EventCell.swift
//  WhatsON
//
//  Created by Liam Ottley on 26/12/17.
//  Copyright © 2017 Liam Ottley. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var suburbLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var eventTypeLbl: UILabel!
    @IBOutlet weak var ageRangeLbl: UILabel!
    @IBOutlet weak var thumbImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    
    func updateCell(event: Event) {
//        dayLabel.text = forecast.date
//        weatherTypeLabel.text = forecast.weatherType
//        weatherIcon.image = UIImage(named: forecast.weatherType)
//        highTempLabel.text = "\(forecast.highTemp)"
//        lowTempLabel.text = "\(forecast.lowTemp)"
    }
}



