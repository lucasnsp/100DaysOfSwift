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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
                
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
            print("- imageToLoad: \(imageToLoad)")
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
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8)
            else {
            print("no image found")
            return
        }
        
        
        let vc = UIActivityViewController(activityItems: [image, selectedImage?.replacingOccurrences(of: ".jpg", with: "") as Any], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        
        present(vc, animated: true)
    }
}
