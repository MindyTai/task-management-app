require 'rails_helper'

RSpec.feature "TaskOrder", type: :feature do
  let(:user){ User.create(user_name: 'Kat', password: '111', admin: false) }
  let!(:first_task) { user.tasks.create(title: '1st task', description: '123', end_time: 1.month.from_now, status: 'ongoing', priority: 'low') }
  let!(:second_task) { user.tasks.create(title: '2nd task', description: '456', end_time: 2.month.from_now, status: 'pending', priority: 'medium') }

  describe 'GET /tasks' do
    it '任務列表以建立時間排序' do
      visit '/'
      fill_in 'name', with: 'Kat'
      fill_in 'password', with: '111'
      click_button 'Log In'
      visit '/tasks?locale=zh-TW'
      expect(page.body.index(second_task.title)).to be <= page.body.index(first_task.title)
    end

    it '任務列表以結束時間升序/降序排序' do
      visit '/'
      fill_in 'name', with: 'Kat'
      fill_in 'password', with: '111'
      click_button 'Log In'
      visit '/tasks?locale=zh-TW'
      click_link ('依日期升序排序')
      expect(page.body.index(second_task.title)).to be >= page.body.index(first_task.title)
    end

    it '任務列表以加入的狀態查詢' do
      visit '/'
      fill_in 'name', with: 'Kat'
      fill_in 'password', with: '111'
      click_button 'Log In'
      visit '/tasks?locale=zh-TW'
      fill_in 'search', with: first_task.title
      select first_task.status, :from => 'status'
      click_button '搜尋'
      expect(page).to have_content('1st task')
    end

    it '任務列表以加入的優先順序查詢' do
      visit '/'
      fill_in 'name', with: 'Kat'
      fill_in 'password', with: '111'
      click_button 'Log In'
      visit '/tasks?locale=zh-TW'
      select first_task.priority, :from => 'priority'
      click_button '搜尋'
      expect(page).to have_content('1st task')
    end

    it '依優先順序升序/降序排序' do
      visit '/'
      fill_in 'name', with: 'Kat'
      fill_in 'password', with: '111'
      click_button 'Log In'
      visit '/tasks?locale=zh-TW'
      click_link ('依優先順序升序排序')
      expect(page.body.index(second_task.title)).to be >= page.body.index(first_task.title)
    end
    
  end
end