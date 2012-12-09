#!/usr/bin/env ruby

module Colourifier
  @@colour_mapping = { :normal => "\e[0m", :red => "\e[31;1m", :green => "\e[32;1m", :yellow => "\e[33;1m", :orange => "\e[35;1m" }

  def self.method_missing(method, *args, &block)
    if @@colour_mapping.keys.include?(method) then
      puts "#{@@colour_mapping[method]}#{([args[0]] * (args[1] || 1)).join(', ')}#{@@colour_mapping[:normal]}"
    else
      super(method, *args, &block)
    end
  end

  def self.responds_to?(method)
    @@colour_mapping.keys.include?(method) || super(sym)
  end
end

def colourify(&block)
  Colourifier.class_eval(&block)
end

colourify do
  red "herp"
  normal "derp", 2
  yellow "hurr", 3
  orange "durr"
end
