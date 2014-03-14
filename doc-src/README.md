title_case
---------

A ruby gem consisting of String methods to title case strings,
including a command-line demonstration utility.

Installation
---------
`gem install title_case`

or, if you want the latest and the greatest, 
or if you want the man page installed:

    git clone https://github.com/nbirnel/titlecase
    cd titlecase
    rake install

(use `sudo` as necessary)

Runtime Requirements
---------
ruby >= 1.9.2

Build Requirements
---------
rake

Developer Requirements
---------
groff

Inspiration and History
---------

This is partially inspired and informed by John Gruber's titlecase: 
<http://daringfireball.net/2008/05/title_case>
and Sam Souder's ruby implementation:
<https://github.com/samsouder/titlecase>

I didn't like a few of the rules in Gruber's version, though.
Major differences are:
  - don't ever downcase anything
  - the last word doesn't get upcased if it is on the exclude list
  - the exclude list is slightly different
  - colons get no special treatment


License
---------
© 2014 Noah Birnel
MIT license 

[![Build Status](https://travis-ci.org/nbirnel/titlecase.png?branch=master)](https://travis-ci.org/nbirnel/titlecase)
[![Code Climate](https://codeclimate.com/github/nbirnel/titlecase.png)](https://codeclimate.com/github/nbirnel/titlecase)
[![Gem Version](https://badge.fury.io/rb/title_case.png)](http://badge.fury.io/rb/title_case)


Man page
---------
