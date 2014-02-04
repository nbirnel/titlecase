#!/usr/bin/env ruby

def tc_word word, index = 1
  # the non-alpha beginning lets us capitalize "'the'" to "'The'",
  # but it will also capitalise a Dutch "'s", which I believe is incorrect.
  word.sub(/^[^[:alpha:]]*[[:alpha:]]/){|first| first.upcase}
end

def tc_line line
  #FIXME
  # I think these will end up being a regex object so I can wrap punctuation
  # around the words and still catch them. How, then, will I exclude the 
  # Dutch abbreviations? That is a very obscure corner case, so I will ignore
  # it for the moment.
  art = "(a)|(an)|(the)"
  prep = "(on)|(in)|(to)|(by)|(for)|(at)|(of)|(as)|(off)|(as)|(out)|(up)"
  conj = "(and)|(but)|(nor)|(or)|(yet)|(so)"
  abbr = "(re)|(w)|(etc)"
  ignore_raw = '(' + [art, prep, conj, abbr].join('|') + ')'
  punct_wrap = "[^[:alpha:]]*"
  ignore = Regexp.new('^' + punct_wrap + ignore_raw + punct_wrap + '$')

  # I had to draw myself a chart to get this right:
  #|--------------
  #|        0 >0
  #|       -----
  #| U  ig| N  N
  #| U !ig| N  N
  #| l  ig| Y  N
  #| l !ig| Y  Y
  #
  # but this is the cleanest way I could think of to represent it in code.
  tc_words =  line.split.map.with_index do |word, index|
    (word =~ /[[:upper:][:digit:]]/) || ( index > 0 && ignore.match(word)) \
      ? word \
      : tc_word(word)
  end
  tc_words.join(' ')
end

# Boilerplate for adding flags.
loop { case ARGV[0]
  when /--/ then ARGV.shift; break
  when /^-/ then usage("Unknown option: #{ARGV[0].inspect}")
  else break
end; }

while gets() do
  line = $_.chomp
  tced = tc_line line
  puts tced
end   
