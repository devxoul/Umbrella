import Foundation

#if !COCOAPODS
import Umbrella
#endif

open class AppboyProvider: RuntimeProviderType {
  public let className: String = "Appboy"
  public let instanceSelectorName: String? = "sharedInstance"
  public let selectorName: String = "logCustomEvent:withProperties:"

  public init() {
  }
}
