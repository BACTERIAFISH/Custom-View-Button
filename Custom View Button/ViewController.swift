//
//  ViewController.swift
//  Custom View Button
//
//  Created by FISH on 2021/8/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customView = UIView()
        customView.backgroundColor = .blue
        
        let button = CustomButton(view: customView, frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        button.highlightStyle = .shadow
        view.addSubview(button)
    }


}

