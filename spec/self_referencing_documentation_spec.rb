require 'rspec'
require_relative '../lib/self_referencing_document'

describe 'Self-referencing-documentation' do

  before do
    @dictionary = '{
      "word": {
      "definition": "a {collection} of {letters}",
      "url": "//example.com/word"
    },
      "letter": {
      "definition": "a character representing one or more of the sounds used in speech; any of the symbols of an alphabet",
      "url": "//example.com/letter"
    },
      "collection": {
      "definition": "a group of things or people",
      "url": "//example.us/collection"
    }
    }'
  end

  it 'allows user to look up words, return a def and urls of related words' do
    self_ref_doc = SelfRefDoc.new('word', @dictionary)
    actual = self_ref_doc.define
    expected = {definition: "a collection of letters", see_also: ["//example.com/collection", "//example.com/letter"]}
    expect(actual).to eq(expected)
  end

end
