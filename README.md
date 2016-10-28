# SoapAdapters

Defines a way to interact with different SOAP gems.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'savon' # Currently, only Savon is supported. In the future, you will install the gem you need.
gem 'soap_adapters'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install soap_adapters

## Usage

```ruby
require "soap_adapters/savon"

adapter = SoapAdapters::Savon.new(
  wsdl: "https://myservice.com?WSDL",
  logger: MyLogger.new,
  log: false,
  ssl_version: :TLSv1, # optional; defaults to :TLSv1,
  open_timeout: 30,
  read_timeout: 10
)

response = adapter.call(:make_reservation, message: {username: "abc"})

adapter.last_xml_request # Returns the XML of the last request

response.xml # Returns the XML of the response
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/soap_adapters/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

Copyright 2015 G5

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
