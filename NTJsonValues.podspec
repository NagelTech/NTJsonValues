Pod::Spec.new do |s|
  s.name         = "NTJsonValues"
  s.version      = "1.00"
  s.summary      = "NTJsonValues - A NSDictionary Category to aid parsing JSON values."
  s.homepage     = "https://github.com/NagelTech/NTJsonValues"
  s.license      = { :type => 'MIT', :file => 'license.txt' }
  s.author       = { "Ethan Nagel" => "eanagel@gmail.com" }
  s.platform     = :ios, '6.0'
  s.source       = { :git => "https://github.com/NagelTech/NTJsonValues", :tag => "1.00" }
  s.requires_arc = true
  s.source_files = '*.h,m'
end
