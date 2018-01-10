class DeleteUnpaidSingleOrdersJob < ApplicationJob
  queue_as :default

  def perform(*args)
  		order = args[0]
  		if order.paid == false
      	order.destroy
     	DeleteUnpaidSingleOrdersJob.set(wait: 10.minutes).perform_later(order)
     end
  end
end
