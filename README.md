# Star Wars App

An iOS project providing informations about the Star Wars movies 

> ### To run this project you will need to have XCode 12 or later and cocoapods installed.

----------

## Contents

* [Getting started](#getting-started)
    * [Installation](#installation)
* [Code overview](#code-overview)
    * [Folders](#folders)
* [Documentation](#documentation)

* [Personal choices](#Personal-choices)
----------

# Getting started

## Installation

Switch to the repo folder

    cd StarWars-iOS

Install all the dependencies using cocoapods

    pod install

And now you're ready to go!
You can start by opening the project workspace `StarWars.xcworkspace`

----------

# Code overview

## Folders

- `Configuration Files` - Contains all configuration files like .plist, AppConfig,...
- `Base` - Contains all base classes.
- `DI` - Contains all the dependencies containers.
  responses
- `Data Layer` - Contains all the Data layer related classes.
- `UI Layer` - Contains all user interfaces and UI related class.
- `Global` - Contains all classes used globally inside the project.
- `Resources` - Contains all resources files.
- `storage/data` - Contains the app's data

## Environment

- You can easily switch between Dev and Prod environments by simply selecting the needed scheme.

***Note*** : if needed you can update any environment variable directly in the `Configuration Files/AppConfig/AppConfig.plist` file.

----------

# Personal choices

## MVVM

The MVVM pattern allows separating the View layer from the logic. This separation will make projects more clean, more maintainable and unit testing friendly while also reducing the amount of code we have to write to connect the view with the model

## Repository pattern

The use of this pattern makes the code more maintainable and testable, it also helps keep the code organised and avoiding
duplication, as database queries and WS call are kept in one place. While this benefit is not immediately apparent in small
projects, it becomes more observable in large-scale projects which have to be maintained for many years.

## Dependencies Injection

By using dependencies Injection(DI) we make the code loosly coupled, easier to test and more maintainable since all our object will no longer need to resolve their dependencies instead all those dependencies will be instead injected at instantiation. 


## SwiftGen

SwiftGen bring type safety and compilation-time checking of all resources. There are many benefits for this, it:
- Reduces the risk of misspelling.
- Prevents unnecessary duplication of resources.
- Provides resource checking at compilation time.
- Helps when cleaning up old resources.
- And more!

## RxSwift

The use of RxSwift make asynchronous development much easier and cleaner and the decision to use RxSwift over others reactive libraries is due to its perfect compatibility with the MVVM template, its performance, the large set of Operators provided and UI Binding layer provided by RxCocoa
