#!/usr/bin/env ruby

# file: phrase_browser.rb

# description: Experimental gem to look up a phrase from a list of words 
#              layed out in an HTML accordion style menu.

require 'htmlcom'
require 'kramdown'


class PhraseBrowser
  using ColouredText

  
  def initialize(s, target_url: '', debug: false)

    @target_url, @debug = target_url, debug

    ignorewords = ["the", "of", "and", "to", "in", "a", "is", "that", "for",
                   "it", "as", "was", "with", "be", "by", "on", "not", "he", 
                   "i", "this", "are", "or","his", "from", "at", "which", 
                   "but", "have", "an", "had", "they", "you", "were", 
                   "their", "one", "all", "we", "can", "her", "has", "there",
                   "been", "if", "more", "when", "will", "would", "who", 
                   "so", "no"]

    h = {}
    a = s.strip.lines.each do |rawx| 

      x = rawx.chomp

      x.downcase.split(/ +/).each do |raw_word|

        word = raw_word[/\w+/]
        next if ignorewords.include? word
        h[word.to_sym] ||= []
        h[word.to_sym] << x

      end

    end

    @a = h.to_a.sort!
  end

  def to_html()    

    doc = Rexle.new('<accordion/>')

    @a.each do |word, raw_phrases|
    
      phrases = raw_phrases.map do |x|

        if block_given? then
          yield(x)
        else
          phrase = x[/[^#]+/]
          "* [%s](%s=%s)" % [phrase, @target_url, URI.encode(phrase)]
        end

      end.join("\n")

      e = Rexle::Element.new('panel')
      e.attributes[:title] = word.to_s
      e.add Rexle.new(Kramdown::Document.new(phrases).to_html).root
      doc.root.add e

    end

    puts doc.root.xml.debug if @debug
    HtmlCom::Accordion.new(doc.root.xml).to_html

  end
end

