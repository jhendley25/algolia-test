require 'net/http'

class AlgoliaSeeder

  def initialize
    @source = "https://gist.githubusercontent.com/vvo/08850adfc3736869f04bcf5586418add/raw/300a2d9804cfecc549cfd1e209c1e4f25b39dd79/data.json"
    @errors = []

    Algolia.init :application_id => "EKC0TX7X1G",
             :api_key        => "7f643d598eb3f4740c5a922c55400236"
            #  :api_key        => ENV["ALGOLIA_API_KEY"]


    create_index

    push_data

  end

  def create_index
    @index = Algolia::Index.new("apps")
  end

  def push_data
    begin
      resp = Net::HTTP.get_response(URI.parse(@source))
      batch = JSON.parse(resp.body)
      @index.add_objects(batch)
    rescue => exception
      @errors << exception.backtrace
      false
    end

    true

  end

end
