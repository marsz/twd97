[![Build Status](https://travis-ci.org/marsz/twd97.svg)](https://travis-ci.org/marsz/twd97)

Installation
============

```ruby
gem 'twd97'
```

Usage
============

```ruby
Twd97.convert(302745.088, 2771185.18)
# { lat: 25.047902, lng: 121.522737 }

Twd97.convert("304225.666", "2769534.8")
# { lat: 25.032950, lng: 121.537345 }
```
