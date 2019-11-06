class CreateReferrals < ActiveRecord::Migration[5.2]
  def change
    create_table :referrals do |t|
      t.belongs_to :user
      t.text :email
      t.string :status,       default: 'Referred'
      t.integer :referred_user_id
      t.timestamps
    end
  end
end