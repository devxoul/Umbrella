import Foundation

#if !COCOAPODS
import Umbrella
#endif

open class FlurryProvider: RuntimeProviderType {
  public let className: String = "Flurry"
  public let selectorName: String = "logEvent:withParameters:"

  public init() {
  }
}
