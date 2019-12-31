class RelayMangasController < ApplicationController
  def index
    @relay_mangas = RelayManga.all.includes(:genres)
  end

  def show
    @relay_manga = RelayManga.find_by(id: params[:id])
  end
end
