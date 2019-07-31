class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.date :published_date
      t.date :latest_start_date
      t.date :award_date
      t.string :contract_length
      t.integer :day_rate
      t.text :working_arrangements
      t.string :address_company
      t.string :address_1
      t.string :address_2
      t.string :address_town
      t.string :address_county
      t.string :address_postcode
      t.text :team
      t.text :requirements
      t.boolean :open,  default: false

      t.timestamps
    end
  end
end
