//
//  DetailBookController.swift
//  BacaBuku
//
//  Created by Paxel on 06/10/22.
//

import Foundation
import UIKit

class DetailBookController: UIViewController {
    
    private var viewModel : DetailBookViewModel!
    
    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var labelTitleBook: UILabel!
    @IBOutlet weak var labelCreator: UILabel!
    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var collectionHastag: UICollectionView!
    
    var idBook: Int!
    
    var listHashtag = [HashtagModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        setupViewModel()
    }
    
    private func setupViewModel() {
        self.showLoadingView()
        viewModel = DetailBookViewModel()
        viewModel.getDetailBook(id: idBook)
        
        viewModel.showLoading = { isLoading in
            self.showLoadingView(state: isLoading, "")
        }
        
        viewModel.showErrorAlert = { error in
            self.showAlert(message: error)
        }
        
        viewModel.successGetBook = { data in
            self.labelTitleBook.text = data.title
            self.labelDesc.text = data.synopsis.html2String
            self.labelCreator.text = "By : \(data.writerByWriterID.userByUserID.name ?? "")"
            
            self.listHashtag = data.hashtags
            self.collectionHastag.reloadData()
            
            let url = "\(BASE_URL_FILE)\(String(describing: data.coverURL))"
            self.imgCover.downloaded(from: url)
            
        }
    }
    
    private func setupUI() {
        
        collectionHastag.delegate = self
        collectionHastag.dataSource = self
        collectionHastag.register(UINib(nibName: "HashtagCell", bundle: nil), forCellWithReuseIdentifier: "HashtagCell")
    }


}

extension DetailBookController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listHashtag.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionHastag.dequeueReusableCell(withReuseIdentifier: "HashtagCell", for: indexPath) as! HashtagCell
        let hashtag = listHashtag[indexPath.row]
        cell.setupCollectionCell(hashTag: hashtag.name)
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
