# IOSSimulatorSafariLauncher

I found no way to open Safari on iPhone or iPad Simulator and open a specific URL via the command line.
That is why I created this tiny iOS app.

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

## Opening an URL in Safari on iPhone Simulator
```
ios-sim launch ~/tools/ios-sim-safari-launcher/IOSSimulatorSafariLauncher.app --family iphone --args http://google.com?q=It\ works\1
```

# Comfort
I like to have a shortcut function in my dotfiles

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

