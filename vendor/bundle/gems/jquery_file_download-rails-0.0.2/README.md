# `jquery_file_download-rails`

[![Install gem](https://badge.fury.io/rb/jquery_file_download-rails.png)](https://rubygems.org/gems/jquery_file_download-rails)
[![Build status](https://travis-ci.org/rcook/jquery_file_download-rails.png)](https://travis-ci.org/rcook/jquery_file_download-rails)

[`jquery.fileDownload.js`](https://github.com/johnculviner/jquery.fileDownload)
package for Rails 3.1+ asset pipeline.

# Installation

* Add `jquery_file_download-rails` to your application's `Gemfile`:

```ruby
gem 'jquery_file_download-rails'
```

* Run Bundler to lock the gem:

```bash
bundle install
```

* Add a reference to the gem's assets to your application's JavaScript asset
manifest (usually `app/assets/javascripts/application.js`):

```javascript
//= require jquery.fileDownload
```

* Actions sending files in response to download requests must set the `fileDownload`
cookie which can be done via the `cookies` collection as in this sample controller:

```ruby
class DownloadController < ApplicationController
  def some_file
    cookies['fileDownload'] = 'true'

    send_file 'path-to-file-on-server',
      :filename => 'browser-download-file-name',
      :type => 'content-type',
      :x_sendfile => true
  end
end
```

# Samples

* See [jquery_file_download-rails-samples](https://github.com/rcook/jquery_file_download-rails-samples)
for detailed step-by-step instructions and sample application.

# Usage

With the gem installed, the `$.fileDownload` jQuery plugin is available in the browser.

# More details

* [`jquery.fileDownload.js` at GitHub](https://github.com/johnculviner/jquery.fileDownload)
* [John Culviner's original blog post](http://johnculviner.com/post/2012/03/22/Ajax-like-feature-rich-file-downloads-with-jQuery-File-Download.aspx)

# Licence

`jquery_file_download-rails` is released under the MIT licence.

