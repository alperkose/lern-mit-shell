# lern-mit-shell
Helper shell script for learning German Artikels

## Requirements

The shell script is developed with basic bash commands like `wc`, `head`, `tail`, `echo`, so it should work with any Bash environment.

## Running

Simply run

    ./artikels.sh

It will show the word with a `___` in the begining where you will write the artikel. By default it will prompt 10 words and will show you the summary when you're done.

    $ ./artikels.sh
    die Tafel,-n
    👍🏼
    der Sonntag,-e
    👍🏼
    der Freitag,-e
    👍🏼
    die Schwester,-n
    👍🏼
    ___ Fenster,-

If you want to try with more or less than 10 artikels, add the number as an argument:

    ./artikels.sh 15




