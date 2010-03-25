silence_stream(STDOUT) do
  ActiveRecord::Schema.define do
    create_table :users, :force => true do |t|
      t.string    :email_address
      t.string    :name
      t.string    :state
      t.string    :role, :default => 'user'
      t.datetime  :name_updated_at
      t.datetime  :state_updated_at
      t.datetime  :role_updated_at
      t.timestamps
    end
  end
end
