require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  # describe "account_activation" do
  #   let(:mail) { UserMailer.account_activation }

  #   it "renders the headers" do
  #     expect(mail.subject).to eq("Account activation")
  #     expect(mail.to).to eq(["to@example.org"])
  #     expect(mail.from).to eq(["from@example.com"])
  #   end

  #   it "renders the body" do
  #     expect(mail.body.encoded).to match("Hi")
  #   end
  # end

  describe "password_reset" do
    user = User.find_by(email: 'to@example.org')
    user.create_reset_digest
    let(:mail) { UserMailer.password_reset user }

    it "renders the headers" do
      expect(mail.subject).to eq("Password reset")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["tamubersafety@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to include("To reset your password click the link below:")
    end
  end

end
