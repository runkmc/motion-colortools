describe "UIColor" do

  before do
    @test_hsb_color = UIColor.colorWithHue(0.5, saturation:0.5, brightness:0.5, alpha:0.5)
  end

  it "should get hsb values" do
    comps = @test_hsb_color.hsb
    comps[:hue].should == 0.5
    comps[:saturation].should == 0.5
    comps[:brightness].should == 0.5
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

  it "should also scale_lighten" do
    new_color = @test_hsb_color.scale_lighten(0.5) 
    new_color.hsb[:brightness].should == (0.5 + (0.5 * 0.5))
  end

  it "should darken a color" do
    new_color = @test_hsb_color.darken(0.2)
    new_color.hsb[:brightness].should == (0.5 - 0.2)
  end

  it "should cap darken at 0.0" do
    new_color = @test_hsb_color.darken(0.9)
    new_color.hsb[:brightness].should == 0.0
  end

  it "should also scale_darken" do
    new_color = @test_hsb_color.scale_darken(0.5) 
    new_color.hsb[:brightness].should == (0.5 - (0.5 * 0.5))
  end
end
