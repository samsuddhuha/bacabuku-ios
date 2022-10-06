//
//  ImageExtension.swift
//  BacaBuku
//
//  Created by Paxel on 06/10/22.
//

import Foundation
import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        var request = URLRequest(url: url)
        request.setValue("25e0bf00ab2fa7f03a9fa57035139e47ccb28c20658f6de907b8011347e369fb",forHTTPHeaderField: "X-Dreamfactory-API-Key")
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
//            print("tess \(httpURLResponse)")
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: "\(link)?api_key=32ded42cfffb77dee86a29f43d36a3641849d4b5904aade9a79e9aa6cd5b5948") else { return }
        downloaded(from: url, contentMode: mode)
    }
}
