//
//  File.swift
//  
//
//  Created by Ludin Nento on 03/01/21.
//

import Foundation
import RxSwift

public protocol GameUseCase {
  associatedtype RequestFavorite
  associatedtype ResponseFavorite
  associatedtype ResponseGame
    
  func addFavorite(request: RequestFavorite) -> Observable<Bool>
  
  func deleteFavorite(id: Int) -> Observable<Bool>
  
  func getFavorites() -> Observable<[ResponseFavorite]>
  
  func getFavorite(id: Int) -> Observable<ResponseFavorite>
  
  func getGames(page: Int, query: String, pageSize: Int) -> Observable<[ResponseGame]>
  
  func getGame(id: Int) -> Observable<ResponseGame>
}
