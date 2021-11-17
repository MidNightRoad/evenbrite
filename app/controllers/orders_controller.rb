class OrdersController < ApplicationController
  def new
 puts params # Before the rescue, at the beginning of the method
 @user = current_user
 @evenement = Evenement.find_by(id: params[:event_id])
 @amount = @evenement.price
 @stripe_amount = (@amount * 100).to_i
  end

  def create
 # Before the rescue, at the beginning of the method
 @user = current_user
 @evenement = Evenement.find_by(id: params[:event_id])
 @amount = @evenement.price
 @stripe_amount = (@amount * 100).to_i
  begin  
  customer = Stripe::Customer.create({
  email: params[:stripeEmail],
  source: params[:stripeToken],
  })  
  charge = Stripe::Charge.create({
  customer: customer.id,
  amount: @stripe_amount,
  description: "Achat d'un produit",
  currency: 'eur',
  })
  rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_order_path
  # After the rescue, if the payment succeeded

end
end
end

