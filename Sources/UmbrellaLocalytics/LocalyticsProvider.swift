import Foundation

#if !COCOAPODS
import Umbrella
#endif

open class LocalyticsProvider: RuntimeProviderType {
  open let className: String = "Localytics"
  open let selectorName: String = "tagEvent:attributes:"

  public init() {
  }
}
