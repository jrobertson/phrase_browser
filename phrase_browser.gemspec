Gem::Specification.new do |s|
  s.name = 'phrase_browser'
  s.version = '0.1.1'
  s.summary = 'Experimental gem to look up a phrase from a list of words layed out in an HTML accordion style menu.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/phrase_browser.rb']
  s.add_runtime_dependency('htmlcom', '~> 0.2', '>=0.2.0')
  s.add_runtime_dependency('kramdown', '~> 2.1', '>=2.1.0')
  s.signing_key = '../privatekeys/phrase_browser.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/phrase_browser'
end
