//
//  URLSessionNetworkManager.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import RxSwift
import RxCocoa

final class URLSessionNetworkManager: NetworkManager {

    let session = URLSession.shared

    private var lastTask: URLSessionDataTask?

    private func onSuccess<T: Decodable>(
        _ type: T.Type,
        _ respData: Data?,
        _ httpResponse: HTTPURLResponse,
        single : @escaping (SingleEvent<T>) -> Void
    ) {
        guard let respData = respData else {
            return single(.failure(NetworkError.noResponse))
        }
        do {
            let decoder = JSONDecoder()
            let subject = try decoder.decode(T.self, from: respData)
            single(.success(subject))
        } catch {
            single(.failure(error))
        }
    }

    private func onFail<T: Decodable>(
        _ error: Error,
        _ httpResponse: HTTPURLResponse,
        single: @escaping (SingleEvent<T>) -> Void
    ) {
        single(.failure(error))
    }

    func defaultDataTask<T: Decodable>(
        withRouter router: Router,
        forType type: T.Type
    ) -> Single<T> {
        return Single<T>.create {[weak self] single in
            guard let self = self else {
                DispatchQueue.main.async {
                    single(.failure(AppError.weakSelfDeallocated("NetworkManager")))
                }
                return Disposables.create()}
            let request: URLRequest
            do {
                request = try router.makeRequest()
            } catch let error {
                DispatchQueue.main.async {
                    single(.failure(error))
                }
                return Disposables.create()
            }
            let task = self.session.dataTask(with: request) {[weak self] (data: Data?, response: URLResponse?, error: Error?) in
                if let error = error {
                    DispatchQueue.main.async {
                        
                        single(.failure(NetworkError(rawValue: (error as NSError).code)))
                    }
                }
                if let httpResponse = response as? HTTPURLResponse {
                    switch httpResponse.statusCode {
                    case ResponseCode.httpOK.rawValue, ResponseCode.httpCreated.rawValue:
                        DispatchQueue.main.async {
                            self?.onSuccess(T.self, data, httpResponse, single: single)
                        }
                    default:
                        DispatchQueue.main.async {
                            single(.failure(NetworkError(rawValue: httpResponse.statusCode)))
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        single(.failure(NetworkError.noResponse))
                    }
                }
            }
            self.lastTask = task
            task.resume()
            return Disposables.create(with: task.cancel)
        }
    }

    func cancelLastTask() {
        self.lastTask?.cancel()
    }
}

