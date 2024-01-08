//
//  SpaceXResource.swift
//  SpaceXApp
//

import Foundation
import UIKit

struct SpaceXResource {
    func getSpaceXData(completion: @escaping(_ result : [SpaceXResponse]?) -> Void) {
        let httpUtility = HttpUtility()
        let spaceXEndpoint = ApiEndpoints.spaceX
        let requestUrl = URL(string:spaceXEndpoint)!
        httpUtility.getApiData(requestUrl: requestUrl, resultType: [SpaceXResponse].self) { (spaceXApiResponse) in
            _ = completion(spaceXApiResponse)
        }
    }
    
    //download Image through server
    
    func downloadImage(from url: URL, completion: @escaping(_ result: UIImage?)-> Void) {
        let httpUtility = HttpUtility()
        httpUtility.getImage(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            if let spaceXImage = UIImage(data: data) {
                _ = completion(spaceXImage)
            }
        }
    }
}
