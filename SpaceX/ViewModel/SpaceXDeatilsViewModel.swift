//
//  SpaceXDeatilsViewModel.swift
//  SpaceXApp
//


import Foundation
import UIKit

struct SpaceXDeatilsViewModel
{
    func downloadSpaceXImage(imageString: String?, completion: @escaping(_ result: UIImage?)-> Void)
    {
        let spaceXResource = SpaceXResource()
        if let imageUrl = URL(string: imageString ?? "") {
            spaceXResource.downloadImage(from: imageUrl) { image in
                _ = completion(image)
            }
        }
    }
}
