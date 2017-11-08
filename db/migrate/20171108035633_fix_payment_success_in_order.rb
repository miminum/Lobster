class FixPaymentSuccessInOrder < ActiveRecord::Migration[5.1]
  def change
      rename_column :orders, :payment_success, :delivered
  end
  
end
