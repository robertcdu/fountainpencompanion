FactoryBot.define do
  factory :currently_inked do
    user
    inked_on { Date.today }
    before(:create) do |ci|
      user = ci.collected_pen&.user || ci.collected_ink&.user
      ci.user = user if user
      ci.collected_pen ||= create(:collected_pen, user: ci.user)
      ci.collected_ink ||= create(:collected_ink, user: ci.user)
    end
  end
end
