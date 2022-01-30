//
//  Petitions.swift
//  PetitionWhiteHouse
//
//  Created by Andres Gutierrez on 1/28/22.
//

import Foundation

struct MetaData: Codable, Hashable {
    var results = [Petitions]()
}

struct Petitions: Codable, Hashable {
    var title: String
    var body: String
    var signatureCount: Int
}
