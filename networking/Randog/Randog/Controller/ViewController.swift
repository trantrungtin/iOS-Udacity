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
            let decoder = JSONDecoder()
            let imageData = try! decoder.decode(DogImage.self, from: data)
            self.loadImageURL(URL(string: imageData.message)!)
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

