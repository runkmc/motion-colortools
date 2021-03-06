describe "UIColor" do

  before do
    @test_hsb_color = UIColor.colorWithHue(0.5, saturation:0.5, brightness:0.5, alpha:0.5)
    @test_rgb_color = UIColor.colorWithRed(0.5, green:0.5, blue:0.5, alpha:0.5)
    @test_grayscale_color = UIColor.colorWithWhite(0.5, alpha:0.5)
  end

  it "should get hsb values" do
    comps = @test_hsb_color.hsb
    comps[:hue].should        == 0.5
    comps[:saturation].should == 0.5
    comps[:brightness].should == 0.5
    comps[:alpha].should      == 0.5
  end

  it "should get rbg values" do
    comps = @test_rgb_color.rgb
    comps[:red].should   == 0.5
    comps[:green].should == 0.5
    comps[:blue].should  == 0.5
    comps[:alpha].should == 0.5
  end

  it "should get grayscale values" do
    comps = @test_grayscale_color.grayscale
    comps[:white].should == 0.5
    comps[:alpha].should == 0.5
  end

  it "should lighten a color" do
    new_color = @test_hsb_color.lighten(0.2)
    new_color.hsb[:brightness].should == (0.5 + 0.2)
  end

  it "should cap lighten at 1.0" do
    new_color = @test_hsb_color.lighten(0.9)
    new_color.hsb[:brightness].should == 1.0
  end

  it "should lighten a grayscale color" do
    new_color = @test_grayscale_color.lighten(0.3)
    new_color.grayscale[:white].should == (0.5 + 0.3)
  end

  it "should also scale_lighten" do
    new_color = @test_hsb_color.scale_lighten(0.5) 
    new_color.hsb[:brightness].should == (0.5 + (0.5 * 0.5))
  end

  it "should scale_lighten a grayscale color" do
    new_color = @test_grayscale_color.scale_lighten(0.5)
    new_color.grayscale[:white].should == (0.5 + (0.5 * 0.5))
  end

  it "should darken a color" do
    new_color = @test_hsb_color.darken(0.2)
    new_color.hsb[:brightness].should == (0.5 - 0.2)
  end

  it "should cap darken at 0.0" do
    new_color = @test_hsb_color.darken(0.9)
    new_color.hsb[:brightness].should == 0.0
  end

  it "should darken a grayscale color" do
    new_color = @test_grayscale_color.darken(0.3)
    new_color.grayscale[:white].should == (0.5 - 0.3)
  end

  it "should also scale_darken" do
    new_color = @test_hsb_color.scale_darken(0.5) 
    new_color.hsb[:brightness].should == (0.5 - (0.5 * 0.5))
  end

  it "should scale_darken a grayscale color" do
    new_color = @test_grayscale_color.scale_darken(0.5)
    new_color.grayscale[:white].should == (0.5 - (0.5 * 0.5))
  end

  it "should saturate a color" do
    new_color = @test_hsb_color.saturate(0.25)
    new_color.hsb[:saturation].should == (0.25 + 0.5)
  end
  
  it "should desaturate a color" do
    new_color = @test_hsb_color.desaturate(0.2)
    new_color.hsb[:saturation].should == (0.5 - 0.2)
  end

  it "should do nothing if you try to saturate or desaturate a grayscale color" do
    new_color = @test_grayscale_color
    new_color.desaturate(0.2).should == new_color
    new_color.saturate(0.2).should == new_color
  end

  it "should return grayscale? as true on a grayscale color" do
    @test_rgb_color.grayscale?.should == false
    @test_hsb_color.grayscale?.should == false
    @test_grayscale_color.grayscale?.should == true
  end

  it "should tint a color" do
    new_color = @test_rgb_color.tint(0.3)
    new_color.rgb[:red].should   == (0.5 + 0.3)
    new_color.rgb[:green].should == (0.5 + 0.3)
    new_color.rgb[:blue].should  == (0.5 + 0.3)
    new_color.rgb[:alpha].should == 0.5
  end
  
  it "should shade a color" do
    new_color = @test_rgb_color.shade(0.3)
    new_color.rgb[:red].should   == (0.5 - 0.3)
    new_color.rgb[:green].should == (0.5 - 0.3)
    new_color.rgb[:blue].should  == (0.5 - 0.3)
    new_color.rgb[:alpha].should == 0.5
  end

end
