Pod::Spec.new do |s|
  s.name                = "MSSPopMasonry"
  s.version             = '0.0.1'
  s.summary             = "Use Masonry with the Facebook Pop animation framework"
  s.homepage            = "https://github.com/miklselsoe/MSSPopMasonry"
  s.author              = { "Mikkel Selsøe Sørensen" => "mikkel@mikls.dk" }
  s.source              = { :git => "git@github.com:miklselsoe/MSSPopMasonry.git", :tag => s.version.to_s }
  s.source_files        = 'Classes'
  s.requires_arc        = true
  
  s.dependency 'pop'
  s.dependency 'Masonry'

  s.ios.deployment_target = '6.0'
  s.osx.deployment_target = '10.7'
    
  s.prefix_header_contents = <<-EOS
#ifdef __OBJC__
#import "MSSPopMasonry.h"
#endif
  EOS
end
