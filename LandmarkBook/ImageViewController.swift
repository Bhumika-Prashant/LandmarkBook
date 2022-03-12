//
//  ImageViewController.swift
//  LandmarkBook
//
//  Created by Bhumika Hirapara on 2/21/22.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageName: UILabel!
    
    var selectedLandMarkName = ""
    var selectedLandMarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageName.text = selectedLandMarkName
        imageView.image = selectedLandMarkImage
        
    }
    
}
