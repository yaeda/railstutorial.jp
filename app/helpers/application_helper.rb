module ApplicationHelper

  def prev_button(content)
    nav_button(content, 'prev')
  end

  def next_button(content)
    nav_button(content, 'next')
  end

  private

    # Return the nav button, linked if appropriate.
    def nav_button(content, direction)
      button_path = "buttons/sb_button_#{direction}.png"
      img = image_tag(button_path, :alt => alt(direction))
      path = nav_page_path(content, direction)
      path.nil? ? img : link_to(img, path)
    end

    def alt(direction)
      direction == "next" ? "Next Chapter" : "Previous Chapter"
    end

    # Return the path for the next/previous page.
    # This relies on the structure of the links generated by the chapterize
    # command that comes bundled with PolyTeXnic.
    def nav_page_path(content, direction)
      return nil if @content.nil?
      @content =~ /<a class="#{direction}_page" href="(.*)">/
      $1
    end
end