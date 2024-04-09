//
//  DetailViewController.swift
//  Test
//
//  Created by Chrismanto Natanail Manik on 05/04/24.
//

import UIKit

class DetailViewController: UIViewController {
    private var userIdLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    private var idLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    private var titleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private var bodyLabel: UILabel = {
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
    private var padding: CGFloat = 20
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        // Do any additional setup after loading the view.
    }
    func configure(posts: Post){
        userIdLabel.text = "User Id: \(posts.userId)"
        idLabel.text = "Post Id: \(posts.id)"
        titleLabel.text = posts.title
        bodyLabel.text = posts.body
    }
    
    private func setupView(){
        navigationItem.title = "Post's Detail"

        [userIdLabel, idLabel, titleLabel, bodyLabel].forEach{stackview.addArrangedSubview($0)}
        view.addSubview(stackview)
        stackview.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            stackview.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -padding),
            stackview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }
}
