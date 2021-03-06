require 'net/http'

class JsonImporter

  def initialize

    @source = "https://gist.githubusercontent.com/vvo/08850adfc3736869f04bcf5586418add/raw/300a2d9804cfecc549cfd1e209c1e4f25b39dd79/data.json"
    @mobile_appInfo = []
    @errors = []

  end


  def pull_data
    begin
      resp = Net::HTTP.get_response(URI.parse(@source))
      @mobile_appInfo = JSON.parse(resp.body)
      create_assets
    rescue => exception
      @errors << exception.backtrace
      false
    end

    true

  end

  private

  def create_assets
    categories = []
    @mobile_appInfo.each do |app|
      app = MobileApp.create!(
        :category => app['category'],
        :rating => app['rating'],
        :name => app['name'],
        :image => app['image'],
        :link => app['link'],
        :rating_count => app['ratingCount'],
        :price => app['price'],
      )

    end
  end
end
