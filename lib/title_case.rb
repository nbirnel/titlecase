module TitleCase

  class Version
    MAJOR = 0 
    MINOR = 2 
    PATCH = 5 

    class << self
      def to_s
        [MAJOR, MINOR, PATCH].join('.')
      end
    end
  end

  VERSION = Version.to_s

end


class String
  ##
  # title_case_word upcases the first alpha character in a string.

  def title_case_word
    # the non-alpha beginning lets us capitalize "'the'" to "'The'",
    self.sub(/^[^[:alpha:]]*[[:alpha:]]/){|first| first.upcase}
  end

  ##
  # title_case_line capitalizes each 'word' in a string,
  # except for words which already have an upper case letter somewhere in them,
  # and except for short articles, prepositions, conjugations and abbreviations
  # which are not the first word of the string.
  
  def title_case_line
    art  = "(a)|(an)|(the)"
    prep = "(on)|(in)|(to)|(by)|(for)|(at)|(of)|(as)|(off)|(as)|(out)|(up)"
    part = "(if)"
    conj = "(and)|(but)|(nor)|(or)|(yet)|(so)"
    abbr = "(re)|(w)|(etc)|(v)|(vs)"
    ignore_raw = '(' + [art, prep, part, conj, abbr].join('|') + ')'
    punct_wrap = "[^[:alpha:]]*"
    ignore = Regexp.new('^' + punct_wrap + ignore_raw + punct_wrap + '$')

    title_case_words =  self.split.map.with_index do |word, index|
      (word =~ /[[:upper:][:digit:]]/) || ( index > 0 && ignore.match(word)) \
        ? word \
        : word.title_case_word
    end

    title_case_words.join(' ')
  end

end
