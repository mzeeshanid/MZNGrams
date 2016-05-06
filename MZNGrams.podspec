
Pod::Spec.new do |s|
  s.name             = "MZNGrams"
  s.version          = "0.1.0"
  s.summary          = "Generate NGrams for Natural Language Processing(NLP)."

  s.description      = <<-DESC
                        Assignment 2b MS(CS) Natural Language Processing Dr. Aleem Mushtaq Bahria University Karachi Campus
                       DESC

  s.homepage         = "https://github.com/mzeeshanid/MZNGrams"
#s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Muhammad Zeeshan" => "mzeeshanid@yahoo.com" }
  s.source           = { :git => "https://github.com/mzeeshanid/MZNGrams.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/mzeeshanid'

  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'

  s.source_files = 'MZNGrams/Classes/**/*'
  s.frameworks = 'UIKit', 'Foundation'
end
