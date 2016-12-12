class AnswersController < ApplicationController
  def destroy
    debugger
    @answer=Answer.find(id: params[:id])
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Room category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
