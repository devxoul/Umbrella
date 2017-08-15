public protocol AnalyticsType {
  associatedtype Event: EventType
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

final public class Analytics<Event: EventType>: AnalyticsType {
  private var providers: [ProviderType] = []

  public init() {
    // I'm Analytics 👋
  }

  public func register(provider: ProviderType) {
    self.providers.append(provider)
  }

  public func log(_ event: Event) {
    for provider in self.providers {
      guard let eventName = event.name(for: provider) else { continue }
      let parameters = event.parameters(for: provider)
      provider.log(eventName, parameters: parameters)
    }
  }
}
