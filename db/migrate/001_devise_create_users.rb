# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      # Customisation
      t.string :first_name,  null: false, default: ""
      t.string :last_name,   null: false, default: ""
      t.string :contact_phone

      t.boolean :admin,       default: false

      t.string :address_company
      t.string :address_1
      t.string :address_2
      t.string :address_town
      t.string :address_county
      t.string :address_postcode

      t.string :emergency_name
      t.string :emergency_relationship
      t.string :emergency_number
      t.string :emergency_email

      t.boolean :gdpr_agreement
      t.boolean :job_email_agreement
      t.boolean :marketing_email_agreement
      t.boolean :website_terms_agreement
      t.boolean :contractor_terms_agreement

      t.boolean :verified,                  default: false
      t.boolean :cv_uploaded
      t.datetime :cv_uploaded_date
      t.string :cv_url
      t.boolean :sa_uploaded
      t.datetime :sa_uploaded_date
      t.string :sa_url

      t.string :keywords, array: true
      t.string :secondary_keywords

      t.integer :profile_completion

      t.datetime :deleted_at
      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
