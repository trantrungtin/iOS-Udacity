//
//  ViewController.swift
//  ImageRequest
//
//  Created by Tin Tran on 21/06/2022.
//

import UIKit

enum KittenImageLocation: String {
    case http = "http://www.kittenswhiskers.com/wp-content/uploads/sites/23/2014/02/Kitten-playing-with-yarn.jpg"
    case https = "https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Kitten_in_Rizal_Park%2C_Manila.jpg/460px-Kitten_in_Rizal_Park%2C_Manila.jpg"
    case error = "not a url"
}

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    let imageLocation = KittenImageLocation.http.rawValue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func handleLoadImagePress(_ sender: Any) {
        guard let imageUrl = URL(string: imageLocation) else {
            print("Could not create URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: imageUrl) {(data, response, error) in
            guard let data = data else {
                print("There was no data")
                return
            }
            let image = UIImage(data: data)
            self.imageView.image = image
        }
        task.resume()
    }
    
}

