//
//  SecondViewController.swift
//  DidSelect
//
//  Created by Mac on 12/10/22.
//

import UIKit
import SDWebImage

class SecondViewController: UIViewController {
    
    
    var productTitle = ""
    var productDescription = ""
    var productPrice = ""
    var image : URL?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        titleLabel.text = productTitle
        descriptionLabel.text = productDescription
        priceLabel.text = productPrice
        self.imageView.sd_setImage(with: image)
       }
    @IBAction func btnToLogOut(_ sender: Any)
    {
        let LoginViewController  = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
