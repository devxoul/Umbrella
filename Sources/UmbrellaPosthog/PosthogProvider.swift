import Foundation

#if !COCOAPODS
import Umbrella
#endif

open class PosthogProvider: RuntimeProviderType {
  public let className: String = "PHGPostHog"
  public let instanceSelectorName: String? = "sharedPostHog"
  public let selectorName: String = "capture:properties:"

  public init() {
  }
}
