//
//  UniversityDTO.swift
//  MenusApp
//
//  Created by Amr Hesham on 01/06/2022.
//

import Foundation

struct UniversityDTO: Codable {
    let alphaTwoCode: String?
    let domains: [String]?
    let country: String?
    let webPages: [String]?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case alphaTwoCode = "alpha_two_code"
        case domains, country
        case webPages = "web_pages"
        case name
    }
}

extension UniversityDTO {
    func toDomain() -> University {
        University(country: self.country, name: self.name)
    }
}
