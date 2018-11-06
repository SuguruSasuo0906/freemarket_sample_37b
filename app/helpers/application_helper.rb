module ApplicationHelper
  def create_header
    return render "mypages/mypage.header"
  end

  def create_footer
    return render "mypages/mypage.footer"
  end
end
