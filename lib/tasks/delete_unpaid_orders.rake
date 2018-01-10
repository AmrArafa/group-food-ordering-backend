namespace :delete do
  desc 'Delete unpaid orders'
  task :unpaid_orders => :environment do
    Order.joins(:group).where('orders.group_id IS NOT NULL')
    .where('orders.paid': false)
    .where('groups.time_frame < ?', Time.now.to_datetime).each do |order|
      order.destroy
    end
  end
end