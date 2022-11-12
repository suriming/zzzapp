//
//  DataService.swift
//  ZalZaZa
//
//  Created by Changjun Oh on 2022/11/12.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Contestant] {
        
        // parse local json file
        
        // Get an url path to the json
        let pathString = Bundle.main.path(forResource: "contestants", ofType: "json")
        
        // Check if pathString is nil, otherwise return an empty recipe array
        guard pathString != nil else {
            return [Contestant]()
        }
        
        // Create an url object
        let url = URL(filePath: pathString!)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data
            let decoder = JSONDecoder()
            
            do {
                let contestantData = try decoder.decode([Contestant].self, from: data)
                
                // Return the Recipes
                return contestantData
            }
            catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
        
        return [Contestant]()
    }
}
