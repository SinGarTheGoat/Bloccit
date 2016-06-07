class Api::V1::PostsController < Api::V1::BaseController

  before_action :authenticate_user
  before_action :authorize_user
    def create
        post = Post.new(post_params)

        if post.valid?
            post.save!
            render json: post, status: 201
        else
            render json: { error: 'Post is invalid', status: 400 }, status: 400
    end
    # look up topic by params[:topic_id]
    # create a post on the topic
    # if successful return 200 else 400
  end


    def update
        post = Post.find(params[:id])
        topic.posts.find params[:id]
        if post.update_attributes(post_params)
            render json: post, status: 200
        else
            render json: { error: 'Post update failed', status: 403 }, status: 403
        end
        # look up topic by params[:topic_id]
        # look up a post on the topic topic.posts.find params[:id]
        # if successful return 200 else 400
    end


    def destroy
      topic = Topic.find(params[:id])

      if post.destroy
          render json: { message: 'Post destroyed', status: 200 }, status: 200
      else
          render json: { error: 'Post destroy failed', status: 400 }, status: 400
      end

        # look up topic by params[:topic_id]
        # look up a post on the topic topic.posts.find params[:id]
        # call destory on the post
        # return a 200
    end
end
 
