ActiveRecord::Schema.define do
  create_table :users, :force => true do |t|
    t.string    :email_address
    t.string    :name
    t.string    :state
    t.datetime  :name_updated_at
    t.datetime  :state_updated_at
    t.timestamps
  end
end