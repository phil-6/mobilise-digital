class CreateJobApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :job_applications do |t|
      t.belongs_to :user
      t.belongs_to :job
      t.text :cover
      t.string :status
      t.text :status_reason
      t.timestamps
    end
  end
end