class GistQuestionService

  def initialize()

    @client = Octokit::Client.new(:access_token => ENV['GITHUB_GIST_TOKEN'])

  end

  def create_gist(data)
    
    gist = Gist.new(
      question: data.current_question, 
      author: data.user,
      content: "#{data.current_question.body}\n" + data.current_question.answers.pluck(:body).join("\n"),
      description: I18n.t('.gist_discription'),
      public: true)

    begin
      res = @client.post('/gists', gist_params(gist))
      gist.id = res.id
      if gist.save
        { key: :success, value: "#{I18n.t('.new_gist')}:  <a href=#{res.html_url} target='_blank'>#{gist.id}</a>" } 
      else 
        { key: :alert, value: gist.errors.full_messages.join("\n") } 
      end
    rescue => details
      { key: :alert, value: "#{I18n.t('.gist_error')}: #{details.message}" } 
    end

  end
  
  def gist_params(gist)
      { description:  gist.description, 'public': gist.public,
        files: { 'testguru_question.txt': {
        content: gist.content } 
                } 
      }
  end

end