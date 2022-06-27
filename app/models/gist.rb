class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :author, class_name: "User"
end


# client = Octokit::Client.new(:access_token => "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")
# client.post('/gists', {
#   description: 'Example of a gist',
#   'public': false,
#   files: {
#   'README.md': {
#     content: 'Hello World'
#     } 
#   }
# })
