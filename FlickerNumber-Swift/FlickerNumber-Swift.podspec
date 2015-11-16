Pod::Spec.new do |s|
s.name     = 'FlickerNumber-Swift'
s.version  = '2.0'
s.license  = 'MIT'
s.summary  = 'Flicker a number like alipay use UILabel category'
s.homepage = 'https://github.com/openboy2012/FlickerNumber'
s.author   = { 'DeJohn Dong' => 'dongjia_9251@126.com' }
s.source   = { :git => 'https://github.com/openboy2012/FlickerNumber.git', :tag => s.version.to_s}
s.ios.deployment_target = '8.0'
s.source_files = 'FlickerNumber-Swift/UILabel+FlickerNumber.swift'
s.requires_arc = true
s.frameworks = 'UIKit'
end

