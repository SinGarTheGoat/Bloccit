class PostsController < ApplicationController
  before_action :require_sign_in, except: :show

  def index
    @posts = Post.all
    end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    # #35
    @post = @topic.posts.build(post_params)
    @post.user = current_user

    if @post.save
      @post.labels = Label.update_labels(params[:post][:labels])
      flash[:notice] = 'Post was saved successfully.'
      # #36
      redirect_to [@topic, @post]
    else

      flash.now[:alert] = 'There was an error saving the post. Please try again.'
      render :new
    end
    end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.assign_attributes(post_params)

    if @post.save
      @post.labels = Label.update_labels(params[:post][:labels])

      flash[:notice] = 'Post was updated successfully.'
      # #37
      redirect_to [@post.topic, @post]
    else
      flash.now[:alert] = 'There was an error saving the post. Please try again.'
      render :edit
    end
    end

  def destroy
    @post = Post.find(params[:id])

    # #8
    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
      # #38
      redirect_to @post.topic

    else
      flash.now[:alert] = 'There was an error deleting the post.'
      render :show
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
