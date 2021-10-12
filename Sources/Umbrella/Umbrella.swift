public protocol AnalyticsType {
    associatedtype Event: EventType
    var acceptedProviders: [ProviderType]? { get set }
    func register(provider: ProviderType)
    func log(_ event: Event)
}

public protocol ProviderType {
    func log(_ eventName: String, parameters: [String: Any]?)
}

public protocol EventType {
    func name(for provider: ProviderType) -> String?
    func parameters(for provider: ProviderType) -> [String: Any]?
}
open class Analytics<Event: EventType>: AnalyticsType {
    private(set) open var providers: [ProviderType] = [] {
        didSet{
            self.acceptedProviders = providers
        }
    }
    /// leave nil if you need to accept all providers
    public var acceptedProviders: [ProviderType]?

    public init() {
        // I'm Analytics 👋
    }

    open func register(provider: ProviderType) {
        self.providers.append(provider)
    }

    open func log(_ event: Event) {
        let acceptedProviders = self.acceptedProviders ?? self.providers
        for provider in acceptedProviders {
            guard let eventName = event.name(for: provider) else { continue }
            let parameters = event.parameters(for: provider)
            provider.log(eventName, parameters: parameters)
        }
    }
}
