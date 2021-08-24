//
//  CustomButton.swift
//  Custom View Button
//
//  Created by FISH on 2021/8/24.
//

import UIKit

class CustomButton: UIButton {
    
    let customView: UIView
    
    init(view: UIView, frame: CGRect) {
        customView = view
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
    }
    
    private func setup() {
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.isUserInteractionEnabled = false
        
        addSubview(customView)
        
        NSLayoutConstraint.activate([
            customView.leadingAnchor.constraint(equalTo: leadingAnchor),
            customView.trailingAnchor.constraint(equalTo: trailingAnchor),
            customView.topAnchor.constraint(equalTo: topAnchor),
            customView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
