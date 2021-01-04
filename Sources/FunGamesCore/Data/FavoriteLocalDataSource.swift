//
//  File.swift
//  
//
//  Created by Ludin Nento on 02/01/21.
//

import Foundation
import RxSwift

public protocol FavoriteLocalDataSource {
  associatedtype Request
  associatedtype Response
  
  func list(request: Request?) -> Observable<[Response]>
  func add(entity: Response) -> Observable<Bool>
  func get(id: Int) -> Observable<Response>
  func delete(id: Int) -> Observable<Bool>
}
