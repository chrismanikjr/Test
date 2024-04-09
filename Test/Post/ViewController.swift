//
//  ViewController.swift
//  Test
//
//  Created by Chrismanto Natanail Manik on 05/04/24.
//

import UIKit

class ViewController: UIViewController {

    private var viewModel = PostViewModel()
    private var tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Posts"
        navigationItem.backButtonTitle = ""
        // Do any additional setup after loading the view.
        
        setupTableview()
        viewModel.loadDataPost()
        observerModel()
    }
    
    private func observerModel(){
        viewModel.updatePostData = { [weak self] in
            print(self?.viewModel.posts)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    private func setupTableview(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.indentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.indentifier, for: indexPath) as! TableViewCell
        cell.setupDataCell(post: viewModel.posts[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.configure(posts: viewModel.posts[indexPath.row])
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

