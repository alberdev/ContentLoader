//
//  ContentLoader
//  Copyright (c) 2019 alberdev. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var data1Label: UILabel!
    @IBOutlet weak var data2Label: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    struct ViewModel {
        let name: String
        let place: String
        let phone: String
        let points: Int
    }
    
    var viewModel: ViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            userImageView.image = UIImage(named: viewModel.name)
            nameLabel.text = viewModel.name
            data1Label.text = viewModel.place
            data2Label.text = "Phone: " + viewModel.phone
            pointsLabel.text = "\(viewModel.points)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}
