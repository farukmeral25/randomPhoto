//
//  ViewController.swift
//  random_photo
//
//  Created by Ömer Faruk Meral on 21.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button : UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let colors: [UIColor] = [
        .systemPink,
        .systemBlue,
        .systemRed,
        .systemMint,
        .systemTeal,
        .systemYellow,
        .systemOrange,
        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        ///Sayfanın arka planının verildiği kod
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        view.addSubview(button)
        
        getRandomPhoto()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        ///Image alanının bulunacağı kod parçası
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        ///Butonun bulunacağı yerin belirtildiği kod parçası
        button.frame = CGRect(x: 30, y:  view.frame.height - 150 - view.safeAreaInsets.bottom, width: view.frame.width - 60, height: 55)
        ///Butona fonksiyon verme işleminin yapıldığı yer
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        ///Butona radius  verme
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
    }
    
    @objc func didTapButton(){
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }
    
    
    func getRandomPhoto(){
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }


}

