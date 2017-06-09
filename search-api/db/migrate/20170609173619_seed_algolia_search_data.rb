class SeedAlgoliaSearchData < ActiveRecord::Migration[5.1]
  def up
    AlgoliaSeeder.new
  end

  def down
    @index = Algolia::Index.new("apps")
    @index.clear!
  end
end
