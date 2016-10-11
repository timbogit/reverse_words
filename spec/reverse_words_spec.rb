require "spec_helper"

describe ReverseWords do

  it "has a version number" do
    expect(ReverseWords::VERSION).not_to be nil
  end

  let(:str)  { "the big black cat" }
  let(:reversed_str)  { "cat black big the" }

  describe "String#reverse_words" do
    it "reverses 'the big black cat' correctly" do
      expect(str.reverse_words).to eq(reversed_str)
    end

    it "reverses the empty string correctly" do
      expect("".reverse_words).to eq("")
    end

    it "handles punctuation correctly" do
      expect("#{str}!".reverse_words).to eq("#{reversed_str}!")
    end

    it "handles more than one trailing punctuation character" do
      expect("#{str}!.?".reverse_words).to eq("#{reversed_str}!.?")
    end

    it "ignores blanks correctly" do
      expect("the big   black    cat ! ".reverse_words).to eq("#{reversed_str}!")
    end

    it "does not alter the string object" do
      original = str
      str.reverse_words
      expect(str).to eq(original)
    end
  end

  describe "String#reverse_words!" do

    it "returns nil" do
      expect(str.reverse_words!).to be_nil
    end

    it "mutates the string object" do
      expect(str.reverse_words!).to be_nil
      expect(str).to eq(reversed_str)
    end

    it "shortens the string eliminating blanks" do
      with_blanks = " the big  black    cat !"
      with_blanks.reverse_words!
      expect(with_blanks).to eq("#{reversed_str}!")
      expect(with_blanks.length).to eq("#{reversed_str}!".length)
    end
  end
end
