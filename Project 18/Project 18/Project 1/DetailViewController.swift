//
//  DetailViewController.swift
//  Project 1
//
//  Created by Lucas Neves dos santos pompeu on 20/04/23.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
   
    var selectedImage: String? 
    var x: Int?
    var y: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Picture \(x!) of \(y!)"
        navigationItem.largeTitleDisplayMode = .never
        
        assert(selectedImage != nil, "No image provided")
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
    }
    
        
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
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
