class EmailProcessor
  def initialize(email)
      @email = email
  end

  def process
    user = User.find_by_email(@email.from[:email])
    topic = user.topics.create(title: 'Emailed Bookmarks')
    user.bookmarks.create!(
      title: @email.subject,
      url: @email.body,
      topic: topic
    )
  end
end
