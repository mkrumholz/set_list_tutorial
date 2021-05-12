require 'rails_helper'

RSpec.describe 'songs show' do
  before(:each) do
    @artist = Artist.create(name: 'Carly Rae Jepsen')
    @song_1 = @artist.songs.create!(title: "I Really Like You",
                         length:      208,
                         play_count:  243810867)
    @song_2 = @artist.songs.create!(title: "Call Me Maybe",
                         length:      199,
                         play_count:  1214722172)
  end

  it 'displays the song title' do
    visit "/songs/#{@song_1.id}"

    expect(page).to have_content(@song_1.title)
    expect(page).to_not have_content(@song_2.title)
  end

  it 'displays the artist name' do
    visit "/songs/#{@song_1.id}"

    expect(page).to have_content(@artist.name)
  end

  it 'takes me back to the songs index page' do
    visit "/songs/#{@song_1.id}"

    click_on 'Song Index'

    expect(page).to have_content("Songs")
  end
end
