//
//  Common.swift
//  SpaceXApp
//

import Foundation

struct Constants {
    static let NavigateToSpaceXDetailsView = "navigateToSpaceXDetailsView"
}

struct ApiEndpoints
{
    static let spaceX = "https://api.spacexdata.com/v3/launches"
}

struct SpaceXDateFormatter {
    static func formatDate(dateString: String?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let dateString = dateString, let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "dd MMM yyyy"
            let formattedDate = dateFormatter.string(from: date)
            return formattedDate
        } else {
            return ""
        }
    }
}




