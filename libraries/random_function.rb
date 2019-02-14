#require 'rubygems'
#
#module someRandomFunction
#  def random_method
#    RandomMethod2.call(1)
#  end
#
#  module_function :random_method
#end
#
#Chef::Recipe.send(:include, someRandomFunction)
#Chef::Resource.send(:include, someRandomFunction)
#Chef::Provider.send(:include, someRandomFunction)
