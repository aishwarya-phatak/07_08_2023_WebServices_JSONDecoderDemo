//
//  ViewController.swift
//  07_08_2023_WebServices_JSONDecoderDemo
//
//  Created by Vishal Jagtap on 19/10/23.
//

import UIKit

class ViewController: UIViewController {

    var url : URL?
    var urlRequest : URLRequest?
    var albums : [Album] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseJSONUsingDecoder()
    }

    func parseJSONUsingDecoder(){
        url = URL(string: "https://jsonplaceholder.typicode.com/albums")
        urlRequest = URLRequest(url: url!)
        URLSession.shared.dataTask(with: urlRequest!) { data, response, error in
            
            if(error == nil){
                print(response)
                print(data)
//                way 1
                let jsonDecoder = JSONDecoder()
                do {
                    self.albums = try jsonDecoder.decode([Album].self, from: data!)
                    for eachAlbum in self.albums{
                        print("Id \(eachAlbum.id) -- Title \(eachAlbum.title)")
                    }
                } catch{
                    print("Exception occured")
                }
                
                //way 2
//                self.albums = try! JSONDecoder().decode([Album].self, from: data!)
//                for eachAlbum in self.albums{
//                    print(eachAlbum.id)
//                }
            }
        }.resume()
    }
}
