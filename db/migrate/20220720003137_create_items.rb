class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.text :demo_badge
      t.boolean :demo_boolean
      t.text :demo_code
      t.text :demo_country
      t.date :demo_date
      t.datetime :demo_datetime
      t.text :demo_external_image
      t.binary :demo_file
      t.binary :demo_files
      t.text :demo_gravatar
      t.text :demo_markdown
      t.integer :demo_number
      t.text :demo_password
      t.integer :demo_progress_bar
      t.integer :demo_select
      t.text :demo_status
      t.text :demo_text
      t.text :demo_textarea
      t.text :demo_trix

      t.timestamps
    end
  end
end
