class DeleteUnpaidSingleOrdersJob < ApplicationJob
  queue_as :default

  def perform(*args)
  		order = args[0]
      if order.paid_online == false && order.will_pay_on_delivery == false
      	order.destroy
      else
     	DeleteUnpaidSingleOrdersJob.set(wait: 10.minutes).perform_later(order)
     end
  end
end
