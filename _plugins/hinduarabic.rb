#!/bin/env ruby
# encoding: utf-8

module Jekyll
  module HinduArabicFilter

    def habify(input)
      input = input.to_s
      source = {"1" => "۱", "2" => "۲", "3" => "۳", "4" => "۴", "5" => "۵", "6" => "۶", "7" => "۷", "8" => "۸", "9" => "۹", "0" => "۰"}
      for x in source.keys
        if input.include? x
          input = input.gsub(x, source[x])
        end
      end
      return input
    end
  end
end

Liquid::Template.register_filter(Jekyll::HinduArabicFilter)

