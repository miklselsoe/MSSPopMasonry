Pod::Spec.new do |s|
  s.name                = "MSSPopMasonry"
  s.version             = "0.0.1"
  s.summary             = "Use Masonry with the Facebook Pop animation framework"
  s.author              = { "Mikkel Selsøe Sørensen" => "mikkel@mikls.dk" }
  s.source              = { :git => "git@github.com:miklselsoe/MSSPopMasonry.git", :tag => s.version.to_s }
  s.source_files        = 'Source'
  s.platform            = :ios, '7.0'
  s.requires_arc        = true
  s.source_files        = '*.{h,m}'
  
  s.dependency 'pop'
  s.dependency 'Masonry'

  
  s.prefix_header_contents = <<-EOS
#ifdef __OBJC__
#import "MSSPopMasonry.h"
#endif
  EOS
end
