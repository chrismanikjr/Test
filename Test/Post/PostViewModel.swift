//
//  PostViewModel.swift
//  Test
//
//  Created by Chrismanto Natanail Manik on 05/04/24.
//

import Foundation

enum NetworkError: Error{
    case invalidData
    case invalidResponse
    case message(_ error: String?)
}

class PostViewModel{
    private var url = URL(string: "https://jsonplaceholder.typicode.com/posts")
    var posts : [Post] = [Post]() {
        didSet{
            self.updatePostData?()
        }
    }
    var updatePostData: (()->())?

    func loadDataPost(){
        fetchDataPost { response in
            switch response {
            case .success(let posts):
                self.posts = posts
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    private func fetchDataPost(completion: @escaping (Result<[Post], NetworkError>) -> ()){
        guard let url = url else {
            completion(.failure(.message("Invalid Error")))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            do{
                let posts = try JSONDecoder().decode([Post].self, from: data)
                completion(.success(posts))
            }catch{
                completion(.failure(.message(error.localizedDescription)))
            }
        }.resume()
    }
    
    private func search(id: String){
        
    }
}
