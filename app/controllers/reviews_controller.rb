class ReviewsController < ApplicationController
  before_action :authenticate_user!,only: [:new]

  def new
    @user = current_user
    @movie = JSON.parse((Tmdb::Movie.detail(params[:movie_id])).to_json)
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if params[:post]
      if @review.save(context: :publicize)
        redirect_to review_path(@review.id)
      else
        render :new, alert: "登録できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    # 下書きボタンを押下した場合
    else
      if @review.update(is_draft: true)
        redirect_to review_path(@review.id)
      else
        render :new, alert: "登録できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    end
    
  end

  def show
    @review = Review.find(params[:id])
    @movie = JSON.parse((Tmdb::Movie.detail(@review.movie_id)).to_json)
    @comment = Comment.new
  end

  def index
    if params[:looking_for].present?
      @reviews = Review.where("title LIKE ?", "%#{params[:looking_for]}%")
    else
      @reviews = Review.all
    end
  end
  
  def edit
    @review = Review.find(params[:id])
    @movie = JSON.parse((Tmdb::Movie.detail(@review.movie_id)).to_json)
  end

  def search
    if params[:looking_for].present?
      @reviews = Review.where("name LIKE ?", "%#{words}%")
    else
      @reviews = Review.all
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to reviews_path
  end
  
  def update
    @review = Review.find(params[:id])
    # ①下書きレシピの更新（公開）の場合
    if params[:publicize_draft]
      # レシピ公開時にバリデーションを実施
      # updateメソッドにはcontextが使用できないため、公開処理にはattributesとsaveメソッドを使用する
      @review.attributes = review_params.merge(is_draft: false)
      if @review.save(context: :publicize)
        redirect_to review_path(@review.id)
      else
        @review.is_draft = true
        render :edit, alert: "公開できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    # ②公開済みレシピの更新の場合
    elsif params[:update_post]
      @review.attributes = review_params
      if @review.save(context: :publicize)
        redirect_to review_path(@review.id)
      else
        render :edit, alert: "更新できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    # ③下書きレシピの更新（非公開）の場合
    else
      if @review.update(review_params)
        redirect_to review_path(@review.id)
      else
        render :edit, alert: "更新できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :star, :body, :movie_id)
  end

end
