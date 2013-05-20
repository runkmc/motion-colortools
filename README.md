# motion-colortools

This gem provides some methods for manipulating UIColors in Rubymotion.

Examples:
```ruby
test_color = UIColor.colorWithHue(0.5, saturation:0.5, brightness:0.5, alpha:1.0)

# Each of these methods takes one float between 0.0 and 1.0 as a percentage:

test_color.lighten(0.2)
# lightens color by 20%

test_color.darken(0.25)
# darkens color by 25%
```

## Installation

Add this line to your application's Gemfile:

    gem 'motion-colortools'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install motion-colortools

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
