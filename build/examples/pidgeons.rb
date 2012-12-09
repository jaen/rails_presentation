#!/usr/bin/env ruby

module PidgeonSwag
  def add_swag
    if @pidgeon then
      @pidgeon = @pidgeon.gsub(/pidgeon/, 'swag \0')
      puts "Swag added to your pidgeon!"
    else
      puts "No pidgeon to add swag to!"
    end
  end
end

module Pidgeon
  def be_pidgeon
    @pidgeon ||= "Being all pidgeon and shit"
    puts @pidgeon
  end
end

class CityFace
  include Pidgeon
  include PidgeonSwag
end

class LameassPidegon
  include Pidgeon
end

cf = CityFace.new
cf.be_pidgeon
cf.add_swag
cf.be_pidgeon
puts "###"
lp = LameassPidegon.new
lp.be_pidgeon
begin #odpowiednik try/catch; finally => ensure
  lp.add_swag
rescue
  puts "Lameass pidgeons cannot into swag!"
end
lp.be_pidgeon
LameassPidegon.send(:include, PidgeonSwag)
lp.add_swag
lp.be_pidgeon