class GistQuestionService

  attr_reader :client
  
  def initialize()
    @client = Octokit::Client.new(access_token: ENV['GITHUB_GIST_TOKEN'])
  end
  
  def create_gist(gist)
    @client.post('/gists',  { description:  gist.description, 'public': gist.public,
                              files: { 'testguru_question.txt': {
                              content: gist.content } 
                                      } 
                            })
  end

end