//
//  FilterViewController.swift
//  DynamicButtons
//
//  Created by Joe Sanfilippo on 2018-03-25.
//  Copyright © 2018 Joe Sanfilippo. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {

    // Dictionary that holds the status of each category button (On or Off)
    var categoriesStatus = [String: Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Find all category buttons in the scene and add them to the category status dictionary
        let myViews = view.subviews.filter{$0 is CategoryButton}
        for view in myViews {
            if let button = view as? CategoryButton {
                categoriesStatus[button.category] = false
            }
        }
        print("Button Count:", myViews.count)
    }

    @IBAction func OKBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func abandonBtn(_ sender: Any) {
        toggleButton(sender)
    }
    
     @IBAction func caveBtn(_ sender: Any) {
        toggleButton(sender)
    }
    
    @IBAction func desertBtn(_ sender: Any) {
        toggleButton(sender)
    }

    @IBAction func forestBtn(_ sender: Any) {
        toggleButton(sender)
    }
    
    @IBAction func setAllBtn(_ sender: UIButton) {
        turnOnAllCategories()
    }
    
    @IBAction func clearAllBtn(_ sender: UIButton) {
        turnOffAllCategories()
    }
    
    // Toggle the tint color of the button
    func toggleButton (_ sender: Any) {
        if let button = sender as? CategoryButton {
            
            // If the button is ON toggle it OFF and set color to gray
            if categoriesStatus[button.category]! {
                button.tintColor = .gray
                categoriesStatus[button.category] = !categoriesStatus[button.category]!
            } else {
            // If the button is OFF toggle it ON and set color to green
                button.tintColor = .green
                categoriesStatus[button.category] = !categoriesStatus[button.category]!
            }
        }
    }
    
    // Turn ON all of the categories
    func turnOnAllCategories() {
        for category in categoriesStatus.keys {
            categoriesStatus[category] = true
        }
        let myViews = view.subviews.filter{$0 is CategoryButton}
        for view in myViews {
            if let button = view as? CategoryButton {
                button.tintColor = .green
            }
        }
    }
   
    // Turn OFF all of the categories
    func turnOffAllCategories() {
        for category in categoriesStatus.keys {
            categoriesStatus[category] = false
        }
        let myViews = view.subviews.filter{$0 is CategoryButton}
        for view in myViews {
            if let button = view as? CategoryButton {
                button.tintColor = .gray
            }
        }
    }


}
