module RorIcons
	if defined?(Rails)
		class Engine < ::Rails::Engine
			initializer "ror_icons.helpers" do
				ActiveSupport.on_load(:action_view) do
					include RorIcons::Heroicons
				end
			end
		end
	end
end