import Foundation

#if !COCOAPODS
import Umbrella
#endif

open class SegmentProvider: RuntimeProviderType {
  public let className: String = "SEGAnalytics"
  public let instanceSelectorName: String? = "sharedAnalytics"
  public let selectorName: String = "track:properties:"

  public init() {
  }
}
