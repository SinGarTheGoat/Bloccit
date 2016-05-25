class QuestionController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new

  end

  def create
    @question = Question.new(params.require(:question).permit(:title, :body, :resolved))
    if @question.save
      flash[:notice]= "question was saved"
      redirect_to @question
    else
      flash[:error]= "there was an error in saving your question. Please try again."
      render :new
    end

    def edit
      @question = Question.find(params[:id])
    end

    def update
      @question =Question.find(params[:id])
      if @question.update_attributes(params.require(:question).permit(:title,
        :body, :resolvd))
        flash[:notice]="Question was updated"
        redirect_to @question
      else
        flash[:error] ="there was an error please try again"
        render :edit
    end
  end
  def destroy
      @question = Question.find(params[:id])

  # #8
      if @question.destroy
        flash[:notice] = "\"#{@question.title}\" was deleted successfully."
        redirect_to posts_path
      else
        flash.now[:alert] = "There was an error deleting the post."
        render :show
      end
    end

  end
# @question.title = params[:question][:title]
# @question.body = params[:question][:body]
# @question.resolved = params[:question][:resolved]
