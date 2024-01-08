//
//  SpaceXViewModel.swift
//  SpaceXApp
//

import Foundation
import UIKit

struct SpaceXViewModel
{
    func getSpaceXDetailsResponse(spaceXResponse: SpaceXResponse) -> SpaceXDetailsResponse {
        return SpaceXDetailsResponse(imageString: spaceXResponse.links?.mission_patch, missionName: spaceXResponse.mission_name, launchSiteName: spaceXResponse.launch_site?.site_name_long, rocketName: spaceXResponse.rocket?.rocket_name, details: spaceXResponse.details, launchDate: spaceXResponse.launch_date_utc)
    }
    
    func getSpaceXData( completion: @escaping(_ result: [SpaceXResponse]?)-> Void)
    {
        let spaceXResource = SpaceXResource()

        spaceXResource.getSpaceXData { (spaceXApiResponse) in
//            var resultSpaceXApiResponse: [SpaceXResponse] = []
//            spaceXApiResponse?.forEach({ spaceXResponse in
//                var resultSpaceXResponse = spaceXResponse
//                self.downloadSpaceXImage(imageString: spaceXResponse.links?.mission_patch) { image in
//                    resultSpaceXResponse.image = image
//                    resultSpaceXApiResponse.append(resultSpaceXResponse)
//                }
//            })
            if var spaceXApiResponse = spaceXApiResponse {
                spaceXApiResponse = spaceXApiResponse.sorted { $0.launch_date_utc ?? "" > $1.launch_date_utc ?? ""}
                _ = completion(spaceXApiResponse)
            }
            

        }
    }
    
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
