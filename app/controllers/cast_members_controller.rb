class CastMembersController < ApplicationController
  before_filter :load_movie
  before_filter :ensure_logged_in, only: [:create, :destroy]

  def show
    @cast_member = CastMember.find(params[:id])
  end

  def create
    @cast_member = @movie.cast_members.build(cast_member_params)
    

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