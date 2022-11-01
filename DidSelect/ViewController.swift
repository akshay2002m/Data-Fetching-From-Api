//
//  ViewController.swift
//  DidSelect
//
//  Created by Mac on 12/10/22.
//

import UIKit
import SDWebImage  // import SDWebImage package

class ViewController: UIViewController
{

    var products = [product]() // Create an array
    
    
    @IBOutlet weak var productTabelView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true // Hide Navigation Button
        
      
       productTabelView.delegate = self
        productTabelView.dataSource = self
        
        jsonObject {                       // function Data Reload
            self.productTabelView.reloadData()
        }
    }
    
    func jsonObject(completed:@escaping()->()) // Create Function Fetching Api
    {
        let urlString = "https://fakestoreapi.com/products" // create urlString
        let url = URL(string: urlString) // Extracting urlString in URL
        
        URLSession.shared.dataTask(with: url!){ data,response,error in // create Session
            if(error == nil)
            {
                do
                {
                    let jsondecoder = JSONDecoder()
                    self.products = try jsondecoder.decode([product].self, from: data!)
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                }catch
                {
                    print("error")
                }
            }
        }.resume()
    }
}
extension ViewController:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        secondVC.productTitle = products[indexPath.row].title
        secondVC.productDescription = products[indexPath.row].description
        secondVC.productPrice = String(products[indexPath.row].price)
        secondVC.image = products[indexPath.row].image
        
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300
    }
}

extension ViewController:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.productTabelView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProductTableViewCell
        
        cell.textLabel?.text = String(products[indexPath.row].id)
        cell.imageView1.sd_setImage(with: products[indexPath.row].image)

        return cell
    }
}

