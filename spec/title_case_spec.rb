load  "#{File.dirname(__FILE__)}/../lib/title_case.rb"

#FIXME can't seem to do the fancy ruby native relative path thing
# without naming our program title_case.rb, which I don't want

describe "title_case_word" do
  it "title_cases a single word" do
    "foo".title_case_word.should eq "Foo"
  end
  
  it "Ignores external apostrophes" do
    "'thing'".title_case_word.should eq "'Thing'"
  end

  it "sees internal apostrophes" do
    "don't".title_case_word.should eq "Don't"
  end

end

describe "title_case_line" do
  it "basically works" do
    "do it".title_case_line.should eq "Do It"
  end

  it "ignores short preposition, conjunction, and articles in middle " do
    "go to".title_case_line.should eq "Go to"
  end

  it "ignores 'words' with mixed numbers" do
    "buy me a x0xb0x".title_case_line.should eq "Buy Me a x0xb0x"
  end

  it "capitalizes the first word even it it's on the ignore list" do
    "to France".title_case_line.should eq "To France"
  end

  it "but doesn't capitalize the first word if it's camelcased" do
    "eTrade is still around".title_case_line.should eq "eTrade Is Still Around"
  end

  it "Ignores external apostrophes in exceptions" do
    "don't go 'to' Chicago".title_case_line.should eq "Don't Go 'to' Chicago"
  end

  it "retains punctuation" do
    "shazam! what? don't go, young man...".title_case_line.should eq "Shazam! What? Don't Go, Young Man..."
  end

  it "ignores mixed case even as first word" do
    "iPhone".title_case_line.should eq "iPhone"
  end

  it "doesn't falsely capitalize Dutch abbreviations" do
    pending
    "Mr 't Horne went to 's Grave".title_case_line.should eq "Mr 't Horne went to 's Grave"
  end
end
