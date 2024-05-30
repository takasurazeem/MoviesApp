
import Foundation

enum NetworkError: Error {
    case badURL
    case decodingError
    case noData
}

class Webservice {
    
    func getMoviesBy(search: String) async throws -> [Movie] {
        guard let moviesUrl = URL(string: Constants.Urls.urlBySearch(search: search)) else { throw NetworkError.badURL }
        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with: moviesUrl) { data, response, error in
                guard let data, error == nil else {
                    continuation.resume(throwing: NetworkError.noData)
                    return
                }
                do {
                    let moviesResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                    continuation.resume(returning: moviesResponse.movies)
                } catch {
                    continuation.resume(throwing: NetworkError.decodingError)
                }
            }.resume()
        }
    }
    
}
