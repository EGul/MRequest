Pod::Spec.new do |s|
  s.name         = "MRequest"
  s.version      = "0.0.1"
  s.summary      = "minimalist request library"
  s.homepage     = "https://github.com/egul/mrequest"
  s.license      = "MIT"
  s.author       = { "Evan" => "evangulyas@outlook.com" }
  s.source       = { :git => "https://github.com/egul/mrequest.git", :tag => s.version }
  s.source_files = "MRequest/MRequest.{h,m}"
  s.public_header_files = "MRequest/MRequest.h"
end
