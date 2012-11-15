# IOSSimulatorSafariLauncher

I found no way to open Safari on iPhone or iPad Simulator and open a specific URL via the command line.
That is why I created this tiny iOS app.
You can launch this app (e.g. via ios-sim) and pass an URL as argument to it. The app then open Safari by calling `[[UIApplication sharedApplication] openURL:url];`.

Please let me know, if you've found an easier method.

## Installation (OS X)
1. Install [ios-sim](https://github.com/phonegap/ios-sim)
```
brew install ios-sim
```

2. get the tiny ios app (compiled for iPhone and iPad Simulator 6.0)
```
mkdir -p ~/tools/ios-sim-safari-launcher
curl https://raw.github.com/rockitbaby/IOSSimulatorSafariLauncher/master/build/Debug-iphonesimulator/IOSSimulatorSafariLauncher.app.zip > ~/tools/ios-sim-safari-launcher/IOSSimulatorSafariLauncher.app.zip
open ~/tools/ios-sim-safari-launcher/IOSSimulatorSafariLauncher.app.zip
```

## Usage

Opening an URL in Safari on iPad Simulator via the command line
```
ios-sim launch ~/tools/ios-sim-safari-launcher/IOSSimulatorSafariLauncher.app --family ipad --args http://google.com?q=Yeah%21%20It%20works%21
```

Opening an URL in Safari on iPhone Simulator via the command line
```
ios-sim launch ~/tools/ios-sim-safari-launcher/IOSSimulatorSafariLauncher.app --family iphone --args http://iphonedevwiki.net/index.php/QuartzCore.framework
```

# For your Comfort
I like to have a shortcut function in my [dotfiles](https://github.com/rockitbaby/dotfiles) - see .functions

```
# functions to open an url in safari on ios simulator
# deps:
# - http://github.com/phonegap/ios-sim
# - http://github.com/rockitbaby/IOSSimulatorSafariLauncher
function ipad-safari() {
  ios-sim launch ~/tools/ios-sim-safari-launcher/SafariLauncherIphoneSim.app --family ipad --args $1
}

function iphone-safari() {
  ios-sim launch ~/tools/ios-sim-safari-launcher/SafariLauncherIphoneSim.app --family iphone --args $1
}

function ipad-safari-log-memory() {
  export CA_LOG_MEMORY_USAGE=1
  open /Applications/Utilities/Console.app
  ipad-safari $1
}

function iphone-safari-log-memory() {
  export CA_LOG_MEMORY_USAGE=1
  open /Applications/Utilities/Console.app
  iphone-safari $1
}
```

