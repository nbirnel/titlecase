title_case
---------

A ruby gem consisting of String methods to title case strings,
including a command-line demonstration utility.

Command Line Usage:

    echo capitalize a phrase like a newspaper editor would  | titlecase

    Capitalize a Phrase Like a Newspaper Editor Would

Installation
---------
`gem install title_case`

or, if you want the latest and the greatest, 
or if you want the man page installed:

    git clone https://github.com/titlecase
    cd titlecase
    rake install

(use `sudo` as necessary)

Runtime Requirements
---------
ruby 

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


Man page
---------
<html>
<head>
<meta name="generator" content="groff -Thtml, see www.gnu.org">
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<meta name="Content-Style" content="text/css">
<title>titlecase</title>

</head>
<body>

<h1 align="center">titlecase</h1>

<a href="#NAME">NAME</a><br>
<a href="#SYNOPSIS">SYNOPSIS</a><br>
<a href="#DESCRIPTION">DESCRIPTION</a><br>
<a href="#OPTIONS">OPTIONS</a><br>
<a href="#EXAMPLES">EXAMPLES</a><br>
<a href="#SEE ALSO">SEE ALSO</a><br>
<a href="#BUGS">BUGS</a><br>
<a href="#LICENSE">LICENSE</a><br>

<hr>


<h2>NAME
<a name="NAME"></a>
</h2>


<p style="margin-left:11%; margin-top: 1em">titlecase
&minus; capitalize a phrase like a newspaper editor
would</p>

<h2>SYNOPSIS
<a name="SYNOPSIS"></a>
</h2>


<p style="margin-left:11%; margin-top: 1em"><b>titlecase
[FILE]</b></p>

<h2>DESCRIPTION
<a name="DESCRIPTION"></a>
</h2>



<p style="margin-left:11%; margin-top: 1em"><b>titlecase</b>
converts a byte-stream to title-casing &mdash; the first
letter of most words is converted to upper-case. Exceptions
are:</p>

<p style="margin-left:22%; margin-top: 1em">words that
already have some capitalization (Jones, AT&amp;T, iPhone)
or numbers (x0xb0x, left4dead)</p>

<p style="margin-left:22%; margin-top: 1em">a list of short
(less than 4 characters) conjunctions, prepositions, and
articles; unless they are at the beginning of the
byte-stream</p>

<h2>OPTIONS
<a name="OPTIONS"></a>
</h2>


<p style="margin-left:11%; margin-top: 1em">none</p>

<h2>EXAMPLES
<a name="EXAMPLES"></a>
</h2>


<p style="margin-left:22%; margin-top: 1em"><b>echo
&rsquo;old McDonald had a farm&rsquo; | titlecase</b></p>

<p style="margin-left:22%; margin-top: 1em">Old McDonald
Had a Farm</p>

<h2>SEE ALSO
<a name="SEE ALSO"></a>
</h2>


<p style="margin-left:11%; margin-top: 1em"><i>ruby(1) <br>
http://daringfireball.net/2008/05/title_case <br>
http://rubygems.org/gems/titlecase</i></p>

<h2>BUGS
<a name="BUGS"></a>
</h2>


<p style="margin-left:11%; margin-top: 1em">Capitalizes
Dutch abbreviations <b>&rsquo;s, &rsquo;t, &rsquo;n.</b>
Probably others.</p>

<h2>LICENSE
<a name="LICENSE"></a>
</h2>


<p style="margin-left:11%; margin-top: 1em">Copyright 2014
Noah Birnel</p>

<p style="margin-left:11%; margin-top: 1em">MIT license</p>
<hr>
</body>
</html>
