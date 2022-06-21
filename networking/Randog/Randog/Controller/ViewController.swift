//
//  ViewController.swift
//  Randog
//
//  Created by Tin Tran on 21/06/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.loadImage()
    }

    private func loadImage() {
        let randomImageEndpoint = DogAPI.Enpoint.randomImageFromAllDogsCollection.url
        let task = URLSession.shared.dataTask(with: randomImageEndpoint) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let url = json["message"] as! String
                self.loadImageURL(URL(string: url)!)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    private func loadImageURL(_ imageUrl: URL) {
        let task = URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
        task.resume()
    }
}

