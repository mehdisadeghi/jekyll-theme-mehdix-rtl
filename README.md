# jekyll-theme-mehdix-rtl [![Gem Version](https://badge.fury.io/rb/jekyll-theme-mehdix-rtl.svg)](https://badge.fury.io/rb/jekyll-theme-mehdix-rtl)

![](screenshot.png)

This is the jekyll theme used for my personal Persian [website](http://mehdix.ir). Persian aka Farsi is written right-to-left, however some people use Roman script to write Persian language in messaging applications and social networks.

During the last few years people have reached out to me asking how to setup a persian Jekyll website with Jalali calendar support. Since Jekyll now supports themes, I created this theme based on my website to help others to bootstrap their own websites.

This repository can be of use to anybody willing to build a new right to left website. I gradually fix issues which I came across while writing new posts in my website. This website is produced using [Jekyll](http://jekyllrb.com/) static site generator.

## Installation

Take the following steps to make your own website based on this theme. First of all, create your website if you have not already:


    $ jekyll create mywebsite


Then add this line to your Jekyll site's Gemfile:

```ruby
gem "jekyll-theme-mehdix-rtl"
```

And add this line to your Jekyll site's `_config.yml`:

```yaml
theme: jekyll-theme-mehdix-rtl
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jekyll-theme-mehdix-rtl


You can override theme style by creating matching files with the same structure inside your Jekyll source tree. See Jekyll [Themes docs](https://jekyllrb.com/docs/themes/) for more information on that.


## Further customization
### Layouts
The following layouts are available for your homepage:
- home: post titles along with an excerpt and pagination
- minimal: only post titles

### Comments
In order to enalbe disqus comments add `disqus: true` to your `_config.yml` file. Moreover, you have to set `disqus_shortname` to your disqus username.

### Forcing RTL code blocks
If you put code blocks and they appear incorrectly, you can use _Markright gem. First add it to your Gemfile:

```ruby
gem "jekyll-markright"
```

And change your __config.yml_ respectively:

```yaml
markdown: Markright
```

### Analytics
In order to send pageviews to Google Analytics set your ID in the `_config.yml`: `google_analytics_id: YOUR_ID`


## License

[MIT](http://opensource.org/licenses/MIT)
