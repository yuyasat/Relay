require 'rails_helper'

RSpec.describe 'relay-mangas' do
  before do
    csv_path = Rails.root.join('lib/assets/relay_manga_list.csv')
    RelayManga.import_from_csv(csv_path)
  end

  scenario 'リレー漫画一覧' do
    expect(RelayManga.count).to eq 105

    visit relay_mangas_path

    expect(page).to have_content '恋愛×SF | 恋愛とSFのリレー漫画（仮）'
    expect(page).to have_content '恋愛×スポーツ | スポーツと恋愛のリレー漫画（仮）'
  end
end
