# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'email_list_verify/version'

Gem::Specification.new do |spec|
  spec.name          = "email_list_verify"
  spec.version       = EmailListVerify::VERSION
  spec.authors       = ["Ankur Singh"]
  spec.email         = ["ankur13019@iiitd.ac.in"]

  spec.summary       = "Ruby wrapper for the EmailListVerify.com API"
  spec.description   = "Provides a ruby wrapper for the OneByOne, FileUpload and FileStatus APIs."
  spec.homepage      = "https://github.com/rush-skills/email_list_verify"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'http://rubygems.org'
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency 'rest-client', '~> 1.8'
end
