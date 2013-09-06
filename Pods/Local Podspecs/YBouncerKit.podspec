Pod::Spec.new do |s|
  s.name     = 'YBouncerKit'
  s.version  = '0.1.1'
  s.license  = { :type => 'Yahoo Internal', :text => 'YAHOO! CONFIDENTIAL & INTERNAL ONLY' }
  s.summary  = 'Bouncer Login for Yahoo internal applications.'
  s.homepage = 'https://git.corp.yahoo.com/mnijdam/YBouncerKit'
  s.author   = { 
    'Marc Nijdam'    => 'mnijdam@yahoo-inc.com'
  }
  s.source   = { 
    :git => 'git@git.corp.yahoo.com:mnijdam/YBouncerKit.git',
    :tag => s.version.to_s
  }

  s.platform = :ios, '5.1'
  s.source_files = 'YBouncerKit/*.{h,m}'
  s.resources = 'YBouncerKit/*.xib'

  s.dependency 'AFNetworking', '~> 1.2.1'
  s.dependency 'MNColorKit', '~> 1.0.1'
  s.dependency 'UIAlertView-Blocks', '~>0.0.1'

end
