# Colorizr
Colorizr is a simple gem to print text in colors into the command prompt.

## Features
* Get colored text with methods that can be called from strings.
* Get an example of colored text.
* Get a list of color methods currently supported by Colorizr.

## Getting started
At the command prompt install with `gem install 'colorizr'`

## Usage
When installed, call it using `require 'colorizr'`.

Puts strings the usual way but calling a color method from the string.
Example:

    greeting = "Hello"
    puts greeting.green
    #or just
    puts "Hello".blue

To get a list of the color methods currently available call the `colors` method from String, `String.colors`.

Finally, if you want a sample of how the colors look use `String.sample _colors`