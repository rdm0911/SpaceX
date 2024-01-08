//
//  SpaceXTableViewCell.swift
//  SpaceXApp
//

import UIKit

class SpaceXTableViewCell: UITableViewCell {
    
    let spaceXViewModel : SpaceXViewModel = SpaceXViewModel()

    @IBOutlet weak var launchPatchImageView: UIImageView!
    @IBOutlet weak var missionNameLbl: UILabel!
    @IBOutlet weak var rocketNameLbl: UILabel!
    @IBOutlet weak var launchSiteNameLbl: UILabel!
    @IBOutlet weak var dateOfLaunchLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(spaceXResponse : SpaceXResponse?) {
        missionNameLbl.text = spaceXResponse?.mission_name
        rocketNameLbl.text = spaceXResponse?.rocket?.rocket_name
        launchSiteNameLbl.text = spaceXResponse?.launch_site?.site_name
        dateOfLaunchLbl.text = SpaceXDateFormatter.formatDate(dateString: spaceXResponse?.launch_date_utc)
        getSpaceXImage(imageString: spaceXResponse?.links?.mission_patch)
    }
    
    private func getSpaceXImage(imageString: String?) {
        spaceXViewModel.downloadSpaceXImage(imageString: imageString) { (image) in
            if(image != nil) {
                DispatchQueue.main.async {
                    self.launchPatchImageView.image = image
                }
            }
        }
    }
}
