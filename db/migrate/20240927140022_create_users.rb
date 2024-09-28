class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false #データが空の状態で登録されないよう、NOT NULL制約

      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps
      t.index :email, unique: true #同じメールアドレスが登録されないよう、ユニーク制約も設定
    end
  end
end
