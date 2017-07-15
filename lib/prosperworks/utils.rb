require 'json'
require 'json/add/core' # enables serializing of Time and other things

module ProsperWorks

  #
  # Modified version of the Jsonable gem, all credit goes to the
  # authors of that gem
  #
  module JSONable

    def to_json(*a)
      result = {}
      result['json_class'] = self.class.name
      self.instance_variables.each do |var|
        trimmed_var = var.to_s.gsub!("@", "")
        result[trimmed_var] = self.instance_variable_get var
      end
      result.to_json(*a)
    end

  end

end