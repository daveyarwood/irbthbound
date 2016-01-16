# irbthbound

For reasons I don't fully comprehend, I've always been mega-obsessed with [EarthBound](https://en.wikipedia.org/wiki/EarthBound), a quirky RPG for the Super NES, released in 1995. I also greatly enjoy text adventure games in the vein of [Zork](https://en.wikipedia.org/wiki/Zork).

In 2012, I decided it would be fun to write a port of EarthBound as a text adventure game. I worked on it for a little bit and then promptly got bored and moved onto something else.

In 2016, I stumbled upon the code I had written and decided to play around with it a little more. In the course of refactoring the (admittedly terrible) Ruby code I had hacked up several years prior, I came upon the realization that, in lieu of writing my own interactive text adventure environment from scratch, I could hijack Ruby's interactive shell, [irb](https://en.wikipedia.org/wiki/Interactive_Ruby_Shell) and re-purpose it as a text adventure engine. Thanks to the open-ness and extensibility of irb and the Ruby language itself, this actually turned out to be pretty doable. Commands like `look`, `attack`, and `inventory` could be implemented as functions in the context of the shell environment. Thus, **IRBTHBOUND** was born.

(I actually ended up using [Pry](http://pryrepl.org/) for the extra flexibility it provides over `irb`, like being able to redefine the prompt dynamically, etc. Perhaps it's a bit of a stretch to still call this **irb**thbound, but hey -- close enough, right!?)

I've tried to remain as true to the spirit of EarthBound as possible with this port. In the interest of making the game mechanics as similar to the SNES game as possible, I have researched and translated known formulas for things like the probability of events happening during battle, damage calculation, level-up curves for each character, etc.

## Installation

Prerequisites: Ruby, Bundler

Run `gem install irbthbound` to grab the latest release.

## How to Play

Running `irbthbound` with no arguments will start a new game.

As you're playing, you'll be able to save the game, which will write some slightly encrypted game data to a file on your hard drive. To pick back up where you left off, run `irbthbound /path/to/the/file.sav`.

## Development

Clone this repo and run `bundle install` to install dependencies.

### REPL

`bundle exec bin/console` will get you into a development REPL.

### Game

You can run `irbthbound` without installing it to your system (and including any changes you've made locally) by running `bundle exec exe/irbthbound`.

### Local Build

`rake build && rake install` builds what you've got and installs it locally, including the `irbthbound` executable, which you can then run.

### Deployment

`rake release` to deploy to http://rubygems.org.

## Contributing

1. [Fork this repo](https://github.com/daveyarwood/irbthbound/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

# License

*Earthbound: The War Against Giygas!* is copyright 1994-1995 Shigesato Itoi / APE

This is a totally unofficial port, in no way endorsed by Itoi, APE, or Nintendo. Consider it a work of interactive fan-fiction.

Programmed by Dave Yarwood, 2012-2016
