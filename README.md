# ReverseWords

Welcome to the `reverse_words` gem!

This gem adds `String#reverse_words` and `String#reverse_words!` to the core Ruby
`String` class.

* `String#reverse_words`: returns a copy of the receiving string object, in which all
words in the sentence are reversed.

* `String#reverse_words!`: like `String#reverse_words`, but returns `nil` and modifies
the receiving string object instead.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'reverse_words'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install reverse_words

## Usage

```
$ bin/console
irb(main):001:0> "the big black cat.".reverse_words
=> "cat black big the."
irb(main):002:0> str = "hello world!"
=> "hello world!"
irb(main):003:0> str.reverse_words!
=> nil
irb(main):004:0> str
=> "world hello!"
```

## Notes

### Time and Space Complexity
Time complexity of the algorithm is `O(n)`, where `n` is the number of characters
in the input string.

The space complexity (while also still `O(n)`) is unfortunately not optimal, as
there are approaches that can work "in place" without copying the string to reverse.
See [here](http://stackoverflow.com/a/47426) for an example implementation of such
an algorithm in C/C++.

### Handling Blanks, Punctuation, and Capitalization

When the words in the input sentence are reversed, all trailing and leading blanks are removed from the input string. The same holds true for duplicate spaces around the words in the input string.
I.e.,

```
> " this is   a  thing that has   blanks ".reverse_words
=> "blanks has that thing a is this"
```

I decided to handle punctuation such that input strings that end in any sequence
of `.`, `!`, or `?`s would remain at the end of the sentence with the reversed word
order. I.e.,

```
> "english has interrobangs!?".reverse_words
=> "interrobangs has english!?"
```
I decided _not_ to address adapting capitalization, though. I.e.:

```
> "Hello world".reverse_words
=> "world Hello"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies.

Then, run `bundle exec rake spec` to run the tests.

You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
