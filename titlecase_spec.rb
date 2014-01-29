require "#{File.dirname(__FILE__)}/titlecase"

string = "don't stop thinking about AT&T 't Horne McDonald iPhone globular"

describe "tc_word" do
  it "titlecases a single word" do
    tc_word("foo").should eq "Foo"
  end
end


describe "#split" do
  it "splits strings to words" do
    split(string).should eq ["don't", "stop", "thinking", "about", "AT&T", "'t", "Horne", "McDonald", "iPhone", "globular"]
  end
end

describe "#tc_phrase" do
  it "titlecases two words" do
    tc_phrase("foo bar").should eq ["Foo Bar"]
  end
end
