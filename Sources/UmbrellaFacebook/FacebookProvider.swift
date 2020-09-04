import Foundation

#if !COCOAPODS
import Umbrella
#endif

open class FacebookProvider: RuntimeProviderType {
  public let className: String = "FBSDKAppEvents"
  public let selectorName: String = "logEvent:parameters:"

  public init() {
  }
}
