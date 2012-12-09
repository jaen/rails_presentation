#!/usr/bin/env ruby
n = 10_000
stay = switch = 0
 

n.times.zip (['th', 'st', 'nd', 'rd'] + ['th'] * 6).cycle do |i, cardinal|
  puts "#{i}#{cardinal} iteration"
  (doors = [:goat] * 3)[rand 3] = :car 
  guess = rand 3
 
  begin shown = rand 3 end while shown == guess || doors[shown] == :car
  stay += 1 if doors[guess] == :car
  switch += 1 if doors[3 - guess - shown] == :car         
end
 
puts "Staying wins %.2f%% of the time."   % (100.0 * stay   / n)
puts "Switching wins %.2f%% of the time." % (100.0 * switch / n)