Pod::Spec.new do |s|
s.name     = 'FlickerNumber'
s.version  = '0.1'
s.license  = 'MIT'
s.summary  = 'Flicker a number like alipay use UILabel category'
s.homepage = 'https://github.com/openboy2012/FlickerNumber'
s.author   = { 'dejohn dong' => 'dongjia_9251@126.com' }
s.source   = { :git => 'https://github.com/openboy2012/FlickerNumber.git', :tag => '0.1' }
s.ios.deployment_target = '5.1.1'
s.source_files = 'FlickerNumber/Classes/*.{h,m}'
s.requires_arc = true
s.frameworks = 'UIKit'
end

