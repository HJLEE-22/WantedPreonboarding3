//
//  ViewController.swift
//  WantedPreonboarding
//
//  Created by 이형주 on 2023/02/27.
//

import UIKit

class ViewController: UIViewController {

    
    // MARK: - Properties
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var fourthImageView: UIImageView!
    @IBOutlet weak var fifthImageView: UIImageView!

    @IBOutlet weak var firstProgressBar: UIProgressView!
    @IBOutlet weak var secondProgressBar: UIProgressView!
    @IBOutlet weak var thirdProgressBar: UIProgressView!
    @IBOutlet weak var fourhProgressBar: UIProgressView!
    @IBOutlet weak var fifthProgressBar: UIProgressView!
    
    @IBAction func firstLoadButton(_ sender: UIButton) {
        DispatchQueue.main.async {
            let image = self.loadImage()
            print("DEBUG: image:\(image)")
            self.firstImageView.image = image
        }
    }
    @IBAction func secondLoadButton(_ sender: UIButton) {
    }
    @IBAction func thirdLoadButton(_ sender: UIButton) {
    }
    @IBAction func fourthLoadButton(_ sender: UIButton) {
    }
    @IBAction func fifthLoadButton(_ sender: UIButton) {
    }
    @IBAction func loadAllImagesButton(_ sender: UIButton) {
    }
    

    
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func loadImage() -> UIImage? {
        // 랜덤 이미지 호출 url (/width/height)
        let urlString = "https://picsum.photos/136/81"
        let url = URL(string: urlString)
        var image: UIImage?
        
        guard let url else { return UIImage()}
        let session = URLSession.shared
//        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let error {
                print(error.localizedDescription)
            }
            guard let safeData = data else { return }
            image = UIImage(data: safeData)
        }
        task.resume()
        return image
    }


}

