import Foundation

#if !COCOAPODS
import Umbrella
#endif

open class FirebaseProvider: RuntimeProviderType {
  open let className: String = "FIRAnalytics"
  open let selectorName: String = "logEventWithName:parameters:"

  public init() {
  }
}
