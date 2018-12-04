class EmotionsController < ApplicationController
  def create
    @cosmetic = Cosmetic.find_by id: params[:cosmetic_id]
    current_user.like @cosmetic
    respond_to do |format|
      format.html { redirect_to cosmetic_path(@cosmetic) }
      format.js
    end
  end

  def destroy
    @cosmetic = Emotion.find_by(params[:id]).cosmetic
    current_user.unlike @cosmetic
    respond_to do |format|
      format.html { redirect_to cosmetic_path(@cosmetic) }
      format.js
    end
  end

end
