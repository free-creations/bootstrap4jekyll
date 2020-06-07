# bootstrap4jekyll
Adds the 
[Twitter Bootstrap](https://getbootstrap.com/)
framework to your _Jekyll_ site.

Although the
[Twitter Bootstrap](https://getbootstrap.com/)
framework exists as a GEM, called [Bootstrap Ruby Gem][BRG],
it cannot be used directly in a _Jekyll_ site, because it is specifically made for the
_Rails_ asset pipeline.

_bootstrap4jekyll_ integrates the 
[Bootstrap Ruby Gem][BRG]
into _Jekyll_. Thus making the [Bootstrap Ruby Gem][BRG]
available to _Jekyll_ users.

This GEM is inspired by the 
[jekyll-bootstrap-sass](https://github.com/benbalter/jekyll-bootstrap-sass) GEM,
which has not been maintained for a while.

## Installation in a normal Jekyll site

Add the following to your site's `Gemfile`:

```ruby
group :jekyll_plugins do
  gem "bootstrap4jekyll"
end
```
Now run Bundler:

```console
$ bundle install
```
This will add the `bootstrap4jekyll` plugin to your site. Together with the plugin also the _Twitter-
Bootstrap framework_ will added to your site.

## Installation in a Jekyll theme

When you plan to build a Jekyll theme, instead of declaring the plugin in the `Gemfile` you 
should declare it in your `*.gemspec` file. Like this:

```ruby
  spec.add_runtime_dependency "bootstrap4jekyll", "~> 1.0"
```

And additionally in your `_config.yml` file, like this:
```yaml
plugins:
  - bootstrap4jekyll
```

When you use this theme in a Jekyll site the `bootstrap4jekyll` plugin 
and the _bootstrap framework_ will be automatically loaded 
together with your theme.

## Usage

Create a `.scss` file (e.g., `assets/myStyle.scss`), with the following:

```scss
---
---

@import 'bootstrap';

// (Your custom SCSS Here)
```
When your site is built, Jekyll will automatically add the _Bootstrap framework_ before it renders 
your site's css. In the above example, the resulting file would be `assets/myStyle.css` 
with Bootstrap's CSS followed by your own.

## Assets

By default, `bootstrap4jekyll` will simply make the `@import 'bootstrap';` directive available 
to your custom stylesheets so that you can more easily include Bootstrap's CSS.

If you would like to use Bootstrap's javascripts, you'll need to add the 
following to your site's `_config.yml`:

```yaml
bootstrap:
  assets: true
```
This will create `assets/javascripts/bootstrap` folders in the generated site, 
which you can include in your site's header as you would any other javascript file.

## Specifying the Bootstrap version

`bootstrap4jekyll` relies on official [Bootstrap Ruby Gem][BRG].
By default, the newest version starting from 4.2 will be used.

To use a specific version of the [Bootstrap Ruby Gem][BRG], simply specify the desired version in your `Gemfile`.
Like this:

```ruby
  gem 'bootstrap', '~> 4.5'
```

To see how the version of the [Bootstrap Ruby Gem][BRG] relates to the version of the included
_framework_, look into the [GEM's changelog][BRGchangeLog]


[BRG]: https://rubygems.org/gems/bootstrap
[BRGchangeLog]: https://github.com/twbs/bootstrap-rubygem/blob/master/CHANGELOG.md
