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


### Basic usage

the wrap tag is basically just wrapping Octopress's [include](https://github.com/octopress/include-tag), 
[render](https://github.com/octopress/render-tag) and [yield](https://github.com/octopress/content-for)
tags with HTML in a liquid block tag. So all the features are the same. 

The wrap tag supports all the same features that Octopress's [include](https://github.com/octopress/include-tag), 
[render](https://github.com/octopress/render-tag) and [yield](https://github.com/octopress/content-for) tags support. This also means that `wrap yield` won't output anything if there isn't any content.

    {% wrap include post.html %}
      <article>{{ yield }}</article>
    {% endwrap %}

    {% wrap render ../LICENCE.md %}
      <div class="licence-text">{{ yield }}</div>
    {% endwrap %}

    {% wrap yield post_footer %}
      <div class="post-footer">{{ yield }}</div>
    {% endwrap %}

### Yield example

A great use case for `wrap yield` is to add content sections to a
template which can be easily and optionally filled from a post or page by using the
[content_for](https://github.com/octopress/content-for) tag. Here's an example.

    // In a page template

    <aside class="sidebar">
      {% wrap yield sidebar_before %}
        <section>{{ yield }}</section>
      {% endwrap %}

      // Regular sidebar content goes here //

      {% wrap yield sidebar_after %}
        <section>{{ yield }}</section>
      {% endwrap %}
    </aside>

Now in any post or page you can add custom content to the sidebar with a content_for tag.

    // In a post

    {% content_for sidebar_before %}
      <h4>About this post</h4>
      ...
    {% endcontent_for %}

This content will appear at the top of the sidebar, wrapped in a `section` element. The `sidebar_after` section won't be
rendered since it wasn't set in this post.

### Advanced features

The examples below only demonstrate wrapping the include tag for brevity, but as stated earlier, the wrap tag 
is basically just wrapping Octopress's [include](https://github.com/octopress/include-tag), 
[render](https://github.com/octopress/render-tag) and [yield](https://github.com/octopress/content-for)
tags with HTML in a liquid block tag. So all the features are the same. 

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

    {% wrap include greeting.html %} yo, {{ yield }}{% endwrap %}           //=> yo, what's up?
    {% wrap include greeting.html %} yo, {{ yield | upcase }}{% endwrap %}  //=> yo, WHAT'S UP?
    {% wrap include greeting.html | upcase %} Yo, {{ yield }}{% endwrap %}  //=> YO, WHAT'S UP?


### Include partials with an Octopress Ink plugin.

It's easy to include a partial from an Ink theme or plugin.

Here's the syntax

    {% wrap include [plugin-slug]:[partial-name] %}
    {{ yield }}
    {% endwrap %}

Some examples:

    {% wrap include theme:sidebar.html %}   // Include the sidebar from a theme plugin
      <aside>{{ yield }}</aside>
    {% endwrap %}

    {% wrap include twitter:feed.html %}    // Include the feed from a twitter plugin
      <div class="twitter-feed">{{ yield }}</div>
    {% endwrap %}


## Contributing

1. Fork it ( https://github.com/octopress/wrap-tag/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
