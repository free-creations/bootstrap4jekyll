# bootstrap4jekyll

[![Gem Version](https://badge.fury.io/rb/bootstrap4jekyll.svg)](https://badge.fury.io/rb/bootstrap4jekyll)
[![Ruby](https://github.com/free-creations/bootstrap4jekyll/actions/workflows/ruby.yml/badge.svg)](https://github.com/free-creations/bootstrap4jekyll/actions/workflows/ruby.yml)

**The modern bridge between Jekyll and Bootstrap 5.**

Adds the [Twitter Bootstrap](https://getbootstrap.com/) framework to your _Jekyll_ site.

> **Note on Versioning:** Despite the name, `bootstrap4jekyll` fully supports **Bootstrap 5.x** and is a maintained 
> alternative to the now-archived `jekyll-bootstrap-sass`.


Although the 
[Twitter Bootstrap][TBstrp] framework 
is available as a Ruby gem ([Bootstrap Ruby Gem][BRG]), 
it cannot be used directly in a Jekyll site because it is specifically designed for the Rails asset pipeline.

_bootstrap4jekyll_ integrates the 
[Bootstrap Ruby Gem][BRG] 
into Jekyll, making the framework available to Jekyll users. 
This gem is inspired by the `jekyll-bootstrap-sass` gem, which is no longer maintained.

## Installation for a Standard Jekyll Site

Add the following to your site's `Gemfile`:

```ruby
group :jekyll_plugins do
  gem "bootstrap4jekyll", "~> 3.0"
end
```
Then run Bundler:

```
$ bundle install
```

This will add the `bootstrap4jekyll` plugin to your site, along with the [Twitter Bootstrap][TBstrp] framework.

## Installation for a Jekyll Theme

If you are building a Jekyll theme, declare the plugin in your `*.gemspec` file instead of the `Gemfile`:

```ruby
spec.add_runtime_dependency "bootstrap4jekyll", "~> 3.0"
```
Additionally, add it to your `_config.yml` file:

```yaml
plugins:
  - bootstrap4jekyll
```

When this theme is used in a Jekyll site, the plugin and the Bootstrap framework will be loaded automatically.

## Usage

To customise the Bootstrap framework, follow the standard [Jekyll Assets documentation](https://jekyllrb.com/docs/assets/). 
Create a `.scss` file (e.g., `assets/style.scss`) with the following content:

```scss
---
---

@import 'bootstrap';

// Your custom SCSS goes here
```

When your site is built, Jekyll will automatically include the Bootstrap framework before rendering your site's CSS. 
In the example above, the resulting file would be `assets/style.css`.

## JavaScript Assets

By default, `bootstrap4jekyll` makes the `@import 'bootstrap';` directive available to your stylesheets.

If you wish to use Bootstrap's JavaScript components, add the following to your site's `_config.yml`:

```yaml
bootstrap:
  assets: true
```

This will copy the Bootstrap JavaScript files into the `assets/javascripts/bootstrap` folder of the generated site. 
You can then include them in your layout as you would any other JavaScript file. 
Note that Bootstrap 5.x no longer requires jQuery but may require Popper.js for certain components 
(which is included in the bundle).

## Silencing Sass Deprecation Warnings

Jekyll uses the [jekyll-sass-converter](https://jekyllrb.com/docs/configuration/sass/) to process stylesheets. 
When using Bootstrap 5.x, you may encounter several deprecation warnings in your console. 

To silence these, configure the Sass compiler in your `_config.yml`:

```yaml
sass:
  silence_deprecations:
    - global-builtin
    - import
    - color-functions
    - if-function
```


## Specifying the Bootstrap Version

`bootstrap4jekyll` relies on the official [Bootstrap Ruby Gem][BRG]. By default, the latest version (5.x) will be used.

To use a specific version of Bootstrap, simply specify it in your `Gemfile`:

```ruby
gem 'bootstrap', '~> 5.3'
```


To see how the version of the Bootstrap gem relates to the framework version, please consult the [GEM's changelog][BRGchangeLog].

[BRG]: https://rubygems.org/gems/bootstrap
[BRGchangeLog]: https://github.com/twbs/bootstrap-rubygem/blob/master/CHANGELOG.md
[TBstrp]: https://getbootstrap.com/

