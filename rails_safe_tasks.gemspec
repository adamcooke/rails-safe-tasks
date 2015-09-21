Gem::Specification.new do |s|
  s.name          = "rails_safe_tasks"
  s.description   = %q{Automatically disable dangerous Rake tasks in production}
  s.summary       = s.description
  s.homepage      = "https://github.com/adamcooke/rails-safe-tasks"
  s.version       = '1.0.0'
  s.files         = Dir.glob("{lib}/**/*")
  s.require_paths = ["lib"]
  s.authors       = ["Adam Cooke"]
  s.email         = ["me@adamcooke.io"]
  s.licenses      = ['MIT']
end
