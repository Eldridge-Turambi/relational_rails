require 'rails_helper'

RSpec.describe 'home page' do
  before do
    visit '/'
  end

  it 'visits the home page' do

    expect(current_path).to eq('/')
    expect(page).to have_content('Welcome to our website')
  end
end
