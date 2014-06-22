class Hash
   def map_pair
      result = Array.new

      self.each_pair do |key, value|
         result << yield(key, value)
      end

      return result
   end
end