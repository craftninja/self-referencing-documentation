require 'json'

class SelfRefDoc

  def initialize(dictionary_word, dictionary)
    @dictionary = JSON.parse(dictionary)
    @dictionary_word = dictionary_word
  end

  def define
    raw_definition = @dictionary[@dictionary_word]
    see_also_words_raw = raw_definition['definition'].scan(/{[a-z]+}/)
    see_also_words = see_also_words_raw.collect {|word| word.gsub(/{|}/, '').chomp('s')}
    see_also_links = see_also_words.collect {|word| "//example.com/#{word}"}
    definition = raw_definition['definition'].gsub(/{|}/, '')
    {:definition => definition, :see_also => see_also_links}
  end

end
