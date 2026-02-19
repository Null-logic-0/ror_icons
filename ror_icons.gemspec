require_relative "lib/ror_icons/version"

Gem::Specification.new do |spec|
	spec.name = "ror_icons"
	spec.version = RorIcons::VERSION
	spec.authors = ["Luka Tchelidze"]
	spec.email = ["tchelidzeluca@gmail.com"]

	spec.summary = "A Hotwire-ready icon helper gem for Rails"
	spec.description = "Provides Heroicons SVG helpers for Rails views, similar to react-icons."
	spec.homepage = "TODO: Put your gem's website or public repo URL here."
	spec.license = "MIT"
	spec.required_ruby_version = ">= 3.2.0"
	spec.add_dependency "nokogiri", ">= 1.13"

	spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"
	spec.metadata["homepage_uri"] = spec.homepage
	spec.metadata["source_code_uri"] = spec.homepage
	spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

	# Specify which files should be added to the gem when it is released.
	# The `git ls-files -z` loads the files in the RubyGem that have been added into git.
	gemspec = File.basename(__FILE__)
	spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
		ls.readlines("\x0", chomp: true).reject do |f|
			(f == gemspec) ||
				f.start_with?(*%w[bin/ Gemfile .gitignore test/ .github/])
		end
	end
	spec.bindir = "exe"
	spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
	spec.require_paths = ["lib"]

	spec.add_development_dependency "rails", "~> 7.1"
	# For more information and examples about making a new gem, check out our
	# guide at: https://bundler.io/guides/creating_gem.html
end
