# motion-colortools

This gem provides some methods for manipulating UIColors in Rubymotion.

Examples:

The `lighten` and `darken` methods adjust a color's brightness by a fixed amount:
```ruby
test_color = UIColor.colorWithHue(0.5, saturation:0.5, brightness:0.5, alpha:1.0)

# Each of these methods takes one float between 0.0 and 1.0 

# increase brightness by 0.2 
test_color.lighten(0.2) # new brightness value of 0.7

# or darken it by 0.2 
test_color.darken(0.2) # new brightness value of 0.3
```
The `scale_lighten` and `scale_darken` methods adjust brightness based on a percentage of the color's current brightness level:
```ruby

# scale_lighten and scale_darken each take a float between 0.0 and 1.0 as a percentage. For example, scale_lighten lightens a color by 50% of the difference between the color's current brightness and 1.0, so:  
test_color = UIColor.colorWithHue(0.5, saturation:0.5, brightness:0.8, alpha:1.0)
test_color.scale_lighten(0.5) # new brightness value of 0.9 

#scale_darken does the inverse:
test_color = UIColor.colorWithHue(0.5, saturation:0.5, brightness:0.8, alpha:1.0)
test_color.scale_darken(0.5) # new brightness value of 0.4
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
