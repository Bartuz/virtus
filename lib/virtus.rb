require 'pathname'
require 'set'
require 'date'
require 'time'
require 'bigdecimal'
require 'bigdecimal/util'

module Virtus
  module Undefined; end

  # Extends base class with Attributes and Chainable modules
  #
  # @param [Object] base
  #
  # @api private
  def self.included(base)
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)
    base.extend(Support::Chainable)
  end

  # Returns a Virtus::Attributes::Object sub-class based on a name or class
  #
  # @param [Class,String] class_or_name
  #   name of a class or a class itself
  #
  # @return [Class]
  #   one of the Virtus::Attributes::Object sub-class
  #
  # @api semipublic
  def self.determine_type(class_or_name)
    if class_or_name.is_a?(Class) && class_or_name < Attribute::Object
      class_or_name
    elsif Attribute.const_defined?(name = class_or_name.to_s)
      Attribute.const_get(name)
    end
  end
end

dir = Pathname(__FILE__).dirname.expand_path

require dir + 'virtus/support/chainable'
require dir + 'virtus/class_methods'
require dir + 'virtus/instance_methods'

require dir + 'virtus/typecast/boolean'
require dir + 'virtus/typecast/numeric'
require dir + 'virtus/typecast/time'

require dir + 'virtus/attribute'
require dir + 'virtus/attribute/object'
require dir + 'virtus/attribute/array'
require dir + 'virtus/attribute/boolean'
require dir + 'virtus/attribute/date'
require dir + 'virtus/attribute/date_time'
require dir + 'virtus/attribute/numeric'
require dir + 'virtus/attribute/decimal'
require dir + 'virtus/attribute/float'
require dir + 'virtus/attribute/hash'
require dir + 'virtus/attribute/integer'
require dir + 'virtus/attribute/string'
require dir + 'virtus/attribute/time'
