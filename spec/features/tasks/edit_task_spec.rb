require 'rails_helper'

RSpec.feature "EditTasks", type: :feature do

  describe 'GET /tasks/1/edit' do
    let!(:user){ User.create!(user_name: 'Cathy', password: '111', admin: false)}
    let!(:task) { user.tasks.create!(title: '1st task', description: '123', end_time: 1.month.from_now, status: 'ongoing') }
    
    context '當使用者編輯任務' do
      it '編輯任務' do 
        visit '/'
        fill_in 'name', with: 'Cathy'
        fill_in 'password', with: '111'
        click_button 'Log In'
        visit '/tasks?locale=zh-TW'
        visit edit_task_path(task)
        fill_in 'task_title', with: '2nd task'     
        click_button('確認送出')
        expect(page).to have_content('更新成功')
      end
    end

    context '檢查是否更新成功' do
      it '確認更新成功' do
        visit '/'
        fill_in 'name', with: 'Cathy'
        fill_in 'password', with: '111'
        click_button 'Log In'
        visit '/tasks?locale=zh-TW'
        visit edit_task_path(task)
        fill_in 'task_title', with: '2nd task'     
        click_button('確認送出')
        expect(page).to have_content('2nd task')
      end
    end
  
  end
end