class CastMembersController < ApplicationController
  before_filter :load_movie

  def show
    @cast_member = CastMember.find(params[:id])
  end

  def create
    @cast_member = @movie.cast_member.build(cast_member_params)
    @cast_member.user = current_user

    if @cast_member.save
      redirect_to movies_path, notice: 'Cast Member Saved!'
    else
      render 'movies/show'
    end
  end

  def destroy
    @cast_member = CastMember.find(params[:id])
    @cast_member.destroy
  end

  private
  def cast_member_params
    params.require(:cast_member).permit(:name, :role, :movie_id)
  end

  def load_movie
    @movie = Movie.find(params[:movie_id])
  end
end