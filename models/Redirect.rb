class Redirect < ActiveRecord::Base
	validates :url, presence: true
	def self.build_redirect(url)
		params = {}
		params[:short] = generate_rand_string()
		params[:url] = url
		redirect = Redirect.create(params)
	end
	def self.generate_rand_string
		rand_string = (0...8).map { (97 + rand(26)).chr }.join
		while Redirect.exists?(:short => rand_string)
			rand_string = (0...8).map { (97 + rand(26)).chr }.join		
		end
		rand_string
	end
end