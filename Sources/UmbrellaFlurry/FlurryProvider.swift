import Foundation

#if !COCOAPODS
import Umbrella
#endif

open class FlurryProvider: RuntimeProviderType {
  open let className: String = "Flurry"
  open let selectorName: String = "logEvent:withParameters:"

  public init() {
  }
}
