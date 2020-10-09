Basically [Autochords](https://autochords.com/) but in Ruby.

# Building

You'll need all this installed:

- [Ruby](https://www.ruby-lang.org/en/)
- [RSpec](https://rspec.info/)
- [Rubocop](https://rubocop.org/)
- [Yard](https://yardoc.org/)

TL;DR:

```sh
gem install yard
bundle install --binstubs
gem install rubocop
```

The `build_all` rake task will run Rubocop, RSpec, and Yard:

```sh
rake build_all
```

# Running

```sh
ruby ./demo/demo.rb
```
