//
//  SearchVC.swift
//  WhatsON
//
//  Created by Liam Ottley on 25/12/17.
//  Copyright © 2017 Liam Ottley. All rights reserved.
//

import UIKit

class SearchVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate {
    
    var event: Event!
    var Events = [Event]()
    var eventSearchResults:Array<Event>?

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return Events.count
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as? EventCell {

//            let event = Events[indexPath.row]
//            cell.updateCell(event: event)
            return cell
        } else {
            return EventCell()
        }
    }
}
