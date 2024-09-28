# ヘルパーモジュール（SessionsHelper）は通常、その名前に対応するビューとコントローラでのみ自動的に利用できるように設計されています。
module SessionsHelper
  # ログイン中のユーザ情報を取得
  def current_user
  @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
  #  
  def logged_in? #メソッド名に?を指定した場合、そのメソッドは真偽値を返す
  current_user.present?
  end

  # ユーザ登録した際にログインも同時に実行される
  # このメソッドをユーザが登録された際に呼び出すことで、ログインも同時に行うことができます
  def log_in(user)
  # セッションオブジェクトを使って、現在ログインしているユーザーのIDをセッションに保存
  session[:user_id] = user.id
  end

  # ログイン中のユーザであれば、他のユーザの詳細画面を閲覧することができてしまいます
  # それを防ぐために本人しか詳細画面にアクセスできないよう制限を追加
  def current_user?(user)
    user == current_user
  end

end
