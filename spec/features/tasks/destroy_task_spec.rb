require 'rails_helper'

RSpec.feature "DestroyTasks", type: :feature do

  describe 'DELETE /tasks/1' do
    let(:user){ User.create(user_name: 'Cathy', password: '', admin: '')}

    before do
      user.tasks.create(title: '1st task', description: '123', end_time: 1.month.from_now, status: false) 
    end

    context '當使用者刪除任務' do
      it '刪除任務' do
        visit tasks_path
        click_link('Delete')
        expect(page).to have_content('Successfully Deleted')
      end
    end

  end
end