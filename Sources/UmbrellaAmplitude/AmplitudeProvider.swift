import Foundation

#if !COCOAPODS
import Umbrella
#endif

open class AmplitudeProvider: RuntimeProviderType {
  public let className: String = "Amplitude"
  public let selectorName: String = "logEvent:withEventProperties:"

  public init() {
  }
}
