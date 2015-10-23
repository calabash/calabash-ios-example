| master  |  [license](LICENSE) |
|---------|---------------------|
|[![Build Status](https://travis-ci.org/calabash/calabash-ios-example.svg?branch=master)](https://travis-ci.org/calabash/calabash-ios-example)| [![License](https://img.shields.io/badge/licence-MIT-blue.svg)](http://opensource.org/licenses/MIT)|

## LPSimpleExample

This project demonstrates how to integrate Calabash into an existing Xcode
project and provides an introduction to UI testing with Calabash.

If you have any trouble building the app on the command line, please see
the **xcpretty** and **Code Signing** sections for debugging tips.

### Requirements

* MacOS 10.10 or 10.11
* Xcode 6 or 7
* iOS Devices >= 7.1
* iOS Simulators >= 8.0
* ruby >= 2.0 (latest is preferred)

We recommend a managed ruby environment like rbenv or rvm.  If you are
installing gems with sudo, please see our [guide on why you should stop](https://github.com/calabash/calabash-ios/wiki/Best-Practice:--Never-install-gems-with-sudo).

Bundler needs to be installed.

```
$ gem install bundler
```

### Step 1: Install calabash.framework

You can find complete tutorials on the [Tutorial: How to add Calabash to
Xcode](https://github.com/calabash/calabash-ios/wiki/Tutorial%3A-How-to-add-Calabash-to-Xcode)
page of the Calabash iOS wiki.  To get started quickly, we'll use the
_Debug Config_ approach.

```
# Install the necessary gems
$ bundle update

# Make sure you can build the app
$ make app

# Download the last calabash.framework
$ bundle exec calabash-ios download
```

Open Xcode and update the Linker Flags for the Debug Configuration.

![alt text](https://cloud.githubusercontent.com/assets/466104/10670656/c9c97312-78e6-11e5-8214-750a47a065eb.png "Link calabash.framework)

These are the linker flags:

```
-ObjC -force_load "$(SOURCE_ROOT)/calabash.framework/calabash" -framework CFNetwork
```

Try to build and run on an iOS Simulator from Xcode   In the Console you should see
output like this:

```
DEBUG CalabashServer:222 | Creating the server: <LPHTTPServer: 0x7fe97a507ef0>
DEBUG CalabashServer:223 | Calabash iOS server version: CALABASH VERSION: 0.16.4
```

### Step 2: Run cucumber

```
# Generate a features dir
$ bundle exec calabash-ios gen

# Tell Calabash where your app is
$ export APP=Products/app/LPSimpleExample.app

# Try running cucumber
$ bundle exec cucumber
```

### Step 3: Open a console

```
# The console is a ruby irb
$ bundle exec calabash-ios console

# Launch the app with Calabash.
> start_test_server_in_background

# Type some text
> query("* marked:'Name'")
> touch("* marked:'Name'")
> keyboard_enter_text("Hello!")
```

### Where to go from here?

| Topic | Description |
|-------|-------------|
| [Getting Started](https://github.com/calabash/calabash-ios/wiki/Getting-Started) | A more in-depth using this app. |
| [Testing on Physical Devices](https://github.com/calabash/calabash-ios/wiki/Testing-on-Physical-Devices) | Everything you need to know about testing on physical devices. |
| [API Docs](http://calabashapi.xamarin.com/ios) | The Calabash iOS ruby API |
| [iOS Smoke Test App](https://github.com/calabash/ios-smoke-test-app) | Demonstrates advanced features, setups, and workflows|
| [iOS WebView Test App](https://github.com/calabash/ios-webview-test-app) | Demonstrates how to interact with UIWebView and WKWebView|
| [Getting Help](https://github.com/calabash/calabash-ios/wiki) | The Calabash iOS Wiki |

## Troubleshooting

### xcpretty

https://github.com/supermarin/xcpretty

We use xcpretty to make builds faster and to reduce the amount of
logging.  Travis CI, for example, has a limit on the number of lines of
logging that can be generated; xcodebuild breaks this limit.

The only problem with xcpretty is that it does not report build errors
very well.  If you encounter an issue with any of the make rules, run
without xcpretty:

```
$ XCPRETTY=0 make ipa
```

### Code Signing

If you have multiple code signing identities, you might need to set the
`CODE_SIGN_IDENTITY` variable for the make scripts.  If you are running
with xcpretty, you might see output like this:

```
$ make ipa
** INSTALL FAILED **

The following build commands failed:
        PhaseScriptExecution Run\ Script\ Add\ Calabash\ dylibs\ to\
Bundle
<snip>/Debug-iphoneos/CalSmoke.build/Script-F51F2E8E1AB359A6002326D0.sh
```

Try again without xpretty to reveal the problem:

```
$ XCPRETTY=0 make ipa
iPhone Developer: ambiguous (matches "iPhone Developer: Some Developer
(89543FK9SZ)" and "iPhone Developer: Some Other Developer (7QJQJFT49Q)"
Command /bin/sh failed with exit code 1

** INSTALL FAILED **
```

Fix this problem by telling Xcode which identity to use:

```
$ export CODE_SIGN_IDENTITY="iPhone Developer: Joshua Moody (7QJQJFT49Q)"
$ make ipa
```

