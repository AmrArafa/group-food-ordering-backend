class DeleteUnpaidOrdersJob < ApplicationJob
  queue_as :default

  def perform(*args)
  	order = args[0]
  	if 	order.group.time_frame < Time.now.strftime('%Y-%m-%d %H:%M:%S') &&  order.paid_online == false && order.will_pay_on_delivery == false
      	order.destroy
  	else
     	DeleteUnpaidOrdersJob.set(wait: 1.minute).perform_later(order)
    end
       
  end
      
 end
