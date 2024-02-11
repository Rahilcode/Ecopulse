# Preview all emails at http://localhost:3000/rails/mailers/notifier_mailer
class NotifierMailerPreview < ActionMailer::Preview
    def order_email
        NotifierMailer.with(user: User.first, order: Order.first, service: Service.first, company: Company.first, flag: true).order_email
    end

    def post_email
        NotifierMailer.with(company: Company.first, post: Post.first, user: User.first, flag: false).post_email
    end
end
