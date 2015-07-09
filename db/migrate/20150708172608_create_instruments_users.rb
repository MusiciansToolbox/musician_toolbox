class CreateInstrumentsUsers < ActiveRecord::Migration
  create_table :instruments_users, id: false do |t|
    t.belongs_to :user, index: true
    t.belongs_to :instrument, index: true
  end
end
