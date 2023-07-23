class ReviewsController < ApplicationController
  before_action :authenticate_user!,only: [:new]

  def new
    @movie = JSON.parse((Tmdb::Movie.detail(params[:movie_id])).to_json)
    @review = Review.new
  end

  def create
    p params
    @review = ReviewForm.new(params[:review_form])
    @review.user_id = current_user.id
    @tags = params[:review_form]&.fetch(:tags, '').split(',')
    p params
    p @review
    if params[:post]
      if @review.save
        @tags.each do |new_tag|
          tag = Tag.find_or_create_by(name: new_tag)
          Review_tag.create(review: @review_form, tag: tag)
        end
        redirect_to review_path(@review.id)
      else
        @movie = JSON.parse((Tmdb::Movie.detail(params[:review_form][:movie_id])).to_json)
        flash.now[:alert] = "登録できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
        render :new
      end
    # 下書きボタンを押下した場合
    else
      if @review.update(is_draft: true)
        redirect_to review_path(@review.id)
      else
        @movie = JSON.parse((Tmdb::Movie.detail(params.movie_id)).to_json)
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
    #検索を未入力の状態だとすべて表示される
    if params[:looking_for].present?
      if params[:range] == "タイトル"
        @reviews = Review.where("title LIKE ?", "%#{params[:looking_for]}%")
      else
        @users = User.where("name LIKE ?", "%#{params[:looking_for]}%")
        @reviews = Review.where(user_id: @users.ids)
      end
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
    params.require(:review_form).permit(:title, :star, :body, :movie_id, :tags)
  end

end
