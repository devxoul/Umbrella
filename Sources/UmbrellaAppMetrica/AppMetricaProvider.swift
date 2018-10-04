import Foundation

#if !COCOAPODS
import Umbrella
#endif

open class AppMetricaProvider: RuntimeProviderType {

  public let className: String = "YMMYandexMetrica"
  public let selectorName: String = "reportEvent:parameters:"
    
  public init() {
  }
}
