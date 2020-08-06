//
//  CountryManager.swift
//  Corona Now
//
//  Created by Miguel Moya on 8/5/20.
//  Copyright © 2020 Miguel Moya. All rights reserved.
//

import UIKit

struct CountryManager {
    let initalQueryURL = "https://disease.sh/v3/covid-19/countries/"
    
    ///  This method will take care of joining the users country to the initialQueryURL for the API call
    func fetchCountry(countryName: String) {
        var cleanCountryName = countryName.trimmingCharacters(in: .whitespacesAndNewlines)
        var finalURL: String = ""
        
        // Check if there's a space diving two words
        if (cleanCountryName.contains(" ")) {
            // Insert the %20 in the string symbol so that query doesn't fail
            cleanCountryName = cleanCountryName.replacingOccurrences(of: " ", with: "%20")
            finalURL = "\(initalQueryURL)" + "\(cleanCountryName)"
        } else {
            finalURL = "\(initalQueryURL)\(cleanCountryName)"
        }
        
        print("Final API URL: \(finalURL)")
        
        // Make API request
        perfomAPICall(url: finalURL)
    }
    
    /// Handles API call
    func perfomAPICall(url urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                
                // If error is not equal to nil, then the API request failed
                if error != nil {
                    print(error!)
                    return
                }
                
                // If data is not equals to nil, then data will be assigned to safeData thus making the statement true
                if let safeData = data {
                    self.parseJSON(safeData)
                }
            }
            
            // Start API request
            task.resume()
        }
    }
    
    func parseJSON(_ countryData: Data) {
        let decoder = JSONDecoder()
        
        do {
            
        } catch {
            print(error)
        }
    }
}
