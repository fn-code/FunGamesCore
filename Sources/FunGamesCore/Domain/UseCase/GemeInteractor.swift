//
//  File.swift
//  
//
//  Created by Ludin Nento on 03/01/21.
//

import Foundation
import RxSwift

public struct GameInteractor<RequestFavorite, ResponseFavorite, ResponseGame, R: GameRepository>: GameUseCase
where R.RequestFavorite == RequestFavorite, R.ResponseFavorite == ResponseFavorite, R.ResponseGame == ResponseGame {
    
    private let _repository: R
    
    public init(repository: R) {
        _repository = repository
    }
    
  public func addFavorite(request: RequestFavorite) -> Observable<Bool> {
    _repository.addFovorite(favorite: request)
  }
  
  public func deleteFavorite(id: Int) -> Observable<Bool> {
    _repository.deleteFovorite(id: id)
  }
  
  public func getFavorites() -> Observable<[ResponseFavorite]> {
    _repository.getFavorites()
  }
  
  public func getFavorite(id: Int) -> Observable<ResponseFavorite> {
    _repository.getFavorite(id: id)
  }
  
  public func getGames(page: Int, query: String, pageSize: Int) -> Observable<[ResponseGame]> {
    _repository.getGames(page: page, query: query, pageSize: pageSize)
  }
  
  public func getGame(id: Int) -> Observable<ResponseGame> {
    _repository.getGame(id: id)
  }
}
