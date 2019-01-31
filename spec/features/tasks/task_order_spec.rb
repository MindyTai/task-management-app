require 'rails_helper'

RSpec.feature "TaskOrder", type: :feature do
  let(:user){ User.create(user_name: 'Cathy', password: '', admin: '') }
  let!(:first_task) { user.tasks.create(title: '1st task', description: '123', end_time: 1.month.from_now, status: 'ongoing') }
  let!(:second_task) { user.tasks.create(title: '2nd task', description: '456', end_time: 2.month.from_now, status: 'pending') }

  describe 'GET /tasks' do
    it '任務列表以建立時間排序' do
      visit tasks_path
      expect(page.body.index(second_task.title)).to be <= page.body.index(first_task.title)
    end

    it '任務列表以結束時間排序' do
      visit '/tasks?date=desc&locale=zh-TW'
      click_link ('依日期升序排序')
      expect(page.body.index(second_task.title)).to be >= page.body.index(first_task.title)
    end

    it '任務列表以加入的狀態查詢'do
      visit tasks_path
      fill_in 'search', with: first_task.title
      select first_task.status, :from => 'status'
      click_button '搜尋'
      expect(page).to have_content('1st task')
    end

  end
end