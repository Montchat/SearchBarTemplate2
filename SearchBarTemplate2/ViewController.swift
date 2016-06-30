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

class NameCell : UITableViewCell  {
    
    typealias Name = String
    
    let name:Name
    
    init(name: Name) {
        self.name = name
        
        super.init(style: .Default, reuseIdentifier: "cell")
        textLabel?.text = name
        textLabel?.font = UIFont.boldSystemFontOfSize(20)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension ViewController : UISearchBarDelegate {
    
}

extension ViewController : UITableViewDelegate {
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
}

extension ViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = NameCell(name: filteredData[indexPath.row])
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredData.count
    }
    
}