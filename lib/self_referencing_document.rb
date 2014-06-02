require 'json'

class SelfRefDoc

  def initialize(dictionary_word, dictionary)
    @dictionary = JSON.parse(dictionary)
    @dictionary_word = dictionary_word
    p @dictionary
    p @dictionary_word
  end

  def define
    raw_definition = @dictionary[@dictionary_word]

    # find words in definition contained within curly braces and save them as a new array
    # look up each word in new array and get the url for that, saved as a url array
    # replace curly braced words with words
    # {:definition => replaced definition, :see_also => [url array]}

    {:definition => raw_definition['definition'], :see_also => []}
  end

end
