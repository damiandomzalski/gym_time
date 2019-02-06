class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def confirmation_email(email, order_id)
    mail(to: email, subject: "Potwierdzenie zamówienia nr: #{order_id}", body: "#{order_details_name(order_id)} został zamówiony w cenie: #{order_details_price(order_id)} zł. ważny jest #{order_details_days(order_id)} dni od #{order_details_start(order_id)}. ")
  end

 private
  def order_details_name(order_id)
    Order.find(order_id).product.name
  end

  def order_details_price(order_id)
    Order.find(order_id).product.price
  end

  def order_details_days(order_id)
    Order.find(order_id).product.days
  end

  def order_details_start(order_id)
    Order.find(order_id).ticket.created_at.strftime("%d/%m/%y")
  end
end
