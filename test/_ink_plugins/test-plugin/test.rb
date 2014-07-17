require 'octopress-ink'

Octopress::Ink.add_plugin({
  name:        'Test Plugin',
  slug:        'test-plugin',
  assets_path: File.expand_path(File.dirname(__FILE__)),
  description: "Test some plugins y'all"
})
