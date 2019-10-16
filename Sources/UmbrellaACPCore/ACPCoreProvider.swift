import Foundation

#if !COCOAPODS
import Umbrella
#endif

open class ACPCoreProvider: RuntimeProviderType {
  public let className: String = "ACPCore"
  public let selectorName: String = "trackState:data:"

  public init() {
  }
}
