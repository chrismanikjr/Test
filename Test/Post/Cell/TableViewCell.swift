//
//  TableViewCell.swift
//  Test
//
//  Created by Chrismanto Natanail Manik on 05/04/24.
//

import UIKit

class TableViewCell: UITableViewCell {

    static var indentifier = "TableViewCell"
    
    private var idLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    private var titleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    private var stackview: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        return stackView
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupDataCell(post: Post){
        setupView()
        idLabel.text = "\(post.id)"
        titleLabel.text = post.title
    }
    
    private func setupView(){
        self.addSubview(stackview)
        [idLabel, titleLabel].forEach{stackview.addArrangedSubview($0)}
        stackview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackview.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            stackview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            stackview.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            stackview.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5)
        ])
    }
    

}
