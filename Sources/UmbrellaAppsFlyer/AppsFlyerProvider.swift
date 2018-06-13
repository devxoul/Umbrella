import Foundation

#if !COCOAPODS
import Umbrella
#endif

open class AppsFlyerProvider: RuntimeProviderType {
  public let className: String = "AppsFlyerTracker"
  public let instanceSelectorName: String? = "sharedTracker"
  public let selectorName: String = "trackEvent:withValues:"

  public init() {
  }
}
