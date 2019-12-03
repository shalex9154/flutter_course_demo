import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let batteryChannel = FlutterMethodChannel(name: "samples.flutter.dev/battery",
                                              binaryMessenger: controller.binaryMessenger)
    batteryChannel.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      guard call.method == "getBatteryLevel" else {
        result(FlutterMethodNotImplemented)
        return
      }
      self?.receiveBatteryLevel(result: result)
    })

    let viewFactory = TestViewFactory()
    registrar(forPlugin: "Runner").register(viewFactory, withId: "TestView")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

private func receiveBatteryLevel(result: FlutterResult) {
  let device = UIDevice.current
  device.isBatteryMonitoringEnabled = true
  if device.batteryState == UIDevice.BatteryState.unknown {
    result(FlutterError(code: "UNAVAILABLE",
                        message: "Battery info unavailable",
                        details: nil))
  } else {
    result(Int(device.batteryLevel * 100))
  }
}

public class TestViewFactory: NSObject, FlutterPlatformViewFactory {
  public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
    return TestView(frame: frame, viewId: viewId, args: args)
  }
}

public class TestView: NSObject, FlutterPlatformView {
  let frame: CGRect
  let viewId: Int64

  init(frame: CGRect, viewId: Int64, args: Any?) {
    self.frame = frame
    self.viewId = viewId
  }

  public func view() -> UIView {
    let view = UIView(frame: frame)
    view.backgroundColor = .red
    return view
  }

}



