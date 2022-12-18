require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Static content', type: :system do
  scenario 'Register, login, calculate' do
    visit new_user_path
    fill_in :user_username, with: 'TestUser'
    fill_in :user_password, with: 'test'
    fill_in :user_password_confirmation, with: 'test'
    find('#submit-btn').click
    sleep(0.1)
    expect(current_path).to eq root_path

    visit session_login_path
    fill_in :username, with: 'TestUser'
    fill_in :password, with: 'test'
    find('#submit-btn').click
    fill_in :inpt, with: '1 2 3 4 1 2 3 4 1 2 3 4 5'
    find('#submit-btn').click
    sleep(0.1)
    expect(current_path).to eq '/lab12/show'
  end

  def to_path(path)
    visit path
    sleep(0.5)
    expect(current_path).to eq session_login_path
  end

  scenario 'Check without register' do
    routes = ['/users/1', '/lab12/show', root_path, '/users']
    routes.each do |path|
      sleep(0.5)
      to_path(path)
    end
  end
end
