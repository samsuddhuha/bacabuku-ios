//
//  HashtagCell.swift
//  BacaBuku
//
//  Created by Paxel on 07/10/22.
//

import Foundation
import UIKit

class HashtagCell: UICollectionViewCell {
    
    @IBOutlet weak var labelHashtag: UILabel!
    @IBOutlet weak var viewHashtag: UIView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCollectionCell(hashTag: String) {
        
        labelHashtag.text = hashTag
        
        
        viewHashtag.layer.cornerRadius = 4
        viewHashtag.layer.borderWidth = 1
        viewHashtag.layer.borderColor = UIColor.systemCyan.cgColor

    }

}
