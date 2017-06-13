class SeedAppsData < ActiveRecord::Migration[5.1]
  def up
    importer = JsonImporter.new

    importer.pull_data
  end

  def down
    MobileApp.destroy_all
  end
end
