# SHNDStuffs

[![CI Status](https://img.shields.io/travis/sahandraeisi1994@gmail.com/SHNDStuffs.svg?style=flat)](https://travis-ci.org/sahandraeisi1994@gmail.com/SHNDStuffs)
[![Version](https://img.shields.io/cocoapods/v/SHNDStuffs.svg?style=flat)](https://cocoapods.org/pods/SHNDStuffs)
[![License](https://img.shields.io/cocoapods/l/SHNDStuffs.svg?style=flat)](https://cocoapods.org/pods/SHNDStuffs)
[![Platform](https://img.shields.io/cocoapods/p/SHNDStuffs.svg?style=flat)](https://cocoapods.org/pods/SHNDStuffs)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


For using SHNDView, SHNDButton, SHNDImageView just put one of these classes into subclass of your objects, and that's set... you have AWESOME features in your NavigationInspector

![example 1](https://user-images.githubusercontent.com/34839080/50151764-14b2d800-02d7-11e9-8e1f-f8e098312ab8.png)

# UINavigationBar Gradient

for set UINavigationBar gradient and it's tintColor use the function below in viewDidLoad():
```Swift
override func viewDidLoad() {
        super.viewDidLoad()
        
        SHNDNavigationBarGradient(leftColor: .darkGray,
                                  rightColor: .white,
                                  tintColor: .black,
                                  isHorizontal: true  
    }
```
![example 0](https://user-images.githubusercontent.com/34839080/50152348-a0793400-02d8-11e9-87e8-1691413827fe.png) ,
![example 3](https://user-images.githubusercontent.com/34839080/50155445-4f217280-02e1-11e9-83b7-fb2955ec2f00.png), ![example 4](https://user-images.githubusercontent.com/34839080/50155449-55175380-02e1-11e9-92ba-baabf922fd99.png)

## Requirements
Swift 4.0 or later
## Installation

SHNDStuffs is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SHNDStuffs'
```

## Author

sahandraeisi1994@gmail.com, sahandraeisi@yahoo.com

## License

SHNDStuffs is available under the MIT license. See the LICENSE file for more info.
