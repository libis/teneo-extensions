# Teneo::Extensions

This gem adds several extensions to some of the standard Ruby classes.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add teneo-extensions

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install teneo-extensions

## Usage

To load all extensions do:

```ruby
require 'teneo-extensions'
```

But you can also load the individual class extensions:

### Blanco

```ruby
require 'teneo/extensions/blanco'
```

registers a new method `blanco?` on each object. The method will return true if the object is nil, empty (string, array, hash, ...) or contains only spaces. Arrays and Hashes are considered blanco if they are either empty or all elements (values in the case of Hash) are blanco.

This method is an alternative for Rails' `blank?` method which considers false as blank.

### Blank

```ruby
require 'teneo/extensions/blank'
```

Rails' `blank?` method implementation without all the ActiveSupport requirements.

### Recursive delete

```ruby
require 'teneo/extensions/recursive'
```

Adds methods `recursive_delete` to Array and Hash which deletes elements recursively which match the given block. You can use the methods `blank?` or `blanco?` from above for instance:

```ruby
a = {a: 1, b: nil, c: [1, 2, nil, {x:1, y:nil, z:3}, 5, nil, 7]}
a.recursive_delete(&:blank?)
a
# => {a: 1, c: [1, 2, {x: 1, z: 3}, 5, 7]}
```

### Hash

```ruby
require 'teneo/extensions/hash'
```

Add the following methods to the Hash class:

- `recursive_merge(other_hash)`: merge the `other_hash` with the current hash, recursively
- `recursive_merge!(other_hash)`: in-place version of above
- `reverse_merge(other_hash)`: merge current hash into the `other_hash`
- `reverse_merge!(other_hash)`: in-place version of above
- `apply_defaults(other_hash, &block)`: merge `other_hash` values into current hash, but only if the current value is `blanco?` or `block` returns true
- `apply_defaults!(other_hash, &block)`: in-place version of above
- `symbolize_keys`, `stringify_keys`, `deep_symbolize_keys`, `deep_stringify_keys`, `transform_keys`, `transform_values`, `deep_transform_keys`, `deep_transform_values` and their in-place versions: as implemented by ActiveSupport

### Debugging aids

```ruby
require 'teneo/extensions/debugging_aids'
```

will load Kernel methods:
- `extract_argstring_from(name, call_stack)`: extract the name of the argument of the last caller in the stack
- `dputs(value)`: prints name and value of a variable

### String

```ruby
require 'teneo/extensions/string`
```

String class extensions. Again, heavily inspired by ActiveSupport:

- `camelize(uppercase_first_letter = false)`
- `constantize`
- `dasherize`
- `demodulize`
- `underscore`

Please see the ActiveSupport documentation to find out what they do.

And:

- `sort_form`: creates string better suited for natural sorting.
- `quote`: quotes string for command-line use.
- `escape_for_regexp`: escape string for use in regular expressions.
- `escape_for_string`: escape double quotes for usage in code strings.
- `escape_for_cmd`: escape double quotes for usage in passing through scripts.
- `escape_for_sql`: escape single quotes for usage in SQL statements.
- `dot_net_clean`
- `remove_whitespace`: convert whitespace into underscores.
- `encode_visual`: escape all non-printable characters in hex format.
- `align_left`: align a multi-line string to the left by removind as much spaces as possible from the start of each line.

### Struct

```ruby
require 'teneo/extensions/struct'
```

Adds methods to `Struct` to convert from and to Hash and JSON.

- `set(h={})`: sets each entry of the given hash in the struct.
- `Stuct.from_hash(h)`: create `Struct` object from `Hash`.
- `to_json`: convert into JSON string.
- `Struct.from_json(json)`: create `Struct` object from JSON string.


### Symbol call patch

```ruby
require 'teneo/extensions/symbol'
```

This will allow proc references by symbol to take arguments too. Follow the symbol with `.(args)` to use it. It enables the following to work:

```ruby
[2,3].map(&:+.(10))
# => [12,13]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/libis/teneo-extensions. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/libis/teneo-extensions/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Teneo::Extensions project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/libis/teneo-extensions/blob/main/CODE_OF_CONDUCT.md).
