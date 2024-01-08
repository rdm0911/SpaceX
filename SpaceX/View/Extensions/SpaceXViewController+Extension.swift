//
//  SpaceXViewControllerExtension.swift
//  SpaceXApp
//

import Foundation
import UIKit

extension SpaceXViewController : UITableViewDataSource, UITableViewDelegate
{
    // MARK: - Table view datasource method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spaceXTableData?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "spaceXCell", for: indexPath) as! SpaceXTableViewCell
        if let spaceXData = spaceXTableData?[indexPath.row] {
            cell.configure(spaceXResponse: spaceXData)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.NavigateToSpaceXDetailsView) as? SpaceXDetailsViewController
        if let spaceXData = spaceXTableData?[indexPath.row] {
            let spaceXDetailsResponse = spaceXViewModel.getSpaceXDetailsResponse(spaceXResponse: spaceXData)
            viewController?.spaceXTableData = spaceXDetailsResponse
        }
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
}
