require 'rails_helper'

RSpec.feature "EditTasks", type: :feature do

  let(:user){ User.create(user_name: 'Cathy', password: '', admin: '')}
  let(:task) { user.tasks.create(title: '1st task', description: '123', end_time: 1.month.from_now, status: 'unfinished') }

  describe '編輯任務' do
    it '編輯任務' do 
      visit edit_task_path(task)
      fill_in 'task_title', with: '2nd task'     
      click_button('Update Task')
      expect(page).to have_content('資料更新成功!')
      expect(page).to have_content('2nd task')
    end
  end

end