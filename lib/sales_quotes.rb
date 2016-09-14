require 'yaml'

class SalesQuotes
  attr_reader :quotes

  def initialize
    @quotes = symbolize_array(YAML.load_file("#{__dir__}/quotes.yaml")["quotes"])
  end

  def self.random
    SalesQuotes.new.quotes.sample
  end

  private

  def symbolize_array array
    array.map {|a| symbolize_keys(a) }
  end

  def symbolize_keys hash
    new_hash = {}
    hash.each do |key, value|
      new_hash[key.to_sym] = value
    end
    new_hash
  end

end
