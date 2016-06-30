//
//  ViewController.swift
//  SearchBarTemplate2
//
//  Created by Joe E. on 6/29/16.
//  Copyright © 2016 Montchat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    typealias Name = String
    typealias SearchText = String
    
    var data:[Name]!
    
    var searchDelayer: NSTimer?
    var searchText:SearchText?
    
    var filteredData:[Name]!

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.data = ["Allen", "Bennett", "Chloe", "Daniel" , "Evan", "Farah" , "George" , "Heidi", "Ian", "Jon", "Katherine", "Louis" , "Margaret", "Nathan" , "Ozzie", "Peter" , "Quinton", "Rachel", "Stephen" , "Travis", "Ursula", "Vick" , "William", "Xultan", "Zorro" ]
        
        searchBar.delegate = self
        tableView.delegate = self ; searchBar.delegate = self 

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

