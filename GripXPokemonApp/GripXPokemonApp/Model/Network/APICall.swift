//
//  APICall.swift
//  GripXPokemonApp
//
//  Created by Joe on 14/05/2022.
//

import Foundation

protocol APICall {
    var path: String { get }
}

extension APICall {
    func createURL(baseURL: String) -> URL? {
        return URL(string: baseURL + path )
    }
    
    func createURLRequest(baseURL: String, method: , headers: []? = nil, body: Data? = nil ) throws -> URLRequest {
        
    }
}
