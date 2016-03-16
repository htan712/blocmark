class EmailProcessor
  def initialize(email)
      @email = email
  end

  def process
    user = User.find_by_email(@email.from[:email])
    user.bookmarks.create!(
      title: @email.subject,
      url: @email.body
    )
  end
end
