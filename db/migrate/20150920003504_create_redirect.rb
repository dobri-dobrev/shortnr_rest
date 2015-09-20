class CreateRedirect < ActiveRecord::Migration
 def self.up
   create_table :redirects do |t|
     t.string :url
     t.string :short
     t.timestamps
   end
 end

 def self.down
   drop_table :redirects
 end
end
