class RakeInvoker
	def self.run(args)
		rake_name 	= args.keys..to_s
		task_name	= args.values.first.to_s

		params		= args.select{|key, value| key.to_s != rake_name}
							.map_pair{|k, v| k.to_s + "=" + value}
							.join(" ")

		Thread.new do
			`RAILS_ENV=#{Rails.env} bundle exec rake #{rake_name}:#{task_name} #{params}`
			exit
		end
	end
end