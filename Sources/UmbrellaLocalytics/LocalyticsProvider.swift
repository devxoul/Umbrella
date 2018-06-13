import Foundation

#if !COCOAPODS
import Umbrella
#endif

open class LocalyticsProvider: RuntimeProviderType {
  public let className: String = "Localytics"
  public let selectorName: String = "tagEvent:attributes:"

  public init() {
  }
}
