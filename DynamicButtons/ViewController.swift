//
//  ViewController.swift
//  AutoLayout UIStackView in UIScrollView
//
//  Created by Arjan van der Laan on 01/02/16.
//  Copyright © 2016 Arjan van der Laan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var catStack: UIStackView!
    var categories = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        loadCategories()
        loadButtons()
    }

    var okBtnIsOn = false
    
    @IBAction func okBtn(_ sender: UIButton) {
        if okBtnIsOn {
            sender.tintColor = .blue
            okBtnIsOn = !okBtnIsOn
        } else {
            sender.tintColor = .green
            okBtnIsOn = !okBtnIsOn
        }
    }
    
    
    func loadButtons() {
        for category in categories {
            let origImage = UIImage(named: category.image)
            let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
            let btn = UIButton()
            // btn.frame = CGRect(x: 60, y: 60, width: 50, height: 50)
            btn.setImage(tintedImage, for: .normal)
            // btn.imageView?.contentMode = UIViewContentMode.scaleToFill
            btn.imageView?.contentMode = .scaleToFill
            btn.contentVerticalAlignment = .center
            btn.contentHorizontalAlignment = .left

            btn.tintColor = .blue
            btn.setTitle(category.name, for: UIControlState.normal)
            btn.setTitleColor(.blue, for: .normal)
            btn.backgroundColor = UIColor.clear
            btn.layer.borderWidth = 1
            btn.layer.borderColor = UIColor.lightGray.cgColor
            btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
            btn.addTarget(self, action:#selector(toggleButton(btn:)), for: UIControlEvents.touchUpInside)
            catStack.addArrangedSubview(btn)
        }
    }
    
    @objc func toggleButton(btn: UIButton) {
        let name = btn.titleLabel?.text
        print(name!)
        let i = categories.index(where: {$0.name == name})
        print(i!)
        if categories[i!].isOn {
            btn.tintColor = .blue
            btn.setTitleColor(.blue, for: .normal)
            categories[i!].isOn = !categories[i!].isOn
        } else {
            btn.tintColor = .red
            btn.setTitleColor(.red, for: .normal)
            categories[i!].isOn = !categories[i!].isOn
        }
    }

    struct Category {
        var name: String = ""
        var image: String = ""
        var isOn: Bool = false
    }
    
    func loadCategories() {
        categories.append(Category(name: "Abandoned", image: "abandoned", isOn: false))
        categories.append(Category(name: "Cave", image: "cave", isOn: false))
        categories.append(Category(name: "Desert", image: "desert", isOn: false))
        categories.append(Category(name: "Forest", image: "forest", isOn: false))
        categories.append(Category(name: "Abandoned1", image: "abandoned", isOn: false))
        categories.append(Category(name: "Cave1", image: "cave", isOn: false))
        categories.append(Category(name: "Desert1", image: "desert", isOn: false))
        categories.append(Category(name: "Forest1", image: "forest", isOn: false))
        categories.append(Category(name: "Abandoned2", image: "abandoned", isOn: false))
        categories.append(Category(name: "Cave2", image: "cave", isOn: false))
        categories.append(Category(name: "Desert2", image: "desert", isOn: false))
        categories.append(Category(name: "Forest2", image: "forest", isOn: false))
        categories.append(Category(name: "Abandoned3", image: "abandoned", isOn: false))
        categories.append(Category(name: "Cave3", image: "cave", isOn: false))
        categories.append(Category(name: "Desert3", image: "desert", isOn: false))
        categories.append(Category(name: "Forest3", image: "forest", isOn: false))
        categories.append(Category(name: "Abandoned4", image: "abandoned", isOn: false))
        categories.append(Category(name: "Cave4", image: "cave", isOn: false))
        categories.append(Category(name: "Desert4", image: "desert", isOn: false))
        categories.append(Category(name: "Forest4", image: "forest", isOn: false))

    }
}
