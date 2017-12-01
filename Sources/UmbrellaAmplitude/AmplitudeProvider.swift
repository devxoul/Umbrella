import Foundation

#if !COCOAPODS
import Umbrella
#endif

open class AmplitudeProvider: RuntimeProviderType {
  open let className: String = "Amplitude"
  open let selectorName: String = "logEvent:withEventProperties:"

  public init() {
  }
}
