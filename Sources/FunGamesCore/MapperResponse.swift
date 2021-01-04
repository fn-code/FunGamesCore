//
//  File.swift
//  
//
//  Created by Ludin Nento on 02/01/21.
//

import Foundation

public protocol MapperResponse {
    associatedtype Response
    associatedtype Domain
    
    func transformResponsesToDomain(response: [Response]) -> [Domain]
  func transformResponseToDomain(response: Response) -> Domain
}
