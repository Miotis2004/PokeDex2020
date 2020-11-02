//
//  NetworkManager.swift
//  PokeDex2020
//
//  Created by Field Employee on 10/31/20.
//

import UIKit

final class NetworkManager {
    static var shared = NetworkManager()
    
    //let session = URLSession
    var pokemonArray = [Pokemon]()
    
    private init(session: URLSession = URLSession.shared){
        //self.session = session
    }
}

extension NetworkManager {
    
    
}
