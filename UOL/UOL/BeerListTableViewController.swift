//
//  BeerListTableViewController.swift
//  UOL
//
//  Created by Hildequias Silas dos Santos Junior on 27/05/17.
//  Copyright © 2017 Hildequias. All rights reserved.
//

import UIKit
import SDWebImage
import MBProgressHUD

class BeerListTableViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {

    var hud : MBProgressHUD = MBProgressHUD()
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    let api = PunkAPI()
    
    var isLoading = false
    var beers = [Beer]()
    var filtered:[Beer] = []
    var page = 1
    var searchActive = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.getBeers()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Service called
    func getBeers() {
        
        self.hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        self.hud.mode = MBProgressHUDMode.indeterminate
        self.hud.label.text = "Loading"
        
        self.isLoading = true
        api.getBeers(page: page) { (results) in

            for beerItem in results {
                
                self.beers.append(beerItem)
            }
            
            self.tableView.reloadData()
            
            self.hud.hide(animated: true)
            self.page += 1
            self.isLoading = false
        }
    }
    
    func getBeer(id: Int) {
        self.hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        self.hud.mode = MBProgressHUDMode.indeterminate
        self.hud.label.text = "Loading"
        
        api.getSingleBeer(id: id) { (result) in
            
            self.hud.hide(animated: true)
            self.performSegue(withIdentifier: "detailSegue", sender: result)
        }
    }
    
    // MARK: - UITableView Delegates
    
    // number of rows in table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(searchActive) {
            return filtered.count
        }
        
        return self.beers.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // create a cell for each table view row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:BeerTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! BeerTableViewCell!
        
        var beer = Beer()
        
        if(searchActive){
            beer = filtered[indexPath.row]
            
        } else {
            beer = beers[indexPath.row]
        }
        
        // set the text from the data model
        cell.nameLabel?.text = beer.Name
        cell.icon.sd_setImage(with: URL(string: beer.ImageUrl!), placeholderImage: UIImage(named: "ic_exclamation"))
        cell.abvLabel?.text = String("Abv: \(beer.Abv)%")
        
        return cell
    }
    
    // method to run when table view cell is tapped
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableView.deselectRow(at: indexPath, animated: true)
        self.getBeer(id: beers[indexPath.row].Id)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "detailSegue") {
            let detailVC = segue.destination as! BeerDetailViewController
            detailVC.beer = sender as! Beer
        }
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let currentOffset = scrollView.contentOffset.y;
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        
        if maximumOffset - currentOffset > 1.0 {
            return
        }
        
        if !self.isLoading {
            self.getBeers()
        }
    }
    
    // MARK: - Search Delegate
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.searchActive = false
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
        //filtered = beers.filter({searchText.contains($0.Name!)})
        
        
        self.filtered = self.beers.filter({ (text) -> Bool in
            let tmp: NSString = text.Name! as NSString
            let range = tmp.range(of: searchText, options: .caseInsensitive)
            return range.location != NSNotFound
        })
        
        if(self.filtered.count == 0){
            self.searchActive = false
        } else {
            self.searchActive = true
        }
        self.tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchActive = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchActive = false
    }
    
    func search(sender: UIBarButtonItem) ->() {
        
    }
}
