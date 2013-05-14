class UIColor

  def hsb
    get_hsb
  end

  def lighten(amount)
    color_values = hsb
    UIColor.colorWithHue(color_values[:hue], saturation:color_values[:saturation],
                         brightness:(color_values[:brightness] + amount), alpha:color_values[:alpha])
  end

  def scale_lighten(amount)
    color_values = hsb
    diff = 1.0 - hsb[:brightness]
    new_brightness = color_values[:brightness] + (diff * amount)
    UIColor.colorWithHue(color_values[:hue], saturation:color_values[:saturation], brightness:new_brightness, alpha:color_values[:alpha])
  end

  def darken(amount)
    color_values = hsb
    UIColor.colorWithHue(color_values[:hue], saturation:color_values[:saturation], brightness:(color_values[:brightness] - amount), alpha:color_values[:alpha])
  end

  def scale_darken(amount)
    color_values = hsb
    new_brightness = color_values[:brightness] - (color_values[:brightness] * amount)
    UIColor.colorWithHue(color_values[:hue], saturation:color_values[:saturation], brightness:new_brightness, alpha:color_values[:alpha])
  end

  def desaturate(amount)
    color_values = hsb
    UIColor.colorWithHue(color_values[:hue], saturation:(color_values[:saturation] - amount), brightness:color_values[:brightness], alpha:color_values[:alpha])
  end

  private

  def get_hsb
    hue        = Pointer.new :float
    saturation = Pointer.new :float
    brightness = Pointer.new :float
    alpha      = Pointer.new :float
    self.getHue(hue, saturation:saturation, brightness:brightness, alpha:alpha)
    { hue: hue[0], saturation: saturation[0], brightness: brightness[0], alpha: alpha[0] }
  end

end
