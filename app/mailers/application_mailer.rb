class ApplicationMailer < ActionMailer::Base
  default from: 'zaid.teknuk@gmail.com'
  layout 'mailer'

  def mailer(bug)
  	@bug = bug
  	@url = 'https://trackbug.herokuapp.com'
  	mail to: bug.assign, subject: "Assigned Task #{@bug.title}" do |format|
  		format.text
  	end
  end
end
