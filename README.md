
<p align="center">
   <img width="500" src="https://raw.githubusercontent.com/alberdev/ContentLoader/master/Images/header_ContentLoader.png" alt="ContentLoader  Logo">
</p>

<p align="center">
   <a href="https://cocoapods.org/pods/ContentLoader">
      <img src="https://img.shields.io/cocoapods/v/ContentLoader.svg?style=flat&colorB=fbb03b" alt="Version">
   </a>
   <!--
   <a href="https://github.com/Carthage/Carthage">
      <img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" alt="Carthage Compatible">
   </a>
   -->
   <a href="https://cocoapods.org/pods/ContentLoader">
      <img src="https://img.shields.io/cocoapods/l/ContentLoader.svg?style=flat)" alt="License">
   </a>
   <a href="https://developer.apple.com/swift/">
      <img src="https://img.shields.io/badge/Swift-5.0-blue.svg?style=flat&colorB=fbb03b" alt="Swift 5.0">
   </a>
   <a href="https://cocoapods.org/pods/ContentLoader">
      <img src="https://img.shields.io/cocoapods/p/ContentLoader.svg?style=flat&colorB=fbb03b" alt="Platform">
   </a>
   <!--
   <a href="https://alberdev.github.io/ContentLoader">
      <img src="https://github.com/alberdev/ContentLoader/blob/gh-pages/badge.svg" alt="Documentation">
   </a>
   -->
   <a href="https://twitter.com/alberdev/">
      <img src="https://img.shields.io/badge/Twitter-@alberdev-blue.svg?style=flat&colorB=fbb03b" alt="Twitter">
   </a>
   
</p>

<br/>

<p align="center">
   Display awesome animated placeholder loading to your content. Use your custom views to generate low-contrast blocks, with the same shapes, positions. Make beautiful animations using your own format as Slack, Instagram, or Facebook does. <b>ContentLoader</b> is written in Swift 5 with iOS customizable and easy to use.
</p>

<br/>

<p align="center" >
<img src="https://raw.githubusercontent.com/alberdev/ContentLoader/master/Images/video.gif" alt="ContentLoader" title="ContentLoader demo">
</p>

# ContentLoader

- [x] Awesome animations on loading
- [x] Totally customizable
- [x] Use it also in your own tables and collection views
- [x] Easy usage
- [x] Supports iOS, developed in Swift 5

## Table of Contents

- [Description](#description)
- [Example](#example)
- [Installation](#installation)
- [Usage](#usage)
    - [ContentLoader in your View](#contentloaderinyourview)
    - [Using Table or Collection views?](#usingtableorcollectionviews)
    - [Format](#format)
    - [Start and Stop Loading](#startandstoploading)
- [Animation Types](#animationtypes)
    - [Fade](#fade)
    - [Gradient](#gradient)
- [Apps using ContentLoader](#apps-using-contentloader)
- [Author](#author)
- [Contributing](#contributing)
- [License](#license)


## Installation

ContentLoader is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile and run `pod install`:

```ruby
pod 'ContentLoader'
```

Then you can import it when you need

```swift
import ContentLoader
```

## Usage

In the example you will see some custom content loaders that can be used in your project. Once you've installed the pod, follow next steps. It's really simple:

### ContentLoader in your View

Select one of your custom view controllers. Choose the views inside this viewcontroller where would like to make `Loadable` and set `isLoadable` view property to `true`. Those views will convert to loadable objects when ContentLoader is loading.  If you are using xibs / storyboards, you can see new editable `Is Loadable` property. 


<img src="https://github.com/alberdev/ContentLoader/blob/master/Images/screenshot_1.png?raw=true" alt="Screenshot 1" style="margin: auto" />

### Using Table or Collection views?

If you are using Table or Collection views, you can make the same with your cells. Make `Loadable` the views you want. Then, you must implement `ContentLoaderDataSource` to complete some data ContentLoader needs to draw loader objects. It's really simple:

```swift
extension TableViewController: ContentLoaderDataSource {

    /// Number of sections you would like to show in loader
    func numSections(in contentLoaderView: UIView) -> Int {
        return 1
    }

    /// Number of rows you would like to show in loader
    func contentLoaderView(_ contentLoaderView: UIView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    /// Cell reuse identifier you would like to use (ContenLoader will search loadable objects here!)
    func contentLoaderView(_ contentLoaderView: UIView, cellIdentifierForItemAt indexPath: IndexPath) -> String {
        return "MyCellReuseIdentifier"
    }
}
```


### Format

You can format `ContentLoader` with your own parameters. See default values:

```swift
var format = ContentLoaderFormat()

/// Loader objects color
format.color = UIColor.lightGray

/// Loader objects corner radius
format.radius = 5

/// Loader animation type
format.animation = .fade
```


### Start and Stop Loading

Simple ;)

```swift
view.startLoading()
// or
view.startLoading(format: format)
```

```swift
view.hideLoading()
```

In case of table or collection views

```swift
tableView.startLoading()
// or
tableView.startLoading(format: format)
```

```swift
tableView.hideLoading()
```


## Animation Types

### Fade

This type will make fade animation when content is loading

```swift
ContentLoaderAnimation.fade
```

### Gradient

This type will make gradient animation when content is loading (coming soon)

```swift
ContentLoaderAnimation.gradient(UIColor, UIColor)
```

>(Start color, End color)


## Apps using ContentLoader

If you use `ContentLoader` I'd love to hear about it and feature your app here!

<img src="Images/Apps/fashtime.png" width="50" height="50" valign="middle"> [FashTime](https://itunes.apple.com/app/fashtime-the-new-way/id1126538070?mt=8)

## Author

Alberto Aznar, info@alberdev.com
Based on [Skeleton View](https://github.com/Juanpe/SkeletonView) by Juanpe Catalán.

## Contributing

Feel free to collaborate with ideas 💭, issues ⁉️ and/or pull requests 🔃.

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

ContentLoader is available under the MIT license. See the LICENSE file for more info.

## Libraries by @alberdev

<a href="https://github.com/alberdev/AnimatedField"><img align="left" width="100" src="https://raw.githubusercontent.com/alberdev/ContentLoader/master/Images/Pods/AnimatedField.png" alt="AnimatedField  Logo" vspace="10"></a>
<a href="https://github.com/alberdev/ContentLoader"><img align="left" width="100" src="https://raw.githubusercontent.com/alberdev/ContentLoader/master/Images/Pods/ContentLoader.png" alt="ContentLoader  Logo" vspace="10"></a>
<a href="https://github.com/alberdev/CiaoTransitions"><img align="left" width="100" src="https://raw.githubusercontent.com/alberdev/ContentLoader/master/Images/Pods/CiaoTransitions.png" alt="CiaoTransitions  Logo" vspace="10"></a>
<a href="https://github.com/alberdev/DateScrollPicker"><img align="left" width="100" src="https://raw.githubusercontent.com/alberdev/ContentLoader/master/Images/Pods/DateScrollPicker.png" alt="DateScrollPicker  Logo" vspace="10"></a>
<a href="https://github.com/alberdev/EmptyStateKit"><img align="left" width="100" src="https://raw.githubusercontent.com/alberdev/ContentLoader/master/Images/Pods/EmptyStateKit.png" alt="EmptyStateKit  Logo" vspace="10"></a>
<a href="https://github.com/alberdev/GridTimerView"><img align="left" width="100" src="https://raw.githubusercontent.com/alberdev/ContentLoader/master/Images/Pods/GridTimerView.png" alt="GridTimerView  Logo" vspace="10"></a>
<a href="https://github.com/alberdev/PaintCodeKit"><img align="left" width="100" src="https://raw.githubusercontent.com/alberdev/ContentLoader/master/Images/Pods/PaintCodeKit.png" alt="PaintCodeKit  Logo" vspace="10"></a>
