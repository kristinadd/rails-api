# app/controllers/api/public/posts_controller.rb
module Api
  module Public
    class PostsController < ApplicationController
      before_action :ensure_json_request

      def index
        posts = Post.where(published: true)
        render json: posts, status: :ok
      end

      def show
        post = Post.find(params[:id])
        if post.published
          render json: post, status: :ok
        else
          render json: { error: 'Post not published' }, status: :forbidden
        end
      end

      private

      def ensure_json_request
        return if request.format.json?
        render plain: 'Only JSON requests are allowed', status: 406
      end
    end
  end
end

# This ensures only published posts are exposed via the public API.