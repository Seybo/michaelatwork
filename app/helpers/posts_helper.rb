module PostsHelper
  def truncate_post(post_body, sep = '&sep')
    post_body.truncate_words(1, separator: sep)
  end

  def remove_separator(post_body, sep = '&sep')
    post_body.gsub(sep, '')
  end
end
