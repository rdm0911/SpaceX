//
//  SpaceXDetailsViewController.swift
//  SpaceXApp
//

import UIKit

class SpaceXDetailsViewController: UIViewController {
    private var spaceXDetailsViewModel = SpaceXDeatilsViewModel()
    var spaceXTableData : SpaceXDetailsResponse? = nil
    
    @IBOutlet weak var missionNameLbl: UILabel!
    @IBOutlet weak var launchSiteNameLbl: UILabel!
    @IBOutlet weak var rocketNameLbl: UILabel!
    @IBOutlet weak var detailsTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(spaceXDetailsResponse: spaceXTableData)
    }
    
    func configure(spaceXDetailsResponse : SpaceXDetailsResponse?) {
        missionNameLbl.text = spaceXDetailsResponse?.missionName
        launchSiteNameLbl.text = spaceXDetailsResponse?.launchSiteName
        if let rocketName = spaceXDetailsResponse?.rocketName {
            let launchDate = SpaceXDateFormatter.formatDate(dateString: spaceXDetailsResponse?.launchDate)
            rocketNameLbl.text = "\(rocketName), Launch Date: \(launchDate)"
        }
        detailsTextView.text = spaceXDetailsResponse?.details
        getSpaceXImage(imageString: spaceXDetailsResponse?.imageString) 
    }
    
    private func getSpaceXImage(imageString: String?) {
        spaceXDetailsViewModel.downloadSpaceXImage(imageString: imageString) { (image) in
            if(image != nil) {
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
        }
    }
}
