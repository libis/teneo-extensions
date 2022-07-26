# frozen_string_literal: true

class Object
  def blank?
    respond_to?(:empty?) ? !!empty? : !self
  end unless method_defined? :blank? 
end
