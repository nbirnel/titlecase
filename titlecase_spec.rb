require "./titlecase"

#FIXME can't seem to do the fancy ruby native relative path thing
# without naming our program titlecase.rb, which I don't want

describe "tc_word" do
  it "titlecases a single word" do
    tc_word("foo").should eq "Foo"
  end
  
  it "Ignores external apostrophes" do
    tc_word("'thing'").should eq "'Thing'"
  end

  it "sees internal apostrophes" do
    tc_word("don't").should eq "Don't"
  end

end

describe "tc_line" do
  it "basically works" do
    tc_line("do it").should eq "Do It"
  end

  it "ignores short preposition, conjunction, and articles in middle " do
    tc_line("go to"). should eq "Go to"
  end

  it "capitalizes the first word even it it's on the ignore list" do
    tc_line("to France").should eq "To France"
  end

  it "but doesn't capitalize the first word if it's camelcased" do
    tc_line("eTrade is still around").should eq "eTrade Is Still Around"
  end

  it "Ignores external apostrophes in exceptions" do
    tc_line("don't go 'to' Chicago").should eq "Don't Go 'to' Chicago"
  end

  it "retains punctuation" do
    tc_line("shazam! what? don't go, young man...").should eq "Shazam! What? Don't Go, Young Man..."
  end

  it "ignores mixed case even as first word" do
    tc_line("iPhone").should eq "iPhone"
  end

  it "doesn't falsely capitalize Dutch abbreviations" do
    pending
    tc_line("Mr 't Horne went to 's Grave").should eq "Mr 't Horne went to 's Grave"
  end
end
