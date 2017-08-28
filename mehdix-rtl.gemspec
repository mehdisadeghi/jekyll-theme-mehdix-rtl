# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "mehdix-rtl"
  spec.version       = "0.1.0"
  spec.authors       = ["Mehdi Sadeghi"]
  spec.email         = ["mehdi@mehdix.org"]

  spec.summary       = %q{A rigt-to-left Jekyll theme.}
  spec.homepage      = "https://github.com/mehdisadeghi/mehdix-rtl"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(assets|_layouts|_includes|_sass|LICENSE|README)}i) }

  spec.add_runtime_dependency "jekyll", "~> 3.3"
  spec.add_runtime_dependency "jekyll-tagging", "~> 1.1"
  spec.add_runtime_dependency "jekyll-paginate", "~> 1.1"
  spec.add_runtime_dependency "jekyll-sitemap", "~> 1.1"
  spec.add_runtime_dependency "jalalidate", "~> 0.3"
  spec.add_runtime_dependency "coderay", "~> 1.1"


  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end

# gem 'jekyll'
# gem 'jekyll-sitemap'
# gem 'jekyll-tagging', :git => 'https://github.com/pattex/jekyll-tagging.git'
# gem 'jekyll-paginate'
# gem 'jalalidate'
# gem 'coderay'
# gem 'kramdown'
# gem 'pygments.rb'
# gem 'yajl-ruby'
# gem 'jekyll-watch'
# gem 'therubyracer'