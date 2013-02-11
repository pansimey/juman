# Juman

Use a sequence of morphemes as an Enumerable object.

## Installation

Add this line to your application's Gemfile:

    gem 'juman'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install juman

## Usage

    require 'juman'

    juman = Juman.new
    text = 'この文を形態素解析してください。'
    result = juman.analyze(text)
    result[0].surface #=> "この"
    result.map{|morpheme| morpheme.surface }
    #=> ["この", "文", "を", "形態", "素", "解析", "して", "ください"]

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
