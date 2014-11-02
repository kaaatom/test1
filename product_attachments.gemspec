Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'product_attachments'
  s.version     = '1.0.1'
  s.summary     = 'Add gem summary here'
  #s.description = 'Add (optional) gem description here'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Someone'
  s.email             = 'example@example.com'
  s.homepage          = 'http://www.rubyonrails.org'
  s.rubyforge_project = 'downloadables'

  s.files        = Dir['CHANGELOG', 'README.md', 'LICENSE', 'lib/**/*', 'app/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = true

  s.add_dependency('spree_core')
  s.add_dependency('rubyzip', '>= 0.9.1')
end
