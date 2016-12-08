class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  def new
  end

  def create
    @category=Category.find(params[:question][:category_id])
    @question=Question.new(question_params);
    if @question.save
      flash[:success]="Create question success"
      redirect_to @category
    else
      flash[:danger]="Create question fail"
      redirect_to @category
    end
  end

  def edit
  end

  def update

  end

  def destroy
    @category=@question.category
    if @question.destroy
      flash[:success] = "Destroy question success"
      respond_to do |format|
        format.html { redirect_to @category}
      end
    else
      flash[:danger] = "Destroy question fail"
      respond_to do |format|
        format.html { redirect_to @category}
      end
    end
  end

  private
  def question_params
    params.require(:question).permit(:category_id, :content, answers_attributes: [ :content, :is_correct, :_destroy ])
  end

  def set_question
      @question = Question.find(params[:id])
  end
end
