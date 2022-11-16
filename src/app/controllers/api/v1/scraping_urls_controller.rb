module Api
	module V1
	  class ScrapingUrlsController < ApplicationController
		
		def create
		  url = ScrapingUrl.new(url_params)
		  if url.save
			render json: { status: 'SUCCESS', data: url }
		  else
			render json: { status: 'ERROR', data: url.errors }
		  end
		end


		private

        def url_params
          params.require(:scraping_url).permit(:url)
        end

	  end
	end
end