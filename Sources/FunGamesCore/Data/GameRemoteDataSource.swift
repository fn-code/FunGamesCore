//
//  File.swift
//  
//
//  Created by Ludin Nento on 02/01/21.
//

import Foundation
import RxSwift

public protocol GameRemoteDataSource {
  associatedtype Request
  associatedtype Response
  
  func list(page: Int, query: String, page_size: Int) -> Observable<[Response]>
  func get(id: Int) -> Observable<Response>
}
