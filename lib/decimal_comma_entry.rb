# DecimalCommaEntry
module DecimalCommaFix
  module ClassMethods
    def decimal_comma_entry(*attributes)
      attributes.each do |attribute|
        define_method :"#{attribute}=" do |value|
          value.gsub!(',', '.') if value.respond_to?(:gsub)
          if self.respond_to?(:write_attribute)
            write_attribute attribute, value
          else
            instance_variable_set :"@#{attribute}", value
          end
        end
      end
    end
  end
  
  def self.included(receiver)
    receiver.extend         ClassMethods
  end
end

ActiveRecord::Base.send :include, DecimalCommaFix
