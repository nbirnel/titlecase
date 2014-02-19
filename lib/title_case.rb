class String

  def title_case_word
    # the non-alpha beginning lets us capitalize "'the'" to "'The'",
    self.sub(/^[^[:alpha:]]*[[:alpha:]]/){|first| first.upcase}
  end

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
