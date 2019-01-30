require 'rails_helper'

RSpec.feature "TaskOrder", type: :feature do
  let(:user){ User.create(user_name: 'Cathy', password: '', admin: '') }
  let!(:first_task) { user.tasks.create(title: '1st task', description: '123', end_time: 1.month.from_now, status: false) }
  let!(:second_task) { user.tasks.create(title: '2nd task', description: '456', end_time: 2.month.from_now, status: false) }

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
  end
end