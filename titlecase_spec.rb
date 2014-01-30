require "#{File.dirname(__FILE__)}/titlecase"

string = "don't stop thinking about AT&T 't Horne McDonald iPhone globular"

describe "tc_word" do
  it "titlecases a single word" do
    tc_word("foo").should eq "Foo"
  end
  
  #I think I have to write my own splitter. Or have tc_word do the wrapped 
  #punctuation handling?
  it "Ignores external apostrophes" do
    pending
    tc_line("'thing'").should eq "'Thing'"
  end

  it "sees internal apostrophes" do
    tc_line("don't").should eq "Don't"
  end

  it "ignores camelcase" do
    tc_line("iPhone"). should eq "iPhone"
  end

  it "ignores short preposition, conjunction, and articles" do
    tc_line("to"). should eq "to"
  end

end

describe "tc_line" do
  it "basically works" do
    tc_line("do it").should eq "Do It"
  end

  it "retains punctuation" do
    tc_line("shazam! what? don't go, young man...").should eq "Shazam! What? Don't Go, Young Man..."
  end

end
