require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-screenshot-detector"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
                  react-native-screenshot-detector
                   DESC
  s.homepage     = "https://github.com/github_account/react-native-screenshot-detector"
  s.license      = "MIT"
  # s.license    = { :type => "MIT", :file => "FILE_LICENSE" }
  s.authors      = { "huutho" => "huu.tho.ns@gmail.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/github_account/react-native-screenshot-detector.git", :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,m,swift}"
  s.requires_arc = true

  s.dependency "React"
	
  # s.dependency "..."
end

