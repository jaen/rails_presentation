#!/usr/bin/env ruby

require 'pry'
require 'debugger'
require 'jazz_hands'

module FieldMutator
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def field_mutator(name, &block)
      var_name = "@#{name}_field".to_sym

      if block_given? then
        callback = block
      end

      define_method name.to_sym do
        return instance_variable_get(var_name)
      end

      define_method "#{name}=".to_sym do |new_value|
        if callback then
          callback.call(new_value, instance_variable_get(var_name))
        end

        instance_variable_set(var_name, new_value)
      end      
    end
  end
end

class Door
  include FieldMutator

  field_mutator :colour do |new_value, old_value|
    if old_value then
      puts "I see a #{old_value} door and I want it painted #{new_value}!"
    end
  end
end

door = Door.new
door.colour = "red"
door.colour = "black"
door.colour = "red again"