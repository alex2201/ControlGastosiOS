//
//  CustomSegmentControl.swift
//  appCupra
//
//  Created by Mauricio Guerrero Vega on 05/08/20.
//  Copyright © 2020 Mauricio Guerrero Vega. All rights reserved.
//

import UIKit

protocol CustomSegmentedControlDelegate:class {
    func change(to index:Int)
}

class CustomSegmentedControl: UIView {
    private var buttonTitles: [String]!
    private var buttons: [UIButton]!
    private var selectorView: UIView!
    
    var textColor: UIColor = .black
    var selectorViewColor: UIColor = UIColor(named: "LineFill")!
    var selectorTextColor: UIColor = UIColor(named: "LineFill")!
    
    weak var delegate: CustomSegmentedControlDelegate?
    
    public private(set) var selectedIndex : Int = 0
    
    private func updateView() {
        createButton()
        configSelectorView()
        configStackView()
    }
    
    func setButtonTitles(_ titles: [String]) {
        buttonTitles = titles
        updateView()
    }
    
    func setIndex(index:Int) {
        buttons.forEach({ $0.setTitleColor(textColor, for: .normal) })
        let button = buttons[index]
        selectedIndex = index
        button.setTitleColor(selectorTextColor, for: .normal)
        let selectorPosition = frame.width/CGFloat(buttonTitles.count) * CGFloat(index)
        UIView.animate(withDuration: 0.2) {
            self.selectorView.frame.origin.x = selectorPosition
        }
    }
    
    private func configStackView() {
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stack.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stack.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    private func configSelectorView() {
        let selectorWidth = frame.width / CGFloat(buttonTitles.count)
        let selectorFrame = CGRect(x: 0, y: frame.height, width: selectorWidth, height: 2)
        selectorView = UIView(frame: selectorFrame)
        selectorView.backgroundColor = selectorViewColor

        let layer = CAShapeLayer()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: selectorFrame.width / 2 - 10, y: selectorFrame.height))
        path.addLine(to: CGPoint(x: selectorFrame.width / 2, y: selectorFrame.height + 10))
        path.addLine(to: CGPoint(x: selectorFrame.width / 2 + 8.66, y: selectorFrame.height))
        path.close()
        layer.fillColor = selectorViewColor.cgColor
        path.fill()
        
        layer.path = path.cgPath
        selectorView.layer.addSublayer(layer)
        addSubview(selectorView)
    }
    
    private func createButton() {
        buttons = [UIButton]()
        buttons.removeAll()
        subviews.forEach({$0.removeFromSuperview()})
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
            button.titleLabel?.textAlignment = .center
            button.titleLabel?.font = UIFont(name: "Cupra-Light", size: 12)
            button.setTitle(buttonTitle, for: .normal)
            button.addTarget(self, action:#selector(CustomSegmentedControl.buttonAction(sender:)), for: .touchUpInside)
            button.setTitleColor(textColor, for: .normal)
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
    }
    
    @objc func buttonAction(sender:UIButton) {
        for (buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            if btn == sender {
                let selectorPosition = frame.width/CGFloat(buttonTitles.count) * CGFloat(buttonIndex)
                selectedIndex = buttonIndex
                delegate?.change(to: selectedIndex)
                UIView.animate(withDuration: 0.3) {
                    self.selectorView.frame.origin.x = selectorPosition
                }
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
    }
    
}
