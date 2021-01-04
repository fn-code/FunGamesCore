//
//  File.swift
//  
//
//  Created by Ludin Nento on 02/01/21.
//

import Foundation
import RxSwift

public protocol GameRepository {
  associatedtype RequestFavorite
  associatedtype ResponseGame
  associatedtype ResponseFavorite
    
  func getGames(page: Int, query: String, pageSize: Int) -> Observable<[ResponseGame]>
  func getGame(id: Int) -> Observable<ResponseGame>
  func getFavorites() -> Observable<[ResponseFavorite]>
  func getFavorite(id: Int) -> Observable<ResponseFavorite>
  func addFovorite(favorite: RequestFavorite) -> Observable<Bool>
  func deleteFovorite(id: Int) -> Observable<Bool>
}
