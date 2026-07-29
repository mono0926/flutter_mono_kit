#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'mono_kit'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin.'
  s.description      = <<-DESC
A new Flutter plugin.
                       DESC
  s.homepage         = 'https://mono0926.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Masayuki Ono' => 'mono0926@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'mono_kit/Sources/mono_kit/**/*'
  s.public_header_files = 'mono_kit/Sources/mono_kit/**/*.h'
  s.dependency 'Flutter'

  s.ios.deployment_target = '13.0'
end

