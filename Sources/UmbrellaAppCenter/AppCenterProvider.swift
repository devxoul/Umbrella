import Foundation

#if !COCOAPODS
import Umbrella
#endif

open class AppCenterProvider: RuntimeProviderType {
  public typealias Parameters = [String: String]
  
  public let className: String = "MSACAnalytics"
  public let selectorName: String = "trackEvent:withProperties:"

  public init() {
  }
  
  public func mapParameters(_ parameters: [String : Any]) -> Parameters? {
    return parameters.mapValues(String.init(describing:))
  }
}
