import Foundation

#if !COCOAPODS
import Umbrella
#endif

open class MixpanelProvider: RuntimeProviderType {
  open let className: String = "Mixpanel"
  open let instanceSelectorName: String? = "sharedInstance"
  open let selectorName: String = "track:properties:"

  public init() {
  }
}
