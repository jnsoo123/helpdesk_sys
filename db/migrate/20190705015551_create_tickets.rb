class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :body
      t.string :status, default: 'pending'

      t.timestamps
    end
  end
end
