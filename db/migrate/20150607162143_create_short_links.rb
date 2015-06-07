class CreateShortLinks < ActiveRecord::Migration
  def change
    create_table :short_links do |t|
      t.string :original
      t.string :short

      t.timestamps
    end
  end
end
