class CreateJobApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :job_applications do |t|
      t.belongs_to :user
      t.belongs_to :job
      t.text :cover
      t.string :status,       default: 'open'
      t.text :status_reason
      t.boolean :project_terms_agreement
      t.timestamps
    end
  end
end