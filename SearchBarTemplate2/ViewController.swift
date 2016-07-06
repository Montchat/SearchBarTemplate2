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
        
        filteredData = [ ]
        
        searchBar.delegate = self
        tableView.delegate = self ; tableView.dataSource = self
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissSearchBar))
        gestureRecognizer.delegate = self
        tableView.addGestureRecognizer(gestureRecognizer)

    }

}

class NameCell : UITableViewCell  {
    
    typealias Name = String
    
    let name:Name!
    
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
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
    
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.filteredData = []
        tableView.reloadData()
        
        NSObject.cancelPreviousPerformRequestsWithTarget(self, selector: #selector(ViewController.queryForNamesWithSearchText), object: nil)
        performSelector(#selector(ViewController.queryForNamesWithSearchText), withObject: nil, afterDelay: 0.5)
        self.searchText = searchText
        
    }
    
    func queryForNamesWithSearchText() {
        
        guard let searchText = self.searchText else { return }
        
        if searchText == "" { return } // so that it doesnt show all of our users. v important.
        
        for name in data {
            
            //this part needs to be improved. for search to happen, we need to create a Regex system where the strings that are typed through the SearchBar are checked in the data
            if (name.lowercaseString.rangeOfString(searchText)) != nil {
                filteredData.append(name)
                
            }
        
        }
        
        tableView.reloadData()
    
    }
    

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

extension ViewController : UIGestureRecognizerDelegate {
    
    
    func dismissSearchBar() { searchBar.resignFirstResponder()
        
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        
        guard let view = touch.view else { return true }
        if view.isDescendantOfView(tableView) && touch.view != tableView { return false }
        else { return true }
        
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        return true
    }
    
}