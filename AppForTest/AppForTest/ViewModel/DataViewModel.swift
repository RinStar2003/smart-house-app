//
//  ModelManager.swift
//  AppForTest
//
//  Created by мас on 21.07.2022.
//

import Foundation

class DataViewModel {

    func fetchData(completion: @escaping(Devices) -> Void) {
        
        guard let url = URL(string: "http://storage42.com/modulotest/data.json") else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
            }
            
            guard let jsonData = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                
                let decodedData = try decoder.decode(Devices.self, from: jsonData)
                completion(decodedData)
                
            } catch {
                
                print("Error decoding data")
                
            }
            
        }
        dataTask.resume()
        
    }
    
}
