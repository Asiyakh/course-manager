class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.references :account
      t.references :course
      t.timestamps
    end
  end
end
