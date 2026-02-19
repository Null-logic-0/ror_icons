module RorIcons
	module Heroicons
		extend self
		ICON_ROOT = File.expand_path("../../assets/icons", __dir__)
		DEFAULT_SIZE = 24
		DEFAULT_VARIANT = :solid

		def self.icon_names
			Dir.glob("#{ICON_ROOT}/**/*.svg").map { |f| File.basename(f, ".svg") }.uniq
		end

		icon_names.each do |icon_name|
			define_method("hero_#{icon_name}_icon") do
			|size: DEFAULT_SIZE, variant: DEFAULT_VARIANT, css_class: nil, **attrs|
				path = File.join(ICON_ROOT, size.to_s, variant.to_s, "#{icon_name}.svg")
				raise ArgumentError, "Icon not found: #{path}" unless File.exist?(path)

				svg = (defined?(Rails) && Rails.respond_to?(:cache)) ? Rails.cache.fetch(path) { File.read(path) } : File.read(path)
				doc = Nokogiri::HTML::DocumentFragment.parse(svg)
				svg_node = doc.at_css("svg")
				raise "SVG does not contain <svg> node" unless svg_node

				svg_node["width"] = size.to_s
				svg_node["height"] = size.to_s

				svg_node["class"] = css_class if css_class
				attrs.each { |k, v| svg_node[k.to_s] = v }

				if defined?(Rails) && doc.to_html.respond_to?(:html_safe)
					doc.to_html.html_safe
				else
					doc.to_html
				end
			end
		end
	end
end

