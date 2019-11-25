class AddWebAddressToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :web_address, :string
  end
end
