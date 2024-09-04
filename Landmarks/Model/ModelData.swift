//
//  ModelData.swift
//  Landmarks
//
//  Created by Peter Abbott on 29/08/2024.
//

//  Summary:
//  The code defines a global variable landmarks that is populated with an array of Landmark objects by loading and decoding JSON data from a file named "landmarkData.json".

//  The load function is responsible for finding the file, reading its contents, and decoding the JSON into the appropriate Swift data structure.

//  The function is generic and can decode any type conforming to Decodable, providing flexibility if you want to use it for other types of data besides Landmark.

//  Error handling is done rigorously, ensuring that if something goes wrong (like the file not being found or JSON decoding failing), the program will terminate with a clear error message.



import Foundation


//  creates a global variable with is an array of landmarks
//  initializes the function "load" pointing at the landmarks.data file

var landmarks: [Landmark] = load("landmarkData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    
//    finds the url and throws a fatal error if not found
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle")
    }
    
    
//    attempts to read the contents of the file and turns it into a Data object
//    uses a "do-catch" block to handle errors that may occur when reading the file
    
    do {
        data = try Data(contentsOf: file)
    } catch{
        fatalError("Couldn't load \(filename) in main bundle:\n\(error)")
    }
    
    
//    uses JSONDecoder to handle the decoding of the JSON
//    decode attempts to "decode" the raw data into the landmark object
//    uses a "do-catch" block to throw an an error if an error occurs during the decoding process
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
