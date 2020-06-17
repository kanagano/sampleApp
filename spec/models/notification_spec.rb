require 'rails_helper'

RSpec.describe Notification, type: :model do
  it "has a valid factory" do
    notif = FactoryBot.create(:notification)
    puts "This notif's post is #{notif.post.inspect}"
    puts "This notif's visited is #{notif.visited.inspect}"
    puts "This notif's visitor is #{notif.visitor.inspect}"
    puts "This notif is #{notif.inspect}"
    expect(notif).to be_valid
  end

  it "is invalid with an unspecified action" do
    expect(FactoryBot.build(:notification, action: "hoge")).to_not be_valid
  end

  describe "dependent: :destroy" do
    before do
      @notification = FactoryBot.create(:notification)
    end
    it "is destroyed when a post is destroyed" do
      @notification.post.destroy
      expect(Notification.find_by(id: 1)).to be_nil
    end
    it "is destroyed when a visitor is destroyed" do
      @notification.visitor.destroy
      expect(Notification.find_by(id: 1)).to be_nil
    end
  end

  describe "create_notification_like method" do
    before do
      @post = FactoryBot.create(:post)
      @current_user = FactoryBot.create(:user)
    end
    context "a temp already exists" do
      it "doesn't make a notification" do
        notification1 = Notification.create(
          visitor_id: @current_user.id,
          visited_id: @post.user_id,
          post_id: @post.id,
          action: "like"
        )
        puts "notification1 is #{notification1.inspect}"
        @post.create_notification_like(@current_user)
        notification = Notification.find_by(id: 2)
        expect(notification).to be_nil 
      end
    end
    context "no temp exists" do
      it "makes a valid notification" do
        @post.create_notification_like(@current_user)
        notification = Notification.find_by(id: 1)
        expect(notification).to be_valid
      end
      it "makes a valid checked notification" do
        @post.create_notification_like(@post.writer)
        notification = Notification.find_by(id: 1)
        expect(notification.checked).to eq true
      end
    end
  end
end
