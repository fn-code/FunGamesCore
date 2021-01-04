//
//  File.swift
//  
//
//  Created by Ludin Nento on 02/01/21.
//

import Foundation

public protocol MapperEntityResponse {
  associatedtype Entity
  associatedtype Response
  associatedtype DomainFavorite
  associatedtype DomainGame
    
  func transformEntitiesToDomain(entities: [Entity]) -> [DomainFavorite]
  func transformResponsesToDomain(responses: [Response]) -> [DomainGame]
  func transformEntityToDomain(entity: Entity) -> DomainFavorite
  func transformDomainToEntity(domain: DomainFavorite) -> Entity
  func transformResponseToDomain(response: Response) -> DomainGame
}
