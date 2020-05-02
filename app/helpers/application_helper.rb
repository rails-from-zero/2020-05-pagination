module ApplicationHelper
  def paginate(result)
    content_tag :div, class: "pagination" do
      concat(
        render_pagination_link "previous",
                               result.current_page - 1,
                               result.current_page <= 1
      )
      concat(
        render_pagination_link "next",
                               result.current_page + 1,
                               result.current_page >= result.total_pages
      )
    end
  end

  def render_pagination_link(label, page, disabled)
    content_tag :span, class: ("disabled" if disabled) do
      link_to_unless disabled, label, posts_path(page: page)
    end
  end
end
