# Minitest::Cc o Minitest Code Coverage

Minitest::Cc is a plugin for [Minitest](https://github.com/minitest/minitest) that provide a very simple and minimalism measure of code coverage by your tests.

**You need to keep in mind that this information is only a reference and don't represent how effective are your tests**.


## Installation

Add it into your Gemfile:
```ruby
# Gemfile
gem 'minitest-cc'
```

Then you need to require it in the **very top** of your test helper file:

```ruby
require 'minitest/cc'
Minitest::Cc.start

```

## Usage

If you run your tests you will see something like this:

```
Running 24 tests in a single process (parallelization threshold is 50)
Run options: --seed 6319

# Running:

........................

# Coverage:


lines: 95%    branches: 75%     methods: 93%


Finished in 1.875197s, 12.7987 runs/s, 18.6647 assertions/s.
24 runs, 35 assertions, 0 failures, 0 errors, 0 skips
```

### Configuration

#### Coverage mode:
```ruby
Minitest::Cc.start(:lines, :branches, :methods) # this is like look by default
```
  - You can choose whatever you want. I think are very explicit so don't need explanation.


You can configure two aspects more:

* Mode of cc the report:
```ruby
Minitest::Cc.cc_mode = :resume
```
  - It could be `:resume`, the default behavior
  - It could be `:per_file` to get a list of files and his coverage


* Files tracked:
```ruby
Minitest::Cc.tracked_files = [
  './app/**/*.rb',
  './lib/**/*.rb'
]
```
  - Path to your files that should be tested.

This configuration must be do in the helper file of your tests.


## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

## License

The gem is available as open source under the terms of the [GPL-3.0 License](https://www.github.com/a-chacon/minitest-cc/blob/main/LICENSE).
