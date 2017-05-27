//
//  BeerDetailViewController.swift
//  UOL
//
//  Created by Hildequias Silas dos Santos Junior on 27/05/17.
//  Copyright © 2017 Hildequias. All rights reserved.
//

import UIKit

class BeerDetailViewController: UIViewController {
    
    var beer = Beer()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UITextView!
    @IBOutlet weak var ibuLabel: UILabel!
    @IBOutlet weak var abvLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nameLabel.text = beer.Name
        descLabel.text = beer.Desc
        ibuLabel.text = "\(beer.Ibu)"
        abvLabel.text = "\(beer.Abv)%"
        taglineLabel.text = beer.Tagline
        icon.sd_setImage(with: URL(string: beer.ImageUrl!), placeholderImage: UIImage(named: "ic_exclamation"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
