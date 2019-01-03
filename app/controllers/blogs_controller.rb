class BlogsController < ApplicationController

  def show
    @blog = Blog.friendly.find_by slug: params[:id]
    @recipent = @blog
  end

  def new
    @blog = current_user.blogs.build if user_signed_in?
  end

  def index
    @pagy, @blogs = pagy Blog.order_by_created.select_blog
  end

  def create
    @blog = current_user.blogs.build blog_params
    if @blog.save
      flash[:success] = t ".created_sucess"
      redirect_to blogs_path
    else
      render "static_pages/home"
    end
  end

  private
    def blog_params
      params.require(:blog).permit :title, :body, :author, :date, :description, :auth_link
    end
end
