class UIColor

  def hsb
    get_hsb
  end

  def rgb
    get_rgb
  end

  def grayscale
    get_grayscale
  end

  def lighten(amount)
    if components == 4
      color_values = hsb
      UIColor.colorWithHue(color_values[:hue], saturation:color_values[:saturation], brightness:(color_values[:brightness] + amount), alpha:color_values[:alpha])
    else
      self.tint(amount)
    end
  end

  def scale_lighten(amount)
    if components == 4
      color_values = hsb
      diff = 1.0 - color_values[:brightness]
      new_brightness = color_values[:brightness] + (diff * amount)
      UIColor.colorWithHue(color_values[:hue], saturation:color_values[:saturation], brightness:new_brightness, alpha:color_values[:alpha])
    else
      color_values = grayscale
      diff = 1.0 - color_values[:white]
      new_brightness = color_values[:white] + (diff * amount)
      UIColor.colorWithWhite(new_brightness, alpha:(color_values[:alpha]))
    end
  end

  def darken(amount)
    if components == 4
      color_values = hsb
      UIColor.colorWithHue(color_values[:hue], saturation:color_values[:saturation], brightness:(color_values[:brightness] - amount), alpha:color_values[:alpha])
    else
      self.shade(amount)
    end
  end

  def scale_darken(amount)
    if components == 4
      color_values = hsb
      new_brightness = color_values[:brightness] - (color_values[:brightness] * amount)
      UIColor.colorWithHue(color_values[:hue], saturation:color_values[:saturation], brightness:new_brightness, alpha:color_values[:alpha])
    else
      color_values = grayscale
      new_brightness = color_values[:white] - (color_values[:white] * amount)
      UIColor.colorWithWhite(new_brightness, alpha:(color_values[:alpha]))
    end
  end

  def desaturate(amount)
    return self if components == 2
    color_values = hsb
    UIColor.colorWithHue(color_values[:hue], saturation:(color_values[:saturation] - amount), brightness:color_values[:brightness], alpha:color_values[:alpha])
  end

  def saturate(amount)
    return self if components == 2
    color_values = hsb
    UIColor.colorWithHue(color_values[:hue], saturation:(color_values[:saturation] + amount), brightness:color_values[:brightness], alpha:color_values[:alpha])
  end

  def tint(amount)
    if components == 4
      color_values = rgb
      UIColor.colorWithRed((color_values[:red] + amount), green:(color_values[:green] + amount), blue:(color_values[:blue] + amount), alpha:color_values[:alpha])
    else
      color_values = grayscale
      UIColor.colorWithWhite((color_values[:white] + amount), alpha:(color_values[:alpha]))
    end
  end

  def shade(amount)
    if components == 4
      color_values = rgb
      UIColor.colorWithRed((color_values[:red] - amount), green:(color_values[:green] - amount), blue:(color_values[:blue] - amount), alpha:color_values[:alpha])
    else
      color_values = grayscale
      UIColor.colorWithWhite((color_values[:white] - amount), alpha:(color_values[:alpha]))
    end

  end
  
  def grayscale?
    components == 2
  end

  def cg
    self.CGColor
  end

  def components
    CGColorGetNumberOfComponents(self.cg)
  end

  private

  def get_grayscale
    white = Pointer.new :float
    alpha = Pointer.new :float
    self.getWhite(white, alpha:alpha)
    {white: white[0], alpha: alpha[0] }
  end

  def get_hsb
    hue        = Pointer.new :float
    saturation = Pointer.new :float
    brightness = Pointer.new :float
    alpha      = Pointer.new :float
    self.getHue(hue, saturation:saturation, brightness:brightness, alpha:alpha)
    { hue: hue[0], saturation: saturation[0], brightness: brightness[0], alpha: alpha[0] }
  end

  def get_rgb
    red   = Pointer.new :float
    green = Pointer.new :float
    blue  = Pointer.new :float
    alpha = Pointer.new :float
    self.getRed(red, green:green, blue:blue, alpha:alpha)
    { red: red[0], green: green[0], blue: blue[0], alpha: alpha[0] }
  end

end
