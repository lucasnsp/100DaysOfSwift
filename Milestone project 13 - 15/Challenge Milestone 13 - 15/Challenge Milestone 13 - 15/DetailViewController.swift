//
//  DetailViewController.swift
//  Challenge Milestone 13 - 15
//
//  Created by Lucas Neves dos santos pompeu on 16/06/23.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var largeFlagImageView: UIImageView!
    @IBOutlet var capitalLabel: UILabel!
    @IBOutlet var countryCodeLabel: UILabel!
    @IBOutlet var populationLabel: UILabel!
    @IBOutlet var regionLabel: UILabel!
    
    
    
    
    var country: Country!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
