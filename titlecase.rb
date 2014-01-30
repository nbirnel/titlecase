#!/usr/bin/env ruby

def tc_word word, override_ignores = 1
  short_articles = ["a", "an", "the"]
  short_prepositions = ["on", "in", "to", "by", "for", "at", "of", "as", "off", "as", "out", "up" ]
  short_conjunctions = [ "and", "but", "nor", "or", "yet", "so" ]
  # write my own splitter to get rid of this punctuation junk? No... do as regex?
  abbrevs = ["re", "re:", "w/", "w", "etc.", "etc"]
  ignore = short_articles + short_prepositions + short_conjunctions + abbrevs

  case word
  when /[[:upper:]]/
    word
  when *ignore
    word
  else
    word.sub(/^[^[:alpha:]]*[[:alpha:]]/){|first| first.upcase}
  end
end

def tc_line line
  tc_words =  line.split.map.with_index do |word, index|
    tc_word(word, index) 
  end
  tc_words.join(' ')
end

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
