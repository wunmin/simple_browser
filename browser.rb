require 'net/http'
require 'nokogiri'
require "uri"

require_relative 'utils'

class Browser
  def run!
    print "url> "
    input_url = gets.chomp
    page = Page.new(input_url)
    page.fetch!

    page.title
    page.content_length
    page.links
  end
end

Browser.new.run!