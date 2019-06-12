import Flutter
import UIKit

public class SwiftMonoKitPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "mono_kit", binaryMessenger: registrar.messenger())
    let instance = SwiftMonoKitPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let method = call.method
    let info = method.split(separator: ("/"))
    let group = info[0]
    let path = info[1]
    let arguments = call.arguments! as! [String: String]
    switch group {
    case "info_plist":
        let key = arguments["key"]!
        switch path {
        case "read_string":
            let value = Bundle.main.object(forInfoDictionaryKey: key) as! String
            result(value)
        default:
            result(FlutterMethodNotImplemented)
        }

    default:
        result(FlutterMethodNotImplemented)
    }
  }
}
