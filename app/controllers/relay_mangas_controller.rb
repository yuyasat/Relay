class RelayMangasController < ApplicationController
  def index
    @relay_mangas = RelayManga.all
  end
end
