Pod::Spec.new do |s|
s.name         = "WRTabBarViewController"
s.version      = "1.1.3"
s.summary      = "自定义选项卡"
s.description  = "可以自定义选项卡高度，字体，颜色，凸起等"
s.homepage     = "https://github.com/GodFighter/WRTabBarViewController.git"
s.license      = "MIT"
s.author       = { "Leo Xiang" => "xianghui_ios@163.com" }
s.source       = { :git => "https://github.com/GodFighter/WRTabBarViewController.git", :tag => s.version }
s.source_files = 'WRTabBarViewController/*.{h,m}'
s.ios.deployment_target = '8.0'
s.frameworks   = 'UIKit'
s.social_media_url = "http://weibo.com/huigedang/home?wvr=5&lf=reg"
s.requires_arc = true

end
