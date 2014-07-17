class Hash
   def map_pair
      result = Array.new

      self.each_pair do |key, value|
         result << yield(key, value)
      end

      return result
   end
end

class String
   	def super_strip
    	self.gsub(/\s{2,}/, " ").strip
	end

  	def to_nil
    	(self.super_strip.blank?) ? nil : self
  	end
end

class Nil
   def to_nil
      self
   end
end