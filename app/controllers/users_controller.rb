class UsersController < ApplicationController
  # ユーザーが未ログインの状態でアクセス可能なページを設定
  # ユーザー登録用のnewやcreateアクションではlogin_requiredメソッドが実行されないように設定
  skip_before_action :login_required, only: [:new, :create]

  # showアクションが呼ばれた際、correct_userメソッドを先に実行する
  before_action :correct_user, only: [:show]

  #
  def new
    #新しいUserモデルのインスタンスを作成し、登録フォームで使用できるようにします。
    @user = User.new
  end

   # 
   def create
      @user = User.new(user_params)#登録フォームの入力値を持つインスタンスを作成し、@userに入る
      if @user.save
        # log_in(user)メソッドをユーザが登録された際に呼び出すことで、ログインも同時に行うことができます
        log_in(@user)
        # ユーザ登録に成功した場合の処理
        redirect_to user_path(@user.id)
      else
        puts @user.errors.full_messages # エラーメッセージをコンソールに表示
        # ユーザ登録に失敗した場合の処理:再び登録画面が表示
        render :new
      end
   end
  
      #パラメータに含まれるidを使ってユーザを特定することで、そのユーザの詳細画面を表示
      def show
        @user = User.find(params[:id])
      end
   #登録フォームの入力値は、ストロングパラメータparamsを使って取得
   
   
   private

   def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation)
   end

  # 本人しか詳細画面にアクセスできないよう制限を追加
  def correct_user
    @user = User.find(params[:id])
    # パラメータのidを使ってデータベースからユーザを取り出し、current_user?メソッドの引数に渡すことで、アクセス先が本人のものか確認しています。
    # 本人ではなかった場合、そのユーザの詳細画面に遷移させます。
    redirect_to current_user unless current_user?(@user)
  end

end
