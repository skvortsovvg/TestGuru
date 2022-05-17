module ApplicationHelper
  def this_year
    Time.now.year
  end
  def github_url(author, repo)
    link_to "https://github.com/#{author.strip}/#{repo.strip}"
  end
end
