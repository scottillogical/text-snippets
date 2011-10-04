# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "text_snippets"
  s.summary = "Insert TextSnippets summary."
  s.description = "Insert TextSnippets description."
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.version = "0.0.1"

  s.add_dependency "slim"
  s.add_dependency "json"
  s.add_dependency "redis"
  s.add_dependency "redis-namespace"
  
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rack-test"
  s.add_development_dependency "capybara"
	
end