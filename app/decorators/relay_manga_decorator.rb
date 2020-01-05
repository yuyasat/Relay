class RelayMangaDecorator < Draper::Decorator
  delegate_all

  def title_for_list
    if status_draft?
      "#{genres.map(&:name).join('×') } | （タイトル未定）"
    else
      "#{genres.map(&:name).join('×') } | #{title}"
    end
  end
end
