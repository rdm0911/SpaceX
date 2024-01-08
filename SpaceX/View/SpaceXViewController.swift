//
//  SpaceXViewController.swift
//  SpaceXApp
//

import UIKit

class SpaceXViewController: UIViewController {

    @IBOutlet weak var spaceXTableView: UITableView!
    

    let spaceXViewModel : SpaceXViewModel = SpaceXViewModel()
    var spaceXTableData : [SpaceXResponse]? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
        getSpaceXData()
    }

    private func getSpaceXData()
    {
        spaceXViewModel.getSpaceXData() { (spaceXApiResponse) in

            if(spaceXApiResponse != nil)
            {
                self.spaceXTableData = spaceXApiResponse

                DispatchQueue.main.async {
                    self.spaceXTableView.reloadData()
                }
            }

        }
    }
}
