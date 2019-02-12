require 'rails_helper'  

RSpec.feature "CreateTasks", type: :feature do 

  describe 'POST /tasks' do
    let!(:current_user){ User.create(user_name: 'Cathy', password: '111', admin: false)}

    context '當使用者新增任務' do
      it '新增任務' do
        visit '/login?locale=zh-TW'
        fill_in 'name', with: 'Cathy'
        fill_in 'password', with: '111'
        click_button 'Log In'
        visit '/tasks?locale=zh-TW'
        visit new_task_path
        fill_in 'task_title', with: '1st task'
        fill_in 'task_description', with: 'walk the dog'
        fill_in 'task_end_time', with: '2019-12-23 00:00:00 UTC'
        expect(page).to have_select('task_status', :options => ['ongoing', 'pending', 'finished'])
        select 'ongoing', :from => 'task_status'
        click_button('確認送出')
      end

      it'確認新增任務'do
        visit '/login?locale=zh-TW'
        fill_in 'name', with: 'Cathy'
        fill_in 'password', with: '111'
        click_button 'Log In'
        visit '/tasks?locale=zh-TW'
        visit new_task_path
        fill_in 'task_title', with: '1st task'
        fill_in 'task_description', with: 'walk the dog'
        fill_in 'task_end_time', with: '2019-12-23 00:00:00 UTC'
        select 'ongoing', :from => 'task_status'
        click_button('確認送出')
        visit tasks_path
        expect(page).to have_content('1st task')
      end
    end
    
  end
end