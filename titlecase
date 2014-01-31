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
  short_articles = ["a", "an", "the"]
  short_prepositions = ["on", "in", "to", "by", "for", "at", "of", "as", "off", "as", "out", "up" ]
  short_conjunctions = [ "and", "but", "nor", "or", "yet", "so" ]
  abbrevs = ["re", "w", "etc"]
  ignore = short_articles + short_prepositions + short_conjunctions + abbrevs

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
    (word =~ /[[:upper:]]/) || ( index > 0 && ignore.include?(word)) \
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
