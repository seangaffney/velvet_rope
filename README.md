# VelvetRope

VelvetRope is a renderer to complement and enhance Redcarpet's default HTML
renderer. For now, it adds support for emoji and syntax-highlighting.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'velvet_rope'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install velvet_rope

## Usage

### Syntax Highlighting

VelvetRope uses [pygments.rb](https://github.com/tmm1/pygments.rb) to provide
syntax highlighting support. In order to turn this on, just pass the
`highlight_syntax` option into VelvetRope on instantiation.

```ruby
Redcarpet::Render::VelvetRope.new(:highlight_syntax => true)
```

You will need to generate the CSS for the Pygments theme that you would like to
use for highlighting. You can find instructions on how to do that in the
[pygments.rb documentation](https://github.com/tmm1/pygments.rb#usag://github.com/tmm1/pygments.rb#usage).

### Emoji

VelvetRope uses [gemoji](https://github.com/github/gemoji) to provide emoji
support. In order to turn this on, just pass the `emoji` option into VelvetRope
on instantiation.

```ruby
Redcarpet::Render::VelvetRope.new(:emoji => true)
```

You will need to add the emoji images to your app. There are instructions on how
to do so in the [gemoji documentation](https://github.com/github/gemoji#installation).

Also, the default template for emoji images is:


```ruby
'<img alt="' + name + '" src="' + "/images/emoji/#{name}.png" + '" style="vertical-align:middle" width="20" height="20" />'
```

If you would like to define your own template, you could do something like the 
following in an initializer:

```ruby
module Redcarpet
  module Render
    class VelvetRope < HTML
      def emoji_template(name)
        '<img class="emoji" src="' + "/images/emoji/#{name}.png" + '" width="20" height="20" />'
      end
    end
  end
end
```

### HTML? But what about XHTML?!

Fear not, my friend. Just pass the `xhtml` option into the VelvetRope renderer on
instantiation.

  ```ruby
  Redcarpet::Render::VelvetRope.new(:xhtml => true)
  ```

Redcarpet's XHTML renderer is just a shortcut for this very option.

## TODO

Create rake tasks to simplify setup and installation of Pygments themes and emoji
image files.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Licensing

VelvetRope is written by [Sean Gaffney](http://seangaffney.cc) and is under the
MIT License.

The MIT License (MIT)

Copyright (c) Ted Nyman and Aman Gupta, 2012-2013

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in the
Software without restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
