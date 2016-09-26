public enum StreamError : Error {
    case closedStream
    case timeout
}

public protocol WritableStream {
    var closed: Bool { get }
    func close()
    func write(_ data: Data, deadline: Double, completion: @escaping (Result<Void>) -> Void)
}

public protocol ReadableStream {
    var closed: Bool { get }
    func close()
    func read(upTo byteCount: Int, deadline: Double, completion: @escaping (Result<Data>) -> Void)
}

extension ReadableStream {
    public func resume() {}
    
    public func stop() {}

    public func read(upTo byteCount: Int, completion: @escaping (Result<Data>) -> Void) {
        read(upTo: byteCount, deadline: .never, completion: completion)
    }
}

extension WritableStream {
    public func write(_ data: Data, completion: @escaping (Result<Void>) -> Void = { _ in }) {
        write(data, deadline: .never, completion: completion)
    }
}

public typealias DuplexStream = WritableStream & ReadableStream
