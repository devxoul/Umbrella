import Foundation

#if !COCOAPODS
import Umbrella
#endif

open class MixpanelProvider: RuntimeProviderType {
  public let className: String = "Mixpanel"
  public let instanceSelectorName: String? = "sharedInstance"
  public let selectorName: String = "track:properties:"

  public init() {
  }
}
