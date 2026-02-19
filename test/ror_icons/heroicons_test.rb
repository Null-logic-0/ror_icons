require_relative "../test_helper"

class HeroiconsTest < Minitest::Test
	ICONS_PATH = File.expand_path("../../assets/icons", __dir__)

	def setup
		@module = RorIcons::Heroicons
		@example_icon_name = @module.icon_names.first
		@size = 24
		@css_class = "text-red-500"
	end

	def test_icon_names_exist
		refute_empty @module.icon_names, "There should be at least one icon available"
	end

	def test_icon_method_defined
		method_name = "hero_#{@example_icon_name}_icon"
		assert_respond_to @module, method_name.to_sym, "Module should respond to #{method_name}"

	end

	def test_icon_returns_svg
		svg_html = @module.send("hero_#{@example_icon_name}_icon", size: @size, class: @css_class)

		doc = Nokogiri::HTML::DocumentFragment.parse(svg_html)
		svg_node = doc.at_css("svg")

		refute_nil svg_node, "Returned SVG should have an <svg> node"
		assert_equal @size.to_s, svg_node["width"], "SVG width should match the requested size"
		assert_equal @size.to_s, svg_node["height"], "SVG height should match the requested size"
		assert_equal @css_class, svg_node["class"], "SVG class should match the requested class"
	end
end