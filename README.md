# Ruby on Rails Icons (ror-icons)

RorIcons is a Ruby on Rails gem for using SVG icons in your views,
inspired by React Icons. It provides HeroIcons helpers with dynamic sizing, variants, and extra HTML attributes.

## Installation

Add the gem to your Gemfile:

```bash
# For released version
gem "ror_icons", "~> 0.0.1"

# For local development
gem "ror_icons", path: "~/Desktop/ror_icons"
```

Then run:

```bash
bundle install
```

If using Rails, the gem automatically loads helpers via the Engine. No additional setup is required.

## Usage

Basic Example

Render an icon in a Rails view:

```bash
<%= hero_user_icon(size: 16, class: "text-red-500") %>
```

**Parameters**

size: — Icon size in pixels (default: 24).

variant: — :solid or :outline (default: :solid).

class: — CSS classes to apply to the SVG.

Extra HTML attributes can be passed as keyword arguments.

Example:

```bash
<%= hero_user_icon(size: 20, variant: :outline, class: "text-blue-500", id: "profile-icon") %>
```

You can get all available icons programmatically:

```bash
RorIcons::Heroicons.icon_names
# => ["user", "academic-cap", "home", ...]
```

Then dynamically call icons:

```bash 
icon_name = "user"
icon_html = RorIcons::Heroicons.send("hero_#{icon_name}_icon", size: 24)
```

# Adding Custom Icons

Place SVGs in the assets/icons/<size>/<variant>/ folder:

```bash
assets/
  icons/
    16/
      solid/
        user.svg
    24/
      outline/
        academic-cap.svg
```

The gem will automatically generate helpers for all SVG filenames.

# Rails Engine

If used in Rails, RorIcons::Engine automatically includes RorIcons::Heroicons in ActionView::Base. You can call helpers
in your views without additional setup.

# Development

## **Running Tests**

```bash 
bundle exec rake test
```

**Requirements**

Ruby ≥ 3.2
Nokogiri ≥ 1.13

## Building the Gem

```bash
gem build ror_icons.gemspec
gem push ror_icons-0.0.1.gem
```

## Contributing

Fork the repo and create a branch for your feature.

Add icons in the correct folder structure.

Add tests if you modify code.

Submit a pull request.