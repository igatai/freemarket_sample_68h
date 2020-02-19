module ProductsHelper
  def text_placeholder(row1,row2)
    <<-"EOS".strip_heredoc
      #{row1}
      #{row2}
    EOS
  end
end
