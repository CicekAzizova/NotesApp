//
//  KeychainWrapper.swift
//  LocalNotesStarter
//
//  Created by Cicek on 24.07.26.
//

import Foundation

final class KeychainWrapper {
    private enum Keys {
        static let authToken = "authToken"
    }
    
    
    private let service : KeychainService
    
    init(service: KeychainService = KeychainService()) {
        self.service = service
    }
    
    func saveToken(_token: String) throws {
        guard let data = _token.data(using: .utf8)
        else { throw KeychainServiceError.invalidData }
        
        try service.save(data, for: Keys.authToken)
        
    }
   
}
