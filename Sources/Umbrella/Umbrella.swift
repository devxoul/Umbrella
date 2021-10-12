public protocol AnalyticsType {
    associatedtype Event: EventType
    func register(provider: ProviderType)
    func log(_ event: Event)
    func log(_ event: Event, into provider: ProviderType)
}

public protocol ProviderType {
    var manualLogOnly: Bool? { get set }
    func log(_ eventName: String, parameters: [String: Any]?)
}

public protocol EventType {
    func name(for provider: ProviderType) -> String?
    func parameters(for provider: ProviderType) -> [String: Any]?
}
open class Analytics<Event: EventType>: AnalyticsType {
    private(set) open var providers: [ProviderType] = []

    public init() {
        // I'm Analytics 👋
    }

    open func register(provider: ProviderType) {
        self.providers.append(provider)
    }

    open func log(_ event: Event) {
        for provider in self.providers {
            guard provider.manualLogOnly == false else { return }
            guard let eventName = event.name(for: provider) else { continue }
            let parameters = event.parameters(for: provider)
            provider.log(eventName, parameters: parameters)
        }
    }
    open func log(_ event: Event, into provider: ProviderType){
        guard let eventName = event.name(for: provider) else { return }
        let parameters = event.parameters(for: provider)
        provider.log(eventName, parameters: parameters)
    }
}
