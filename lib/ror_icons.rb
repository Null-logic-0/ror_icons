# frozen_string_literal: true

require "nokogiri"
require_relative "ror_icons/version"
require_relative "ror_icons/engine" if defined?(Rails)
require_relative "ror_icons/heroicons"

module RorIcons
	class Error < StandardError; end

end
