//
//  SpaceXResponseModel.swift
//  SpaceXApp
//

import Foundation
import UIKit

struct SpaceXResponse : Decodable {
    let mission_name: String?
    let mission_id: [String]?
    let launch_date_unix: Int?
    let launch_date_utc: String?
    let launch_date_local: String?
    let rocket: Rocket?
    let launch_site: Launch_site?
    let links: Links?
    let details: String?
    var image: UIImage?

    enum CodingKeys: String, CodingKey {

        case mission_name = "mission_name"
        case mission_id = "mission_id"
        case launch_date_unix = "launch_date_unix"
        case launch_date_utc = "launch_date_utc"
        case launch_date_local = "launch_date_local"
        case rocket = "rocket"
        case launch_site = "launch_site"
        case links = "links"
        case details = "details"
        
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        mission_name = try values.decodeIfPresent(String.self, forKey: .mission_name)
        mission_id = try values.decodeIfPresent([String].self, forKey: .mission_id)
        launch_date_unix = try values.decodeIfPresent(Int.self, forKey: .launch_date_unix)
        launch_date_utc = try values.decodeIfPresent(String.self, forKey: .launch_date_utc)
        launch_date_local = try values.decodeIfPresent(String.self, forKey: .launch_date_local)
        rocket = try values.decodeIfPresent(Rocket.self, forKey: .rocket)
        launch_site = try values.decodeIfPresent(Launch_site.self, forKey: .launch_site)
        links = try values.decodeIfPresent(Links.self, forKey: .links)
        details = try values.decodeIfPresent(String.self, forKey: .details)
    }
}

struct Rocket : Decodable {
    let rocket_id : String?
    let rocket_name : String?
    
    enum CodingKeys: String, CodingKey {
        case rocket_id = "rocket_id"
        case rocket_name = "rocket_name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        rocket_id = try values.decodeIfPresent(String.self, forKey: .rocket_id)
        rocket_name = try values.decodeIfPresent(String.self, forKey: .rocket_name)
    }

}

struct Links : Decodable {
    let mission_patch : String?
    let mission_patch_small : String?

    enum CodingKeys: String, CodingKey {
        case mission_patch = "mission_patch"
        case mission_patch_small = "mission_patch_small"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        mission_patch = try values.decodeIfPresent(String.self, forKey: .mission_patch)
        mission_patch_small = try values.decodeIfPresent(String.self, forKey: .mission_patch_small)
    }

}

struct Launch_site : Decodable {
    let site_id : String?
    let site_name : String?
    let site_name_long : String?

    enum CodingKeys: String, CodingKey {

        case site_id = "site_id"
        case site_name = "site_name"
        case site_name_long = "site_name_long"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        site_id = try values.decodeIfPresent(String.self, forKey: .site_id)
        site_name = try values.decodeIfPresent(String.self, forKey: .site_name)
        site_name_long = try values.decodeIfPresent(String.self, forKey: .site_name_long)
    }

}
