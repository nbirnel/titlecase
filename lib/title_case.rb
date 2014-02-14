#!/usr/bin/env ruby

def titlecase_word word, index = 1
  # the non-alpha beginning lets us capitalize "'the'" to "'The'",
  word.sub(/^[^[:alpha:]]*[[:alpha:]]/){|first| first.upcase}
end

def titlecase_line line
  art  = "(a)|(an)|(the)"
  prep = "(on)|(in)|(to)|(by)|(for)|(at)|(of)|(as)|(off)|(as)|(out)|(up)"
  part = "(if)"
  conj = "(and)|(but)|(nor)|(or)|(yet)|(so)"
  abbr = "(re)|(w)|(etc)|(v)|(vs)"
  ignore_raw = '(' + [art, prep, part, conj, abbr].join('|') + ')'
  punct_wrap = "[^[:alpha:]]*"
  ignore = Regexp.new('^' + punct_wrap + ignore_raw + punct_wrap + '$')

  titlecase_words =  line.split.map.with_index do |word, index|
    (word =~ /[[:upper:][:digit:]]/) || ( index > 0 && ignore.match(word)) \
      ? word \
      : titlecase_word(word)
  end

  titlecase_words.join(' ')
end

# Boilerplate for adding flags.
loop { case ARGV[0]
  when /--/ then ARGV.shift; break
  when /^-/ then usage("Unknown option: #{ARGV[0].inspect}")
  else break
end; }

while gets() do
  line = $_.chomp
  tced = titlecase_line line
  puts tced
end   
