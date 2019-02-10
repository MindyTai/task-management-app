require 'rails_helper'

RSpec.feature "DestroyTasks", type: :feature do

  describe 'DELETE /tasks/1' do
    let(:user){ User.create!(user_name: 'Cathy', password: '111', admin: false)}

    before do
      user.tasks.create!(title: '1st task', description: '123', end_time: 1.month.from_now, status: 'ongoing') 
    end

    context '當使用者刪除任務' do
      it '刪除任務' do
        visit '/login?locale=zh-TW'
        fill_in 'name', with: 'Cathy'
        fill_in 'password', with: '111'
        click_button 'Log In'
        visit '/tasks?locale=zh-TW'
        click_link('刪除')
        expect(page).to have_content('刪除成功')
      end
    end

  end
end