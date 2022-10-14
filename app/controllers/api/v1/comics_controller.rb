module Api
  module V1
    class ComicsController < ApplicationController
      def create
        result = CreationEntities::ComicService.new(comic: filter_params).call

        if result.success?
          render json: { message: 'successfully created comic' }, status: :ok
        else
          render json: { :errors => result.errors }, status: :unprocessable_entity
        end
      end

      def comics
        @pagy, @comics = pagy(Comic.order(id: :asc), items: 10)
        render json: { data: @comics, metadata: pagy_metadata(@pagy) }, status: :ok
      end

      def comic
        comic = Comic.find_by(comic_id: params[:id])
        render json: { data: comic }, status: :ok
      end

      private

      def filter_params
        params.require(:serie_id).permit(:id, :title, :isbn, :description, :resourceURI, :pageCount)
      end
    end
  end
end
