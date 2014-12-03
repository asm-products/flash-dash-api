module Api
  module V1
    class ExampleController < ApplicationController
      def index
        render json: {message: 'example'}
      end
    end
  end
end
