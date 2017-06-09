class SeedAlgoliaSearchData < ActiveRecord::Migration[5.1]
  def up
    AlgoliaSeeder.new
  end

  def down
    # TODO not sure what to do here - I guess I should destroy the index. maybe add that as a method on the seeder
  end
end
