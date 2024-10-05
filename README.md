# ExAddingAndRemovingViews
![apple and dd Logo](https://nick-rodriguez.info/media/appleAndDD.png)
This is a simple Swift application that demonstrates how to programmatically add and remove views in a UIViewController using NSLayoutConstraint and view.removeFromSuperview().

- for a more practical approach with many UIViews and UIScrollView see: [https://github.com/costa-rica/ExAddingAndRemovingViews02](https://github.com/costa-rica/ExAddingAndRemovingViews02)

## Features

- Programmatically adds and removes views from a UIViewController using NSLayoutConstraint and view.removeFromSuperview()
- Uses UISwitches to toggle the visibility of views

## Purpose

The purpose of this application is to serve as a learning resource to programmatically add and remove views in a UIViewController. By demonstrating how to use NSLayoutConstraint and view.removeFromSuperview() triggered by UISwitches to toggle the visibility of views.

## Usage

To use this application, simply clone the repository and open the project in Xcode. Run the application on a simulator or a physical device to see the views being added and removed using NSLayoutConstraint and view.removeFromSuperview(), and to toggle their visibility using UISwitches.

## Deleting Main.storyboard steps

Do this to build your application completely programmatically. I do this so I can more easily get help from ChatGPT and other AI sources.

- create new project go to Info
- delete the `Main storyboard file base name` row
- In the same Info go to Application Scene Manifest > Scene Configuration > Window Application Session Role > Item 0
    - delete `Storyboard Name` row
- Edit the `SceneDelegate` method to display the `MainVC`

The last bullet point is necessary for building the app completely programmatically, as it allows you to set the root view controller of the window to be the `MainVC` without relying on a storyboard. This allows you to create and manage all of the views and layout of the app programmatically, rather than using a visual interface builder.

