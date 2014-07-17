begin
  require 'octopress-ink'

  Octopress::Ink.add_plugin({
    name:        'Wrap Tag',
    assets_path: File.join(File.expand_path(File.dirname(__FILE__)), '../../assets' ),
    description: "A Liquid block tag which makes it easy to wrap an include, render or yield tag with html"
  })
rescue LoadError
end

