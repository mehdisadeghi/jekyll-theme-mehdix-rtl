# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "jekyll-theme-mehdix-rtl"
  spec.version       = "4.0.1"
  spec.authors       = ["Mehdi Sadeghi"]
  spec.email         = ["mehdi@mehdix.org"]

  spec.summary       = %q{A right-to-left theme for Jekyll with Jalali support and some other goodies.}
  spec.homepage      = "https://github.com/mehdisadeghi/jekyll-theme-mehdix-rtl"
  spec.license       = "MIT"

  spec.metadata["plugin_type"] = "theme"

  spec.files = `git ls-files -z`.split("\x0").select do |f|
    f.match(%r{^(assets|_config.yml|_layouts|_includes|_sass|feed.*|LICENSE|README)}i)
  end

  spec.add_runtime_dependency "jekyll", ">= 3.6", "< 5.0"
  spec.add_runtime_dependency "jekyll-jalali", "~> 0.1"
  spec.add_runtime_dependency "jekyll-sitemap", "~> 1.1"
  spec.add_runtime_dependency "jekyll-paginate", "~> 1.1"
  spec.add_runtime_dependency "jekyll-hinduarabic", "~> 0.1"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.4"
  spec.add_runtime_dependency "jekyll-tagging-lite", "~> 1.0"
  spec.add_runtime_dependency "jekyll-include-cache", "~> 0"
  spec.add_runtime_dependency "jekyll-tagging-related_posts", "~> 1.0"
  spec.add_runtime_dependency "liquid_reading_time", "~> 1.1"

end
