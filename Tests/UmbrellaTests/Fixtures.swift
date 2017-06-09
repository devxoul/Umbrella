import Umbrella

enum TestEvent: EventType {
  case login(username: String)
  case purchase(productID: Int, price: Float)

  func name(for provider: ProviderType) -> String? {
    switch self {
    case .login:
      switch provider {
      case is MockFabricProvider:
        return "Login"
      default:
        return "login"
      }

    case .purchase:
      switch provider {
      case is MockFabricProvider:
        return nil
      default:
        return "purchase"
      }
    }
  }

  func parameters(for provider: ProviderType) -> [String : Any]? {
    switch self {
    case let .login(username):
      switch provider {
      case is MockFabricProvider:
        return ["Username": username]
      default:
        return ["username": username]
      }

    case let .purchase(productID, price):
      switch provider {
      case is MockFabricProvider:
        return nil
      default:
        return ["product_id": productID, "price": price]
      }
    }
  }
}

class MockProvider: ProviderType {
  var events: [(name: String, parameters: [String: Any]?)] = []

  func log(_ eventName: String, parameters: [String: Any]?) {
    self.events.append((name: eventName, parameters: parameters))
  }
}

final class MockFirebaseProvider: MockProvider {
}

final class MockFabricProvider: MockProvider {
}
