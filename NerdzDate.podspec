Pod::Spec.new do |s|
  s.name             = 'NerdzDate'
  s.version          = '1.0.5'
  s.summary          = 'A list of small twiks to make it easy coding'
  s.homepage         = 'https://github.com/nerdzlab/NerdzDate'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'NerdzLab' => 'supernerd@nerdzlab.com' }
  s.source           = { :git => 'https://github.com/nerdzlab/NerdzDate.git', :tag => s.version }
  s.social_media_url = 'https://nerdzlab.com'
  s.ios.deployment_target = '9.0'
  s.swift_versions = ['5.0']
  s.source_files = 'Sources/**/*'
end
