class FetchReviews
  class SubmitReview
    include Sidekiq::Worker
    sidekiq_options queue: "reviews"

    def perform(url, macro_cluster_id)
      macro_cluster = MacroCluster.find_by(id: macro_cluster_id)
      submit_review(url, macro_cluster)
    end

    private

    def submit_review(url, macro_cluster)
      CreateInkReviewSubmission.new(
        url: url,
        user: user,
        macro_cluster: macro_cluster,
        automatic: true
      ).perform
    end

    def user
      @user ||= User.find_by(email: Admin.first.email)
    end
  end
end
