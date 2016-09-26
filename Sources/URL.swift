@_exported import struct Foundation.URL
@_exported import struct Foundation.URLQueryItem
import struct Foundation.URLComponents

public enum URLError : Error {
    case invalidURL
}

extension URL {
    public var queryItems: [URLQueryItem] {
        return URLComponents(url: self, resolvingAgainstBaseURL: false)?.queryItems ?? []
    }
}
