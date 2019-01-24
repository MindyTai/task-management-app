require 'rails_helper'

RSpec.feature "DestroyTasks", type: :feature do
  describe '刪除任務' do
    let(:user){ User.create(user_name: 'Cathy', password: '', admin: '')}
    let(:task) { user.tasks.create(title: '1st task', description: '123', end_time: 1.month.from_now, status: 'unfinished') }

    it '刪除任務' do
      visit tasks_path(task)
      expect(page).to have_link('刪除')
      click_link('刪除')
      expect(page).to have_content('任務已刪除！')
    end
    
  end
end