//
//  BookCell.swift
//  BacaBuku
//
//  Created by Paxel on 06/10/22.
//

import Foundation
import UIKit
import Kingfisher

class BookCell: UICollectionViewCell {
    
    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var labelTitleBook: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCollectionCell(bookData: BookModel) {
        
        labelTitleBook.text = bookData.title
        let url = "\(BASE_URL_FILE)\(bookData.coverURL)"
        imgCover.downloaded(from: url)
        
    }

}
