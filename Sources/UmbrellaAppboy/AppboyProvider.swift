import Foundation

#if !COCOAPODS
import Umbrella
#endif

open class AppboyProvider: RuntimeProviderType {
  open let className: String = "Appboy"
  open let instanceSelectorName: String? = "sharedInstance"
  open let selectorName: String = "logCustomEvent:withProperties:"

  public init() {
  }
}
