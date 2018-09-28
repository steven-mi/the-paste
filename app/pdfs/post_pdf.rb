class PostPdf < Prawn::Document
  def initialize(post)
    super()
    @post=post

    logo

    move_down 20
    post_project_number
    horizontal_rule

    move_down 20
    post_content



  end


  def post_project_number
    text "#{@post.title} [#{@post.project.title}]", size:20 ,style: :bold

  end

  def post_content


    table [["#{@post.body}"]]

  end

  def logo
    text "the-Paste", size:10 ,style: :bold
  end
end
