class RelayMangasController < ApplicationController
  def index
    @relay_mangas = RelayManga.all.includes(:genres)
  end

  def show
    @relay_manga = RelayManga.find_by(id: params[:id])
  end

  def update
    return redirect_to root_path unless current_user

    @relay_manga = RelayManga.find_by(id: params[:id])
    MangaFrame.create(
      { user: current_user, relay_manga: @relay_manga }.merge(manga_frame_params)
    )

    redirect_to action: :show
  end

  private

  def manga_frame_params
    params.require(:manga_frame).permit(:meta)
  end
end
