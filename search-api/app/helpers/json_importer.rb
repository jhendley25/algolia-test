require 'net/http'

class JsonImporter

  def initialize(source)

    @source = source
    @appInfo = []
    @errors = []

  end


  def pull_data
    begin
      resp = Net::HTTP.get_response(URI.parse(source))
      @appInfo = JSON.parse(resp.body)
      create_assets
    rescue => exception
      @errors << exception.backtrace
      false
    end

    true

  end

  private

  def create_assets

    @appInfo.each do |app|

      app = App.create!(
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
