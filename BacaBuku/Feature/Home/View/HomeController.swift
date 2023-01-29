//
//  HomeController.swift
//  BacaBuku
//
//  Created by Paxel on 06/10/22.
//

import Foundation
import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var collectionBook: UICollectionView!
    
    private var viewModel : HomeViewModel!
    
    var listBook = [BookModel]()
    var isPageRefreshing = true
    var page = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        setupViewModel()
    }
    
    private func setupViewModel() {
        self.showLoadingView()
        viewModel = HomeViewModel()
        viewModel.getListBuku(offset: 0)
        
        viewModel.showLoading = { isLoading in
            self.showLoadingView(state: isLoading, "")
        }
        
        viewModel.showErrorAlert = { error in
            self.showAlert(message: error)
        }
        
        viewModel.successGetListBook = { listData in
            
            for data in listData {
                self.listBook.append(data)
            }
            self.collectionBook.reloadData()
            if listData.count != 0 {
                self.isPageRefreshing = false
            }
        }
    }
    
    private func setupUI() {
        title = "Daftar Buku"
        
        collectionBook.delegate = self
        collectionBook.dataSource = self
        collectionBook.register(UINib(nibName: "BookCell", bundle: nil), forCellWithReuseIdentifier: "BookCell")
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(self.collectionBook.contentOffset.y >= (self.collectionBook.contentSize.height - self.collectionBook.bounds.size.height)) {
            if !isPageRefreshing {
                isPageRefreshing = true
                page += 1
                viewModel.getListBuku(offset: page*6)
            }
        }
    }
    
    @IBAction func btnToFavoritWithoutDiffable(_ sender: Any) {
        let vc = FavoritWithoutDiffableController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnToFavoritWithDiffable(_ sender: Any) {
        let vc = FavoritWithDiffableController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listBook.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionBook.dequeueReusableCell(withReuseIdentifier: "BookCell", for: indexPath) as! BookCell
        let bookData = listBook[indexPath.row]
        cell.setupCollectionCell(bookData: bookData)
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let bookData = listBook[indexPath.row]
        
        let vc = DetailBookController()
        vc.idBook = bookData.id
        navigationController?.pushViewController(vc, animated: true)
    }
}

