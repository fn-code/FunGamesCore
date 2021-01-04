//
//  File.swift
//  
//
//  Created by Ludin Nento on 03/01/21.
//

import RxSwift
import RxCocoa

public class GetGamePresenter<RequestFavorite, ResponseFavorite, ResponseGame, Interactor: GameUseCase>
where
  Interactor.RequestFavorite == RequestFavorite,
  Interactor.ResponseFavorite == ResponseFavorite,
  Interactor.ResponseGame == ResponseGame {
  
  private let disposeBag = DisposeBag()
  
  public var games = BehaviorRelay<[ResponseGame]>(value: [])
  public var loadingState = PublishSubject<Bool>()
  public var error = PublishSubject<String>()
  
  public var gamesPopular = BehaviorRelay<[ResponseGame]>(value: [])
  public var loadingGamesPopularState = PublishSubject<Bool>()
  public var errorGamesPopular = PublishSubject<String>()
  
  public var favorite = BehaviorRelay<ResponseFavorite?>(value: nil)
  public var favoriteGetComplete = PublishSubject<Void>()
  public var addFavoriteState = PublishRelay<Bool>()
  
  public var favorites = BehaviorRelay<[ResponseFavorite]>(value: [])
  public var loadingFavoritesState = PublishSubject<Bool>()
  public var errorFavorites = PublishSubject<String>()
  
  public var deleteFavoriteState = PublishRelay<Bool>()
  
  public var game = PublishRelay<ResponseGame>()
  
  private let _useCase: Interactor
  public init(useCase: Interactor) {
    _useCase = useCase
  }
  
  
  public func getAllGames(page: Int, query: String, pageSize: Int) {
    self.loadingState.onNext(true)
    _useCase.getGames(page: page, query: query, pageSize: pageSize)
      .subscribe { result in
        self.games.accept(result)
      } onError: { (err) in
        self.error.onNext(err.localizedDescription)
      } onCompleted: {
        self.loadingState.onNext(false)
      }.disposed(by: disposeBag)
  }
  
  public func getHomePopular() {
    self.loadingGamesPopularState.onNext(true)
    _useCase.getGames(page: 1, query: "", pageSize: 20)
      .subscribe { result in
        self.gamesPopular.accept(result)
      } onError: { (err) in
        self.errorGamesPopular.onNext(err.localizedDescription)
      } onCompleted: {
        self.loadingGamesPopularState.onNext(false)
      }.disposed(by: disposeBag)
  }
  
  public func getGame(id: Int) {
    _useCase.getGame(id: id)
      .asObservable()
      .subscribe(onNext: { [weak self] result in
        self?.game.accept(result)
      })
      .disposed(by: disposeBag)
    
  }
  
  public func addFavorite(request: RequestFavorite) {
    _useCase.addFavorite(request: request)
      .subscribe(onNext: { [weak self] result in
        self?.addFavoriteState.accept(result)
      })
      .disposed(by: disposeBag)
  }
  
  public func getFavorite(id: Int) {
    _useCase.getFavorite(id: id)
      .subscribe { result in
        self.favorite.accept(result)
      } onCompleted: {
        self.favoriteGetComplete.onNext(())
        self.favoriteGetComplete.onCompleted()
      }
      .disposed(by: disposeBag)
  }
  
  public func getAllFavorite() {
    self.loadingFavoritesState.onNext(true)
    _useCase.getFavorites()
      .subscribe{ (result) in
        self.favorites.accept(result)
      } onError: { (error) in
        self.errorFavorites.onNext(error.localizedDescription)
      } onCompleted: {
        self.loadingFavoritesState.onNext(false)
      }
      .disposed(by: disposeBag)
    
  }
  
  public func deleteFavorite(id: Int) {
    _useCase.deleteFavorite(id: id)
      .subscribe(onNext: { [weak self] result in
        self?.deleteFavoriteState.accept(result)
      })
      .disposed(by: disposeBag)
  }
  
}
