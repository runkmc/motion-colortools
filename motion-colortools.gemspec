# -*- encoding: utf-8 -*-

Gem::Specification.new do |spec|
  spec.name          = "motion-colortools"
  spec.version       = MotionColorTools::Version
  spec.authors       = ["Kevin McGladdery"]
  spec.email         = ["kevin.mcgladdery@gmail.com"]
  spec.description   = %q{A set of methods for UIColor to darken, lighten, tint, shade, saturate and desaturate existing colors.}
  spec.summary       = %q{A set of utility methods added to the UIColor class for manipulating colors.}
  spec.homepage      = ""
  spec.license       = ""

  files = []
  files << 'README.md'
  files.concat(Dir.glob('lib/**/*.rb'))
  spec.files         = files
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
end
