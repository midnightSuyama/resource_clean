# ResourceClean

[![Gem Version](https://badge.fury.io/rb/resource_clean.png)](http://badge.fury.io/rb/resource_clean)
[![Dependency Status](https://gemnasium.com/midnightSuyama/resource_clean.png)](https://gemnasium.com/midnightSuyama/resource_clean)
[![Build Status](https://travis-ci.org/midnightSuyama/resource_clean.png?branch=master)](https://travis-ci.org/midnightSuyama/resource_clean)

Delete resource file and xattr

* .AppleDouble
* .DS_Store
* .fseventsd
* .Spotlight-V100
* .TemporaryItems
* .Trashes
* .VolumeIcon.icns
* Desktop.ini
* Thumbs.db

and, "._" prefix file

## Installation

Add this line to your application's Gemfile:

    gem 'resource_clean'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install resource_clean

## Usage

	$ resource_clean [directory]

## Contributing

1. Fork it ( https://github.com/midnightSuyama/resource_clean/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
