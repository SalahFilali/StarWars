# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

def reactive_pods
  pod 'RxSwift', '6.2.0'
  pod 'RxCocoa', '6.2.0'
end

def swift_gen
  pod 'SwiftGen', '6.5.1'
end

target 'StarWars' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  reactive_pods
  swift_gen

  target 'StarWarsTests' do
    inherit! :search_paths
  end

  target 'StarWarsUITests' do
    inherit! :search_paths
  end

end
