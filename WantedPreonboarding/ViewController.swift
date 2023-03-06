//
//  ViewController.swift
//  WantedPreonboarding
//
//  Created by 이형주 on 2023/02/27.
//

import UIKit


enum ImageOrder {
    case first
    case second
    case third
    case fourth
    case fifth
}

class ViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var fourthImageView: UIImageView!
    @IBOutlet weak var fifthImageView: UIImageView!
    
    
    @IBOutlet weak var firstProgressView: UIProgressView!
    @IBOutlet weak var secondProgressView: UIProgressView!
    @IBOutlet weak var thirdProgressView: UIProgressView!
    @IBOutlet weak var fourthProgressView: UIProgressView!
    @IBOutlet weak var fifthProgressView: UIProgressView!
    
    @IBAction func firstLoadButton(_ sender: UIButton) {
        setUrl(.first)
    }
    @IBAction func secondLoadButton(_ sender: UIButton) {
        setUrl(.second)
    }
    @IBAction func thirdLoadButton(_ sender: UIButton) {
        setUrl(.third)
    }
    @IBAction func fourthLoadButton(_ sender: UIButton) {
        setUrl(.fourth)
    }
    @IBAction func fifthLoadButton(_ sender: UIButton) {
        setUrl(.fifth)
    }
    
    @IBAction func loadAllImagesButton(_ sender: UIButton) {
        DispatchQueue.global().async { [weak self] in
            self?.setUrl(.first)
            self?.setUrl(.second)
            self?.setUrl(.third)
            self?.setUrl(.fourth)
            self?.setUrl(.fifth)
        }
    }

    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    // MARK: - Helpers
    
    func setUrl(_ order: ImageOrder) {
        print("DEBUG: load button tapped")
        
        switch order {
        case .first:
            let url = URL(string: "https://fastly.picsum.photos/id/799/141/99.jpg?hmac=ylkNRNbt6obz-1fDJQAH_vDDAtN1fxZed1XGzAurHFs")
            loadImageFromWeb(url, .first)
        case .second:
            let url = URL(string: "https://fastly.picsum.photos/id/603/141/99.jpg?hmac=SMvwSa-afeeHhOQesmCfjqYTJuXwrJ76xM--8nJwt_Q")
            loadImageFromWeb(url, .second)
        case .third:
            let url = URL(string: "https://fastly.picsum.photos/id/448/141/99.jpg?hmac=9kcxrTz5EwLRDmF09cpoNoOzLZTFV92zRwlWGrwJ8lM")
            loadImageFromWeb(url, .third)
        case .fourth :
            let url = URL(string: "https://fastly.picsum.photos/id/840/141/99.jpg?hmac=PH61dzX6ggNSlwLB3v8cssE_9Ba0wxlgFCdB1IlVxlo")
            loadImageFromWeb(url, .fourth)
        case .fifth :
            let url = URL(string: "https://fastly.picsum.photos/id/58/141/99.jpg?hmac=JHHk_kVc8xD3Hhkv12aXIynae4O9lGHDgmUcvQ5dLKs")
            loadImageFromWeb(url, .fifth)
        }
    }
    
    
    func loadImageFromWeb(_ url: URL?, _ order: ImageOrder) {

        guard let url else { return }
        URLSession.shared.dataTask(with: url) { data, resposne, error in
            if error != nil {
                print("DEBUG: image load error occured:\(error)")
                return
            }
            guard let data,
                  let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async { [weak self] in
                self?.setImageView(image, order)
            }
            print("DEBUG: image loaded:\(image)")

        }.resume()
    }
    
    func setImageView(_ image: UIImage, _ order: ImageOrder) {

        switch order {
        case .first:
            if self.firstImageView.image == nil {
                self.firstImageView.image = image
            } else {
                self.firstImageView.image = nil
            }
        case .second:
            if self.secondImageView.image == nil {
                self.secondImageView.image = image
            } else {
                self.secondImageView.image = nil
            }
        case .third:
            if self.thirdImageView.image == nil {
                self.thirdImageView.image = image
            } else {
                self.thirdImageView.image = nil
            }
        case .fourth:
            if self.fourthImageView.image == nil {
                self.fourthImageView.image = image
            } else {
                self.fourthImageView.image = nil
            }
        case .fifth:
            if self.fifthImageView.image == nil {
                self.fifthImageView.image = image
            } else {
                self.fifthImageView.image = nil
            }
        }
    }
    
    func setAllImageViews(_ image: UIImage, _ order: ImageOrder) {
        
        switch order {
        case .first:
            self.firstImageView.image = image
        case .second:
            self.secondImageView.image = image
        case .third:
            self.thirdImageView.image = image
        case .fourth:
            self.fourthImageView.image = image
        case .fifth:
            self.fifthImageView.image = image
        }
    }
}

