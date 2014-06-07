module ApplicationHelper
	# A simple function to generate a title
	def title(value="")
		if block_given?
			return content_tag :h1 do 
				yield
			end
		else
			return content_tag :h1, value
		end
	end
end
