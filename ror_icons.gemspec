require_relative "lib/ror_icons/version"

Gem::Specification.new do |spec|
	spec.name = "ror_icons"
	spec.version = RorIcons::VERSION
	spec.authors = ["Luka Tchelidze"]
	spec.email = ["tchelidzeluca@gmail.com"]

	spec.summary = "A Hotwire-ready icon helper gem for Rails"
	spec.description = "Provides HeroIcons SVG helpers for Rails views, similar to react-icons."
	spec.homepage = "https://github.com/Null-logic-0/ror_icons"
	spec.license = "MIT"
	spec.required_ruby_version = ">= 3.2.0"
	spec.add_dependency "nokogiri", "~> 1.13"

	spec.metadata["homepage_uri"] = spec.homepage
	spec.metadata["source_code_uri"] = spec.homepage
	spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

	# === FILES ===
	spec.files = begin
		             files = `git ls-files`.split("\n")
		             files.reject do |f|
			             f == File.basename(__FILE__) ||
				             f.end_with?('.gem') ||
				             f.start_with?('bin/', 'test/', '.github/', 'spec/', 'Gemfile', '.gitignore')
		             end
	             end

	# Executables
	spec.bindir = "exe"
	spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
	spec.require_paths = ["lib"]

	# Development dependencies
	spec.add_development_dependency "rails", "~> 7.1"
end