# Octopress Wrap Tag

A Liquid block tag which makes it easy to wrap an include, render or yield tag with html.

[![Build Status](https://travis-ci.org/octopress/wrap-tag.svg)](https://travis-ci.org/octopress/wrap-tag)
[![Gem Version](http://img.shields.io/gem/v/octopress-wrap-tag.svg)](https://rubygems.org/gems/octopress-wrap-tag)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://octopress.mit-license.org)

## Installation

Add this line to your application's Gemfile:

    gem 'octopress-wrap-tag'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install octopress-wrap-tag

Next add it to your gems list in Jekyll's `_config.yml`

    gems:
      - octopress-wrap-tag

## Usage

Use this just like the Octopress include, render or yield tags, but wrap the output.

    {% wrap include post.html %}
      <article>{{ yield }}</article>
    {% endwrap %}

    {% wrap render ../LICENCE.md %}
      <div class="licence-text">{{ yield }}</div>
    {% endwrap %}

    {% wrap yeild post_footer %}
      <div class="post-footer">{{ yield }}</div>
    {% endwrap %}

These wrap tags support all the same features that include, render and yield tags support. This also means that `wrap
yield` won't output anything if there isn't any content. A great use case for `wrap yield` is to add content sections to a
template which can be easily and optionally filled in a post or page, simply by using the
[content_for](https://github.com/octopress/content-for) tag.

Include partials stored as a variable.

    // If a page has the following YAML front-matter
    // sidebar: post_sidebar.html

    {% wrap include page.sidebar %}
      <aside>{{ yield }}</aside>
    {% endwrap %}

Include partials conditionally, using `if`, `unless` and ternary logic.

    {% wrap include page.sidebar if page.sidebar %}
      <aside>{{ yield }}</aside>
    {% endwrap %}

    {% wrap include comments.html unless page.comments == false %}
      <div class="post-comments">{{ yield }}</div>
    {% endwrap %}

    {% wrap include (post ? post_sidebar : page_sidebar) %}
      <aside>{{ yield }}</aside>
    {% endwrap %}

Filter included partials.

    {% include foo.html %}           //=> Yo, what's up
    {% include foo.html | upcase %}  //=> YO, WHAT'S UP

Yes, it can handle a complex combination of features… but can you?

    {% include (post ? post_sidebar : page_sidebar) | smart_quotes unless site.theme.sidebar == false %}

### Include partials with an Octopress Ink plugin.

It's easy to include a partial from an Ink theme or plugin.

Here's the syntax

    {% include [plugin-slug]:[partial-name] %}

Some examples:

    {% include theme:sidebar.html %}   // Include the sidebar from a theme plugin
    {% include twitter:feed.html %}    // Include the feed from a twitter plugin

#### Overriding theme/plugin partials

Plugins and themes use this tag internally too. For example, the [octopress-feeds plugin](https://github.com/octopress/feeds/blob/master/assets/pages/article-feed.xml#L10) uses the include tag to
render partials for the RSS feed.

    {% for post in site.articles %}
      <entry>
        {% include feeds:entry.xml %}
      </entry>
    {% endfor %}


If you want to make a change to the `entry.xml` partial, you could create your own version at `_plugins/feeds/includes/entry.xml`.
Now whenever `{% include feeds:entry.xml %}` is called, the include tag will use *your* local partial instead of the plugin's partial.

Note: To make overriding partials easier, you can copy all of a plugin's partials to your local override path with the Octopress Ink command:

    octopress ink copy [plugin-slug] [options]

To copy all includes from the feeds plugin, you'd run:

    octopress ink copy feeds --includes

This will copy all of the partials from octopress-feeds to `_plugins/feeds/includes/`. Modify any of the partials, and delete those that you want to be read from the plugin.

To list all partials from a plugin, run:

    octopress ink list [plugin-slug] --includes

Note: When a plugin is updated, your local partials may be out of date, but will still override the plugin's partials. Be sure to watch changelogs and try to keep your modifications current.

## Contributing

1. Fork it ( https://github.com/octopress/wrap-tag/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
