module ApplicationHelper
  def this_year
    Time.now.year
  end
  def github_url(author, repo)
    # "https://github.com/"skvortsovvg/TestGuru
    "https://github.com/#{author.strip}/#{repo.strip}"
  end
end
