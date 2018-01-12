# ENV['RAILS_ENV'] = "development"

every 1.minute do
	rake "delete:unpaid_orders", :environment => 'staging' 
end	