//
//  SearchBar.swift
//  pokedex
//
//  Created by Anjanava on 2017-05-30.
//  Copyright © 2017 Anjanava. All rights reserved.
//

import UIKit

class SearchBarView: UISearchBar {
    
    var preferredFont: UIFont!
    var preferredTextColor: UIColor!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame
        
        searchBarStyle = UISearchBarStyle.prominent
        isTranslucent = false
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        layer.borderColor = ((UIColor(red: 255/255, green: 102/255, blue: 102/255, alpha: 1.0)).cgColor);
        layer.borderWidth = 1
    }
    
    func indexOfSearchFieldInSubviews() -> Int! {
        var index: Int!
        let searchBarView = subviews[0]
        
        for i in 0 ..< searchBarView.subviews.count {
            if searchBarView.subviews[i].isKind(of: UITextField.self) {
                index = i
                break
            }
        }
        
        return index
    }
    
    override func draw(_ rect: CGRect) {
        
        // Find the index of the search field in the search bar subviews.
        if let index = indexOfSearchFieldInSubviews() {
            // Access the search field
            let searchField: UITextField = (subviews[0]).subviews[index] as! UITextField
            
            // Set the font and text color of the search field.
            searchField.font = preferredFont
            searchField.textColor = UIColor.white
            
            // Set the background color of the search field.
            searchField.backgroundColor = barTintColor
            
            //Set searchbar placeholder color
            searchField.attributedPlaceholder = NSAttributedString(string:"Search Pokemon", attributes: [NSForegroundColorAttributeName: UIColor.white])
            
            //search search icon color change
            let glassIconView =  searchField.leftView as! UIImageView
            glassIconView.image = glassIconView.image?.withRenderingMode(.alwaysTemplate)
            glassIconView.tintColor = UIColor.white
            
            
            //Set clearbutton image to white
            let clearBtn = searchField.value(forKey: "clearButton") as! UIButton
            clearBtn.setImage(clearBtn.imageView?.image?.withRenderingMode(.alwaysTemplate), for: .normal)
            clearBtn.tintColor = UIColor.white
        }
        
        super.draw(rect)
    }
}
