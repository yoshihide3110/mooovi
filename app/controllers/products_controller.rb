class ProductsController < RankingController
  before_action :authenticate_user!, only: :search
  def index
    @products = Product.order('id ASC').limit(20)
    # productsテーブルから最新順に作品を２０件取得する
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @products = Product.where('title LIKE(?)', "%#{params[:keyword]}%").limit(20)
    respond_to do |format|
      format.html
      format.json
    end
  end
end
