# SpotImStandaloneAds

## Requirements
 * iOS >= 12.0
 * Google Ad Manager integration:
    https://developers.google.com/ad-manager/mobile-ads-sdk/ios/quick-start


## Installation

SpotImStandaloneAds is available through [CocoaPods](https://cocoapods.org). To install
it, add the following line to your Podfile:

```ruby
target 'YourApp' do
  pod 'SpotImStandaloneAds'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|

      if target.name == 'RxSwift'
        # fixes: "Undefined symbols", "Symbol not found" errors for RxSwift
        config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
      end
    end
  end
end
```

## Usage example

AppDelegate.swift
```java
import SpotImStandaloneAds

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        ...
        SpotImAds.initSDK(
            spotId: "", // replace with your Spotim ID
            storeURL: URL(string: "https://apps.apple.com/us/app/spotim-sample-app/id1234")! // Replace with your real storeURL
        )
        return true
    }
```

YourViewController.swift
```java
import SpotImStandaloneAds

class YourViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let child = SpotImAds.makePlacement(row: 1, column: 1) // check the exact (row, column) with OpenWeb
        addChild(child)
        child.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(child.view)
        NSLayoutConstraint.activate([
            child.view.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            child.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            child.view.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        child.didMove(toParent: self)
    }
}
```
## Sample project
https://github.com/Aniview/spotim-sdk-ios-pods/tree/main/SpotImAdsSample

## Author

https://aniview.com/
https://www.openweb.com/

## License

All rights reserved to OpenWeb
