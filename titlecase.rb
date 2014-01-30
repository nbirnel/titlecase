#!/usr/bin/env ruby

def tc_word word, index = 1
  word.sub(/^[^[:alpha:]]*[[:alpha:]]/){|first| first.upcase}
end

def tc_line line
  short_articles = ["a", "an", "the"]
  short_prepositions = ["on", "in", "to", "by", "for", "at", "of", "as", "off", "as", "out", "up" ]
  short_conjunctions = [ "and", "but", "nor", "or", "yet", "so" ]
  # write my own splitter to get rid of this punctuation junk? No... do as regex?
  abbrevs = ["re", "re:", "w/", "w", "etc.", "etc"]
  ignore = short_articles + short_prepositions + short_conjunctions + abbrevs

  tc_words =  line.split.map.with_index do |word, index|
    (word =~ /[[:upper:]]/) || ( index > 0 && ignore.include?(word)) \
      ? word \
      : tc_word(word)
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
