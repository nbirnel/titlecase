load  "#{File.dirname(__FILE__)}/../lib/title_case.rb"

#FIXME can't seem to do the fancy ruby native relative path thing
# without naming our program titlecase.rb, which I don't want

describe "titlecase_word" do
  it "titlecases a single word" do
    titlecase_word("foo").should eq "Foo"
  end
  
  it "Ignores external apostrophes" do
    titlecase_word("'thing'").should eq "'Thing'"
  end

  it "sees internal apostrophes" do
    titlecase_word("don't").should eq "Don't"
  end

end

describe "titlecase_line" do
  it "basically works" do
    titlecase_line("do it").should eq "Do It"
  end

  it "ignores short preposition, conjunction, and articles in middle " do
    titlecase_line("go to").should eq "Go to"
  end

  it "ignores 'words' with mixed numbers" do
    titlecase_line("buy me a x0xb0x").should eq "Buy Me a x0xb0x"
  end

  it "capitalizes the first word even it it's on the ignore list" do
    titlecase_line("to France").should eq "To France"
  end

  it "but doesn't capitalize the first word if it's camelcased" do
    titlecase_line("eTrade is still around").should eq "eTrade Is Still Around"
  end

  it "Ignores external apostrophes in exceptions" do
    titlecase_line("don't go 'to' Chicago").should eq "Don't Go 'to' Chicago"
  end

  it "retains punctuation" do
    titlecase_line("shazam! what? don't go, young man...").should eq "Shazam! What? Don't Go, Young Man..."
  end

  it "ignores mixed case even as first word" do
    titlecase_line("iPhone").should eq "iPhone"
  end

  it "doesn't falsely capitalize Dutch abbreviations" do
    pending
    titlecase_line("Mr 't Horne went to 's Grave").should eq "Mr 't Horne went to 's Grave"
  end
end
