require 'rails_helper'

RSpec.describe User, type: :model do

  let(:first_user){ User.create(user_name: 'Cathy', password: '111', admin: false) }
  let(:second_user){ User.create(user_name: 'Cathy', password: '123', admin: false) }
  let(:task) { Task.create(title: '1st task', description: '123', end_time: 1.month.from_now, status: 'ongoing') }

  it 'validates user_name' do
    expect(first_user).to be_valid
    expect(second_user).not_to be_valid 

    first_user.tasks << task
    first_user.tasks.should == [task]
  end
end