module Api
  module V1
    class PostsController < ApplicationController
      def index
        posts = Post.where(published: true)
        render json: posts, each_serializer: PostSerializer
      end
      
      def show
        post = Post.find_by(id: params[:id], published: true)
      
        if post
          render json: post, serializer: PostSerializer
        else
          render json: { error: "Post not found or unpublished" }, status: :not_found
        end
      end      
    end
  end
end
