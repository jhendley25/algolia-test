require 'net/http'

class JsonCollectionImporter
  attr_accessor :source, :user, :collection_title, :errors

	  def initialize(source, user_id, collection_title = nil)

	    @source = source
	    @collection_title = collection_title
	    @collectionInfo = []
	    @errors = []
      @user_id = user_id

	  end


	  def pull_data
	  	begin
  			resp = Net::HTTP.get_response(URI.parse(source))
  			@collectionInfo = JSON.parse(resp.body)
  			create_assets
  		rescue => exception
  			@errors << exception.backtrace
  			false
  		end

  		true

	  end

	private

	  def create_assets

	  	@collection_title ||= @collectionInfo['title']

	  	defaultSharedCollection = Collection.create!( :title => @collection_title,
	  												  :cover => @collectionInfo['cover'],
	  												  :user_id => @user_id,
	  												)

  		@collectionInfo['moments'].each do |momentInfo|

	  		moment = Moment.create!(

	  			:user_id => @user_id,
	  			:type_name => momentInfo['type_name'],
	  			:meta => momentInfo['meta'],
	  			:given_date => momentInfo['given_date'],
	  			:description => momentInfo['description'],
	  			:dropbox_path => momentInfo['dropbox_path'],

	  		)

	  		if locationInfo = @collectionInfo['moments'][0]['location']

	  			location = Location.create!( :user_id => @user_id,
	  										 :lat => locationInfo['lat'],
	  										 :lng => locationInfo['lng'],
	  										 :meta => locationInfo['meta'],
	  										 :name => locationInfo['name'],
	  										)
	  			moment.location = location
	  	    	moment.save
	  	    end

	  		defaultSharedCollection.moments << moment

  		end



	  end


end
