class SeedAppsData < ActiveRecord::Migration[5.1]
  def up
    importer = JsonImporter.new

    importer.pull_data
  end

  def down
    App.destroy_all
  end
end
