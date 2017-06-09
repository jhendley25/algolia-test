class App < ApplicationRecord
  before_destroy :find_and_remove_from_algolia_index
  after_create :add_to_algolia_index

  def find_and_remove_from_algolia_index
    index = Algolia::Index.new("apps")

    # for the purposes of this test app, I'm going to assume that app names are unique
    index.delete_by_query(name)
  end

  def add_to_algolia_index
    index = Algolia::Index.new("apps")

    index.add_object(self.as_json)
  end

end
