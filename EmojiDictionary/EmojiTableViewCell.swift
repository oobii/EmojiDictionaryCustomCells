//
//  EmojiTableViewCell.swift
//  EmojiDictionary
//
//  Created by martynov on 2018-02-06.
//  Copyright © 2018 martynov. All rights reserved.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    
    // Using an update(with:) method on a custom table view cell is a common pattern for abstracting, or moving, setup code from the tableView(_:cellForRowAt:) method into the cell itself.
    

    func update( with emoji: Emoji) {
        symbolLabel.text = emoji.symbol
        nameLabel.text = emoji.name
        descriptionLabel.text = emoji.description
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
