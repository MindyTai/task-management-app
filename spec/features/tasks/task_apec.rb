require 'rails_helper'

RSpec.feature 'TaskLists', type: :feature do

  describe 'GET /tasks' do
    let(:user){ User.create(user_name: 'Cathy', password: '', admin: '')}

    before do
      user.tasks.create(title: '1st task', description: '123', end_time: 1.month.from_now, status: false) 
    end

    context '檢查任務清單是否有內容' do
      it '顯示內容' do
        visit tasks_path
        expect(page).to have_content('1st task')
      end

      before { Task.destroy_all }
      it '顯示無內容' do
        expect(page).to eq(nil)
      end
    end
  
  end
end