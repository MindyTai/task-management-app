require 'rails_helper'

RSpec.describe Task, type: :model do

  let(:user){ User.create(user_name: 'Cathy', password: '111', admin: false) }
  let(:first_task) { user.tasks.create(title: '1st task', description: '123', end_time: 1.month.from_now, status: 'ongoing', priority: 'low') }
  let(:second_task) { user.tasks.create(title: '', description:'111', end_time: '', status: '', priority: 'low') }
  let(:third_task) { user.tasks.create(title: '1st task', description: '123', end_time: 1.month.from_now, status: 'ongoing', priority: '') }
  let(:status) { [:ongoing, :finished, :pending] }
  
  it 'is acessible' do
    expect(first_task).to eq(Task.last)
  end

  it 'has title, description, end_time, status columns' do
    columns = Task.column_names
    expect(columns).to include("title")
    expect(columns).to include("description")
    expect(columns).to include("end_time")
    expect(columns).to include("status")
  end

  it 'validates title, description, end_time, status columns' do
    expect(first_task).to be_valid
    expect(second_task).not_to be_valid
    expect(third_task).not_to be_valid
    expect(first_task.title.length).to be > 2
    status.each_with_index do |item, index|
      expect(described_class.statuses[item]).to eq index
    end
  end

end