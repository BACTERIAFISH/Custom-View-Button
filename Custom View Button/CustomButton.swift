//
//  CustomButton.swift
//  Custom View Button
//
//  Created by FISH on 2021/8/24.
//

import UIKit

class CustomButton: UIButton {
    
    enum HighlightStyle {
        case flash
        case scale(ratio: CGFloat = 0.9)
        case shadow
    }
    
    private let customView: UIView
    var highlightStyle: HighlightStyle = .flash {
        didSet {
            switch highlightStyle {
            case .shadow:
                customView.layer.shadowOpacity = 1
                customView.layer.shadowOffset = CGSize(width: 3, height: 3)
            default:
                break
            }
        }
    }
    
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
        
        beganAnimation()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        endedAnimation()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        endedAnimation()
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
    
    private func beganAnimation() {
        switch highlightStyle {
        case .flash:
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.1, delay: 0, options: [.curveLinear], animations: {
                self.customView.alpha = 0.5
            }, completion: nil)
            
        case .scale(let ratio):
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.1, delay: 0, options: [.curveLinear], animations: {
                self.customView.transform = CGAffineTransform(scaleX: ratio, y: ratio)
            }, completion: nil)
            
        case .shadow:
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.1, delay: 0, options: [.curveLinear], animations: {
                self.customView.layer.shadowOffset = CGSize(width: 1, height: 1)
            }, completion: nil)
        }
    }
    
    private func endedAnimation() {
        switch highlightStyle {
        case .flash:
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.1, delay: 0, options: [.curveLinear], animations: {
                self.customView.alpha = 1
            }, completion: nil)
            
        case .scale(_):
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.1, delay: 0, options: [.curveLinear], animations: {
                self.customView.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
            
        case .shadow:
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.1, delay: 0, options: [.curveLinear], animations: {
                self.customView.layer.shadowOffset = CGSize(width: 3, height: 3)
            }, completion: nil)
        }
    }
}
