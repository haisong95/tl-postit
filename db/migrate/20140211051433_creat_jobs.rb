class CreatJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.text :name
      t.text :description
      t.text :feature
      t.text :challenge
      t.text :salary
    end
  end
end
