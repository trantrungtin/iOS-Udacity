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
        DogAPI.requestRandomImage(completionHandler: handleRandomImageResponse(imageData:error:))
    }
    
    private func handleRandomImageResponse(imageData: DogImage?, error: Error?) {
        guard let imageURL = URL(string: imageData?.message ?? "") else {
            return
        }
        DogAPI.requestImageFile(url: imageURL) { (image, error) in
            self.handleImageFileResponse(image: image, error: error)
        }
    }
    
    private func handleImageFileResponse(image: UIImage?, error: Error?) {
        guard let image = image else {
            return
        }

        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }
}

