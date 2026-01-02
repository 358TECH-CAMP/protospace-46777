class PrototypesController < ApplicationController
  # ログインしていない場合は index と show のみアクセス可能
  before_action :authenticate_user!, except: [:index, :show]
# 投稿者本人しか編集・更新・削除できないようにする
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  # トップページ用：全プロトタイプを取得
  def index
    @prototypes = Prototype.includes(:user).order(created_at: :desc)
  end

  # 新規投稿ページ
  def new
    @prototype = Prototype.new
  end

  # 投稿の保存
  def create
    @prototype = current_user.prototypes.build(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: "プロトタイプを投稿しました"
    else
      render :new
    end
  end

  # 詳細ページ
  def show
  @comment = Comment.new
  @comments = @prototype.comments.includes(:user)

  end

  # 編集ページ
  def edit
    # @prototype は set_prototype で取得済み
  end

  # 更新処理
  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype), notice: "プロトタイプを更新しました"
    else
      render :edit
    end
  end

  # 削除
  def destroy
    @prototype.destroy
    redirect_to root_path, notice: "プロトタイプを削除しました"
  end


  private

  # 投稿の取得を共通化
  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  # 投稿者本人でなければトップページにリダイレクト
  def move_to_index
    redirect_to root_path unless @prototype.user_id == current_user.id
  end

  # ストロングパラメーター
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image)
  end
end



 