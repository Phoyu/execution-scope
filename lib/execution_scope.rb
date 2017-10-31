require 'singleton'

module ExecutionScope
  def self.generate(&block)
    klass = Class.new do
      include Singleton
    end
    # Class setup
    klass.extend  ClassSetup::Execute
    klass.extend  ClassSetup::Modify
    klass.class_eval &block if block_given? 
    return klass
  end
end

module ClassSetup

  module Execute
    def run(&block)
      self.instance.instance_eval &block if block_given?
    end
  end

  module Modify
    def modify(&block)
      self.class_eval &block if block_given?
    end
  end
end
