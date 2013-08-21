$:.push File.expand_path("../lib", __FILE__)

require "librato/rails/version"

Gem::Specification.new do |s|
  s.name        = "librato-rails"
  s.version     = Librato::Rails::VERSION

  s.authors     = ["Matt Sanders"]
  s.email       = ["matt@librato.com"]
  s.homepage    = "https://github.com/librato/librato-rails"
  s.license     = 'BSD 3-clause'

  s.summary     = "Use Librato Metrics with your Rails 3 app"
  s.description = "Report key app statistics to the Librato Metrics service and easily track your own custom metrics."

  s.files = Dir["{app,config,db,lib}/**/*"]
  s.files += ["LICENSE", "Rakefile", "README.md", "CHANGELOG.md", "FAQ.md"]
  s.test_files = Dir["test/**/*"]

  # ignore temporary files
  s.test_files.reject! { |file| file =~ /dummy\/tmp\/[a-z]+\// }
  s.test_files.reject! { |file| file =~ /dummy\/db\/.*\.sqlite3/ }
  s.test_files.reject! { |file| file =~ /dummy\/log\/.*\.log/ }

  s.add_dependency "rails", ">= 3.0"
  s.add_dependency "librato-rack", "~> 0.4.1"

  s.add_development_dependency "sqlite3", ">= 1.3"
  s.add_development_dependency "capybara", "~> 2.0.3"
  # activesupport 3.2.x breaks with newer minitest
  s.add_development_dependency "minitest", '~> 3.4.0'

  signing_key = File.expand_path("~/.gem/librato-private_key.pem")
  if File.exists?(signing_key)
    s.signing_key = signing_key
    s.cert_chain = ["certs/librato-public.pem"]
  end
end
