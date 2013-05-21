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

# scale_lighten and scale_darken each take a float between 0.0 and 1.0 as a percentage.
# scale_lighten lightens a color by 50% of the difference between the color's current brightness and 1.0, so:  
test_color = UIColor.colorWithHue(0.5, saturation:0.5, brightness:0.8, alpha:1.0)
test_color.scale_lighten(0.5) # new brightness value of 0.9 

#scale_darken does the inverse:
test_color = UIColor.colorWithHue(0.5, saturation:0.5, brightness:0.8, alpha:1.0)
test_color.scale_darken(0.5) # new brightness value of 0.4
```

`saturate` and `desaturate`:
```ruby
# saturate and desaturate work much line lighten and darken, only they adjust... saturation.

test_color = UIColor.colorWithHue(0.5, saturation:0.5, brightness:0.5, alpha:1.0)
test_color.saturate(0.3) # new saturation value of 0.8
test_color.desaturate(0.3) # new saturation value of 0.2
```

`tint` and `shade` might sound like they do the same thing as `lighten` and `darken`, but there is an important difference:
```ruby
# rather than just adjusting brightness, tint and shade mix white and black into the 
# color, respectively. They each take a float between 0.0 and 1.0, representing
# the percentage of white or black to mix in. 
# tint decreases saturation while increasing brightness, shade does the inverse:

test_color = UIColor.colorWithHue(0.5, saturation:0.5, brightness:0.5, alpha:1.0)
test_color.tint(0.2)	
# new values: hue=>0.5, :saturation=>0.35, :brightness=>0.69, :alpha=>1.0

# shade does the inverse:
test_color.shade(0.2)
# new values: hue=>0.5, :saturation=>0.83, :brightness=>0.29, :alpha=>1.0
```

There are also some methods that make it easier to work with UIColors:
```ruby
UIColor.blueColor.rgb # returns rgb values in a hash:
=> {:red=>0.0, :green=>0.0, :blue=>1.0, :alpha=>1.0}

UIColor.blueColor.hsb # returns hsb values in a hash:
=> {:hue=>0.666666507720947, :saturation=>1.0, :brightness=>1.0, :alpha=>1.0} 

UIColor.blueColor.grayscale? # tests if a color is grayscale or not
=> false
UIColor.whiteColor.grayscale?
=> true

UIColor.whiteColor.grayscale # returns grayscale values in a hash
=> {:white=>1.0, :alpha=>1.0}
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
