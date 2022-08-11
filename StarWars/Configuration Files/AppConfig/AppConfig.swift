//
//  AppConfig.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import Foundation

struct AppConfig: Codable {
    
    var baseURL: String

    static let shared = AppConfig()
    
    enum CodingKeys: String, CodingKey {
        case baseURL = "BASE_URL"
    }

    enum EnvKeys: CodingKey {
        case prod
        case dev
    }
    
    private init() {
        guard let path = Bundle.main.path(forResource: "AppConfig", ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path),
            let decodedSelf = try? PropertyListDecoder().decode(AppConfig.self, from: xml)
            else {
                fatalError("could not decode AppConfig")
        }
        self = decodedSelf
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let baseURL = try container.nestedContainer(keyedBy: EnvKeys.self,forKey: .baseURL)
        
        #if DEV
        self.baseURL = try baseURL.decode(String.self, forKey: EnvKeys.dev)
        print("DEV")
        #else
        self.baseURL = try baseURL.decode(String.self, forKey: EnvKeys.prod)
        print("PROD")
        #endif
    }
}
