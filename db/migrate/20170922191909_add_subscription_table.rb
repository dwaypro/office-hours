class AddSubscriptionTable < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
