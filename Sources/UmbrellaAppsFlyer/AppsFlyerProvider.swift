import Foundation

#if !COCOAPODS
import Umbrella
#endif

open class AppsFlyerProvider: RuntimeProviderType {
  open let className: String = "AppsFlyerTracker"
  open let instanceSelectorName: String? = "sharedTracker"
  open let selectorName: String = "trackEvent:withValues:"

  public init() {
  }
}
