# encoding: utf-8
require 'spec_helper'

describe Redcarpet::Render::VelvetRope do

  context 'with emoji option set to true' do
    let(:markdown) { Redcarpet::Markdown.new(Redcarpet::Render::VelvetRope.new(:emoji => true)) }

    it 'renders emoji characters' do
      content = 'This should be a :smiley: face.'

      expected = '<p>This should be a <img alt="smiley" src="images/emoji/unicode/1f603.png" style="vertical-align:middle" width="20" height="20" /> face.</p>' + "\n"
      expect(markdown.render(content)).to eq(expected)
    end
  end

  context 'with highlight_syntax option set to true' do
    let(:markdown) { Redcarpet::Markdown.new(Redcarpet::Render::VelvetRope.new(:highlight_syntax => true)) }

    it 'renders highlighted syntax for normal code blocks' do
      content = <<-EOS
This is an example of some Ruby code:

    def my_method
      'my string'.uppercase
    end
      EOS

      expected = %{<p>This is an example of some Ruby code:</p>\n<div class="highlight"><pre><span class="vg">def</span><span class="w"> </span><span class="vg">my_method</span>\n<span class="w">  </span><span class="c1">&#39;my string&#39;.uppercase</span>\n<span class="vg">end</span>\n</pre></div>}
      expect(markdown.render(content)).to eq(expected)
    end
  end

  context 'with highlight_syntax option set to true and with fenced_code_blocks turned on' do
    let(:markdown) { Redcarpet::Markdown.new(Redcarpet::Render::VelvetRope.new(:highlight_syntax => true), :fenced_code_blocks => true) }

    it 'renders highlighted syntax for fenced code blocks' do
      content = <<-EOS
This is an example of some Ruby code in a fenced code block:

```ruby
def my_method
  'my string'.uppercase
end
```
      EOS

      expected = %{<p>This is an example of some Ruby code in a fenced code block:</p>\n<div class=\"highlight\"><pre><span class=\"k\">def</span> <span class=\"nf\">my_method</span>\n  <span class=\"s1\">&#39;my string&#39;</span><span class=\"o\">.</span><span class=\"n\">uppercase</span>\n<span class=\"k\">end</span>\n</pre></div>}
      expect(markdown.render(content)).to eq(expected)
    end

    it "gracefully handles invalid lexers" do
      content = <<-EOS
```jquery
def my_method
  'my string'.uppercase
end
```
      EOS

      expected = %{<div class="highlight"><pre><span class="vg">def</span><span class="w"> </span><span class="vg">my_method</span>\n<span class="w">  </span><span class="c1">&#39;my string&#39;.uppercase</span>\n<span class="vg">end</span>\n</pre></div>}
      expect(markdown.render(content)).to eq(expected)
    end
  end

end
