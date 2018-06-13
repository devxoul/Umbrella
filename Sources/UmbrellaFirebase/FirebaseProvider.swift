import Foundation

#if !COCOAPODS
import Umbrella
#endif

open class FirebaseProvider: RuntimeProviderType {
  public let className: String = "FIRAnalytics"
  public let selectorName: String = "logEventWithName:parameters:"

  public init() {
  }
}
